#!/bin/bash

pkill xfce4-notify
icon="/home/santiago/.config/sxhkd/assets/volume.png"
title="Volumen actual"
case $1 in 
    "plus")
    /usr/bin/pactl set-sink-volume 0 +5% &>/dev/null;;
    "minus")
    /usr/bin/pactl set-sink-volume 0 -5% &>/dev/null;;
    "mute")
    /usr/bin/pactl set-sink-mute 0 toggle &>/dev/null
    if [ "$(amixer sget Master | tail -n1 | awk '{print$NF}' | tr -d '[]')" != "on" ];then 
        icon="/home/santiago/.config/sxhkd/assets/mute.png"
        title="Bocinas en silencio"
    fi
esac
notify-send -t 2000 -i $icon "$title" "$(amixer sget Master | tail -n1 | awk '{print$5}' | tr -d '[]')"
