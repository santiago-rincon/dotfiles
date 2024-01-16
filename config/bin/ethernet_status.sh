#!/bin/bash

ip=$(/usr/bin/hostname -I | awk '{print $1}')
if [ "$(nmcli | grep "conectado to" | wc -l)" = "0" ]; then
  echo "%{F#7dcfff}󰈂 %{F#ffffff}Desconectado%{u-}";
elif [ "$(nmcli | grep "eth0: conectado to" | wc -l)" = "1" ]; then
  timeout 1 ping 8.8.8.8 -c1 &>/dev/null && echo "%{F#7dcfff}󰈀 %{F#ffffff}"$ip"%{u-}" || echo "%{F#7dcfff}󰌙 %{F#ffffff}"$ip"%{u-}";
else
  timeout 1 ping 8.8.8.8 -c1 &>/dev/null && echo "%{F#7dcfff} %{F#ffffff}"$ip"%{u-}" || echo "%{F#7dcfff}󱚵 %{F#ffffff}"$ip"%{u-}";
fi
