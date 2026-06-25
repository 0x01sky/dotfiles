#!/usr/bin/env bash

killall -q polybar

while pgrep -x polybar >/dev/null; do
    sleep 0.2
done

sleep 1.5

if type xrandr >/dev/null 2>&1; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mybar &
    done
else
    polybar --reload mybar &
fi
