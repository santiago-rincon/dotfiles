#!/bin/bash

file="/home/santiago/.config/bin/notifications"
status=$(acpi -b|grep -c "Full")
charging=$(acpi -b|grep -c "Charging")
percentage=$(acpi -b |cut -d "," -f2| sed 's/%//g' | tr -d ' ')
if [[ $status -eq 1 && $percentage -eq 100 ]]; then
    if [ "$(grep "full = no" $file)" ]; then 
        export DISPLAY=:0
        notify-send -t 4000 -i /home/santiago/.config/bin/assets/full.png "Bateria cargada" "$percentage%"
        XDG_RUNTIME_DIR=/run/user/`id -u` aplay -t wav /home/santiago/.config/bin/assets/notify.wav
        sed 's/full = no/full = si/g' $file | sponge $file
    fi
else
    if [ "$(grep "full = si" $file)" ]; then 
        sed 's/full = si/full = no/g' $file | sponge $file
    fi
    if [[ $status -eq 0 && $percentage -gt 10 && $percentage -lt 20 && $(grep "20% = no" $file) && $charging -eq 0 ]]; then
        export DISPLAY=:0
        notify-send -t 4000 -i /home/santiago/.config/bin/assets/low.png "Bateria baja" "$percentage%"
        XDG_RUNTIME_DIR=/run/user/`id -u` aplay -t wav /home/santiago/.config/bin/assets/notify.wav
        sed 's/20% = no/20% = si/g' $file | sponge $file
    elif [[ $status -eq 0 && $percentage -lt 10 && $(grep "10% = no" $file) &&  $charging -eq 0 ]]; then
        export DISPLAY=:0
        notify-send -t 4000 -i /home/santiago/.config/bin/assets/critical.png "Conectar cargador" "$percentage%"
        XDG_RUNTIME_DIR=/run/user/`id -u` aplay -t wav /home/santiago/.config/bin/assets/notify.wav
        sed 's/10% = no/10% = si/g' $file | sponge $file
    fi
    if [[ $charging -eq 1 && "$(grep si $file)" ]]; then
        sed 's/si/no/g' $file | sponge $file
    fi
fi
