#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
apt update
apt upgrade -y

# Install required packages
apt install feh kitty rofi picom thunar nitrogen lxpolkit x11-xserver-utils unzip libimlib2-dev wget pulseaudio sudo pavucontrol build-essential libx11-dev libxft-dev libxinerama-dev curl neofetch flameshot psmisc mangohud vim lxappearance papirus-icon-theme lightdm -y
sudo su
usermod -aG sudo $username

# Install slick-greeter LightDM theme
sudo apt install lightdm-slick-greeter -y

# Configure LightDM to use slick-greeter
echo "[Seat:*]" > /etc/lightdm/lightdm.conf
echo "greeter-session=lightdm-slick-greeter" >> /etc/lightdm/lightdm.conf


# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Download and install JetbrainsMono Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip
cd $builddir

# Copy fonts from the local directory to system fonts directory
cp -r $builddir/fonts/* /usr/share/fonts/
chmod 644 /usr/share/fonts/*
fc-cache -fv

# Install Nordzy cursor
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd $builddir
rm -rf Nordzy-cursors

# Beautiful bash
git clone https://github.com/ChrisTitusTech/mybash
cd mybash
bash setup.sh
cd $builddir

#Debian 12 "Bookworm
#Add "contrib", "non-free" and "non-free-firmware" components to /etc/apt/sources.list, for example:
deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
sudo apt update
sudo apt install nvidia-driver firmware-misc-nonfree

# Install the specific NVIDIA driver version
sudo apt install nvidia-driver=470.182.03-1 -t bookworm -y

# Install brave-browser
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser -y

# Install chadwm and eww
sudo -u $username git clone https://github.com/siduck/chadwm --depth 1 /home/sifat/.config/chadwm
cd /home/sifat/.config/chadwm
mv eww ~/.config
cd chadwm
sudo -u $username make install

# Create a desktop entry for chadwm
sudo -u $username tee /usr/share/xsessions/chadwm.desktop << EOL
[Desktop Entry]
Name=chadwm
Comment=dwm made beautiful 
Exec=/home/sifat/.config/chadwm/scripts/./run.sh 
Type=Application
EOL

# Open eww
sudo -u $username eww open eww

usermod -aG sudo $username
# Enable graphical login and change target from CLI to GUI
systemctl enable lightdm
systemctl set-default graphical.target
