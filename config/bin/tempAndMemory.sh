#!/bin/bash

mem=$(free --giga -h | awk 'NR==2' | awk '{print $3}' | sed 's/G/GB/g' | tr ',' '.')
temp1=$(sensors | /bin/grep Core | awk '{print $3}' | tr -d '+|°C' | awk NR==1)
temp2=$(sensors | /bin/grep Core | awk '{print $3}' | tr -d '+|°C' | awk NR==2)
if [ $(echo "$temp1 > $temp2" | bc -l) ]; then
  echo "%{F#f94449} %{F#ffffff}$temp1°C %{F#35baf6}󰍛%{F#ffffff} $mem";
else 
   echo "%{F#f94449}%{F#ffffff} $temp1°C %{F#35baf6}󰍛%{F#ffffff} $mem";
fi
