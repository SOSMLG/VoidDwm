#extracting
tar xf Voidsuckless.tar.gz -C ~/
#Important package
sudo xbps-install base-devel freetype-devel libXft-devel libXinerama-devel libX11-devel libxcb-devel harfbuzz-devel xorg-server xbacklight xbindkeys xvkbd xinput gcc make binutils compton git NetworkManager network-manager-applet thunar-archive-plugin thunar-volman file-roller lxappearance dialog mtools avahi acpi acpid gvfs xfce4-power-manager pulseaudio pavucontrol pulsemixer feh papirus-icon-theme exa maim dunst xdotool unzip micro geany geany-plugins redshift firefox-esr vlc font-awesome terminus-font libnotify lightdm 
#Void suckless location
cd Voidsuckless
#dwm installation 
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
#adding Dwm to Lighdm
cd 
sudo cp ~/dwm.desktop /usr/share/xsessions/dwm.desktop 
sudo cp .autostart.sh /usr/local/bin/start_dwm.sh

