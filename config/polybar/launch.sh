#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch Main Monitor

## Left bar
polybar log -c ~/.config/polybar/current.ini &
polybar secondary -c ~/.config/polybar/current.ini &
polybar terciary -c ~/.config/polybar/current.ini &
polybar quaternary -c ~/.config/polybar/current.ini &
polybar quinary -c ~/.config/polybar/current.ini &
polybar senary -c ~/.config/polybar/current.ini &

## Right bar
polybar top -c ~/.config/polybar/current.ini &
polybar primary -c ~/.config/polybar/current.ini &

## Center bar
polybar primary -c ~/.config/polybar/workspace.ini &

## Launch Secondary Monitor

## Left bar
polybar log2 -c ~/.config/polybar/current.ini &
polybar secondary2 -c ~/.config/polybar/current.ini &
polybar terciary2 -c ~/.config/polybar/current.ini &
polybar quaternary2 -c ~/.config/polybar/current.ini &
polybar quinary2 -c ~/.config/polybar/current.ini &
polybar senary2 -c ~/.config/polybar/current.ini &

## Right bar
polybar top2 -c ~/.config/polybar/current.ini &
polybar primary2 -c ~/.config/polybar/current.ini &

## Center bar
polybar primary2 -c ~/.config/polybar/workspace.ini &
