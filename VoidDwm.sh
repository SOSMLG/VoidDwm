#!/bin/sh
# ============================================================
# Void Suckless Desktop Environment Setup Script
# ============================================================
# This script installs required packages, compiles and installs
# the suckless tools, sets up fonts, configuration files,
# autostart, and activates necessary system services.
# ============================================================

set -e  # Exit immediately if any command fails

# 1. Install Required Packages
sudo xbps-install -Sy \
    base-devel \
    libreoffice \
    freetype-devel \
    libXft-devel \
    libXinerama-devel \
    libX11-devel \
    libxcb-devel \
    harfbuzz-devel \
    xorg-server \
    xbacklight \
    xbindkeys \
    xvkbd \
    elogind \
    dbus \
    xinput \
    gcc \
    flameshot \
    make \
    binutils \
    compton \
    git \
    NetworkManager \
    thunar-archive-plugin \
    thunar-volman \
    xarchiver \
    lxappearance \
    dialog \
    mtools \
    avahi \
    acpi \
    acpid \
    gvfs \
    xfce4-power-manager \
    pulseaudio \
    pavucontrol \
    pulsemixer \
    feh \
    papirus-icon-theme \
    exa \
    maim \
    dunst \
    xdotool \
    unzip \
    micro \
    geany \
    geany-plugins \
    redshift \
    firefox-esr \
    vlc \
    font-awesome \
    terminus-font \
    libnotify \
    lightdm

# Enable multilib repositories if needed
sudo xbps-install -Sy void-repo-multilib void-repo-multilib-nonfree

# 2. Extract Sources and Fonts
tar -xf Voidsuckless.tar.gz 
tar -xf fonts.tar.gz

# 3. Build and Install Suckless Tools
cd Voidsuckless

# Install dwm
cd dwm
sudo make clean install
cd ..

# Install dmenu
cd dmenu 
sudo make clean install
cd ..

# Install st
cd st 
sudo make clean install
cd ..

# Install slstatus
cd slstatus
sudo make clean install
cd ..

# 4. Install Fonts
cd ../fonts
sudo cp * /usr/share/fonts/
cd ..

# 5. Copy Configuration Files
mkdir -p ~/.config
cp compton.conf ~/.config/compton.conf

# Make sure autostart and desktop file scripts are executable
sudo chmod +x dwm.desktop autostart.sh

# Create required directories and copy files
sudo mkdir -p /usr/share/xsessions/ /usr/local/bin/
sudo cp dwm.desktop /usr/share/xsessions/dwm.desktop 
sudo cp autostart.sh /usr/local/bin/start_dwm.sh

# 6. Activate Essential Services (runit)
sudo ln -sf /etc/sv/dbus /var/service
sudo ln -sf /etc/sv/elogind /var/service
sudo ln -sf /etc/sv/NetworkManager /var/service
sudo ln -sf /etc/sv/lightdm /var/service 
sudo sv up dbus
sudo sv up elogind 
sudo sv up lightdm 
sudo sv up NetworkManager

# 7. Set Wallpaper (copy to home directory)
cp wallpaper.jpg ~/wallpaper.jpg 

# 8. Install Flatpak and Add Flathub Repository
sudo xbps-install -Sy flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# 9. Reboot the System to Finalize Setup
sudo reboot
