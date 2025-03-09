# Important packages
sudo apt update && sudo apt install -y \
    build-essential libfreetype6-dev libxft-dev libxinerama-dev libx11-dev libxcb1-dev \
    libharfbuzz-dev xserver-xorg xbacklight xbindkeys xvkbd xinit dbus xinput gcc \
    flameshot make binutils picom git network-manager network-manager-gnome \
    thunar-archive-plugin thunar-volman file-roller lxappearance dialog mtools avahi-daemon \
    acpi acpid gvfs xfce4-power-manager pulseaudio pavucontrol pulsemixer feh \
    papirus-icon-theme exa maim dunst xdotool unzip micro geany geany-plugins redshift \
    firefox-esr vlc fonts-font-awesome fonts-terminus libnotify-bin lightdm  linux-image-amd64 \
    linux-headers-amd64 firmware-iwlwifi firmware-misc-nonfree libxcb-res0-dev libx11-xcb-dev \

# Extracting
tar -xf Voidsuckless.tar.gz

# Void suckless location
cd Voidsuckless

# Dwm installation
cd dwm
sudo make clean install
cd ..
cd dmenu
sudo make clean install
cd ..
cd st
sudo make clean install
cd ..
cd slstatus
sudo make clean install

# Adding Dwm to LightDM
cd ..
cd ..
sudo chmod +x dwm.desktop autostart.sh
sudo mkdir -p /usr/share/xsessions /usr/local/bin
sudo cp dwm.desktop /usr/share/xsessions/dwm.desktop
sudo cp autostart.sh /usr/local/bin/start_dwm.sh

# Activating services
sudo update-rc.d dbus defaults
sudo update-rc.d lightdm defaults
sudo update-rc.d networking defaults

# Start services immediately
sudo service dbus start
sudo service lightdm start
sudo service networking start

# Wallpaper
cp wallpaper.jpg ~/wallpaper.jpg

# Flatpak
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Reboot
sudo reboot
