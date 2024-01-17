#/bin/bash

if [ "$(whoami)" == "root" ]; then
    echo '[!] Execute with normal user'
    exit 1
fi
current_user=$(whoami)
# Instalación de todas las dependencias
sudo apt update && sudo apt full-upgrade
sudo apt install bspwm sxhkd rofi bat xclip locate feh scrot scrub i3lock-color ranger pulseaudio-utils brightnessctl acpi moreutils alsa-utils lm-sensors network-manager libxcb-xinerama0-dev libpcre3 libpcre3-dev libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson ninja-build uthash-dev build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev wmctrl xdotool libinput-tools -y
# Instalación de picom
git clone https://github.com/ibhagwan/picom.git
cd picom 
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install
cd ..
# Instalación de polybar
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
cd ..
# Instalación de kitty
git clone https://github.com/santiago-rincon/linux_terminal.git
cd linux_terminal
chmod +x install.sh
./install.sh
cd ..
# Instalación de libinput-gestuares
sudo gpasswd -a $current_user input
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo ./libinput-gestures-setup install
libinput-gestures-setup autostart start
cd ..
# Copia de los archvios de configuración
cp config/* ~/.config/ -r
mkdir ScreenShots
cp Wallpaper ~/ -r
cp libinput-gestures.conf ~/.config/
sudo cp i3lock-everblush /usr/bin/
sudo chmod +x /usr/bin/i3lock-everblush
cd ..
rm dotfiles -rf

