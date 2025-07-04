#!/bin/bash

NOTE=$(cat $HOME/.docs/todos.md)

printf '{"tooltip": "%s"}' "$(echo $NOTE)"

