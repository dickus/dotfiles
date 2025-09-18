#!/usr/bin/env bash

STATUS=$(pidof wf-recorder)

if [[ "${1}" == "game" ]]; then
    SYS_SOURCE="Games.monitor"
else
    SYS_SOURCE=$(pactl get-default-sink).monitor
fi

if [[ -z ${STATUS} ]]; then
    MIC_SOURCE=$(pactl get-default-source)

    DATE=$(date +%F_%H-%M-%S)
    ACODEC=flac
    ACONT=".flac"
    FPS=60
    VCODEC=hevc_nvenc
    VCONT=".mkv"

    OUTPUT_DIR="${HOME}/Videos/DVR/Recordings/${DATE}"

    mkdir -p ${OUTPUT_DIR}

    wf-recorder \
        -r ${FPS} -c ${VCODEC} -p preset=p1 -p rc=vbr -p cq=30 \
        -p bitrate=50000k -p maxrate=50000k -p bufsize=100000k \
        -f ${OUTPUT_DIR}/${DATE}${VCONT} &

    ffmpeg \
        -f pulse -ac 2 -ar 44100 -i ${SYS_SOURCE} \
        -map 0:a -c:a:0 ${ACODEC} \
        ${OUTPUT_DIR}/"${DATE}_sound${ACONT}" &

    ffmpeg \
        -f pulse -ac 1 -ar 44100 -i ${MIC_SOURCE} \
        -map 0:a -c:a:0 ${ACODEC} \
        -af "pan=mono|c0=c0" \
        ${OUTPUT_DIR}/"${DATE}_mic${ACONT}" &
else
    pkill -INT wf-recorder
    pkill -INT ffmpeg

    sleep 2
fi

