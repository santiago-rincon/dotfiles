#!/bin/bash
wallpaper_path="/home/santiago/Wallpaper"
while true; do
  ls $wallpaper_path | while read background; do feh --bg-fill $wallpaper_path/$background; sleep 10m; done
done

# while true; do
#   random_image=$(ls $wallpaper_path | shuf -n 1)
#   feh --bg-fill $wallpaper_path/$random_image
#   sleep 10m
# done
