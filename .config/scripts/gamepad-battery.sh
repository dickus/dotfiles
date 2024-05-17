#!/bin/sh

BATTERY=$(upower -e | grep "gip")

upower -e | grep "gip"
upower -i $BATTERY | grep "model"
upower -i $BATTERY | grep "percentage"
