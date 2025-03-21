#Important package
sudo xbps-install base-devel libreoffice freetype-devel libXft-devel libXinerama-devel libX11-devel libxcb-devel harfbuzz-devel xorg-server xbacklight xbindkeys xvkbd xorg elogind dbus xinput gcc flameshot make binutils compton git NetworkManager thunar-archive-plugin thunar-volman xarchiver lxappearance dialog mtools avahi acpi acpid gvfs xfce4-power-manager pulseaudio pavucontrol pulsemixer feh papirus-icon-theme exa maim dunst xdotool unzip micro geany geany-plugins redshift firefox-esr vlc font-awesome terminus-font libnotify lightdm 
sudo xbps-install -S void-repo-multilib void-repo-multilib-nonfree
#extracting
tar -xf Voidsuckless.tar.gz 
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
cd ..
sudo make clean install
#adding Dwm to Lighdm
cd ..  
cd fonts
sudo cp * /usr/share/fonts/
cd ..
cp compton.conf ~/.config
sudo chmod +x dwm.desktop
sudo chmod +x autostart.sh
sudo mkdir /usr/share/xsessions/
sudo mkdir /usr/local/bin/
sudo cp  dwm.desktop  /usr/share/xsessions/dwm.desktop 
sudo cp  autostart.sh /usr/local/bin/start_dwm.sh
#activating services 
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/elogind /var/service
sudo ln -s /etc/sv/NetworkManager /var/service
sudo ln -s /etc/sv/lightdm /var/service 
sudo sv up dbus
sudo sv up elogind 
sudo sv up lightdm 
sudo sv up NetworkManager
#wallpaper
cp wallpaper.jpg ~/wallpaper.jpg 
#flatpak
sudo xbps-install -S flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#reboot
sudo reboot 
