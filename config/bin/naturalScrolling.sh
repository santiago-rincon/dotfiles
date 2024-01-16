#!/bin/bash

# Run xinput list to see the names of available devices and xinput list-props "the device name" to list properties of a device.
for device in $(xinput list | grep 'Touchpad' | cut -d'=' -f2 | cut -d'[' -f1)
do
 #echo $device
 xinput --set-int-prop $device "libinput Natural Scrolling Enabled" 8 1
 xinput --set-int-prop $device "libinput Tapping Enabled" 8 1
done
