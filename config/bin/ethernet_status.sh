#!/bin/bash

if [ "$(nmcli | grep "conectado to" | wc -l)" = "0" ]; then
  echo "%{F#7dcfff}󰈂 %{F#ffffff}Desconectado%{u-}";
elif [ "$(nmcli | grep "eth0: conectado to" | wc -l)" = "1" ]; then
  ip=$(nmcli | grep "eth0: conectado" -A 5 | grep inet4 | awk '{print $NF}' | awk '{print $1}' FS=\/);
  timeout 1 ping 8.8.8.8 -c1 &>/dev/null && echo "%{F#7dcfff}󰈀 %{F#ffffff}"$ip"%{u-}" || echo "%{F#ff1e12}󰌙 %{F#ffffff}"$ip"%{u-}"; 
elif [ "$(nmcli | grep "usb0: conectado to" | wc -l)" = "1" ]; then
  ip=$(nmcli | grep "usb0: conectado" -A 5 | grep inet4 | awk '{print $NF}' | awk '{print $1}' FS=\/);
  timeout 1 ping 8.8.8.8 -c1 &>/dev/null && echo "%{F#7dcfff} %{F#ffffff}"$ip"%{u-}" || echo "%{F#ff1e12} %{F#ffffff}"$ip"%{u-}";
elif [ "$(nmcli | grep "wlan0: conectado to" | wc -l)" = "1" ]; then
  ip=$(nmcli | grep "wlan0: conectado" -A 5 | grep inet4 | awk '{print $NF}' | awk '{print $1}' FS=\/);
  timeout 1 ping 8.8.8.8 -c1 &>/dev/null && echo "%{F#7dcfff}󰖩 %{F#ffffff}"$ip"%{u-}" || echo "%{F#ff1e12}󱚵 %{F#ffffff}"$ip"%{u-}";
fi
