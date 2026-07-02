#!/bin/bash

if pgrep -x "hyprsunset" > /dev/null; then
    pkill -x "hyprsunset"
    notify-send "Luz Nocturna" "Desactivada" -t 1500
else
    hyprsunset -t 3500 &
    notify-send "Luz Nocturna" "Activada" -t 1500
fi
