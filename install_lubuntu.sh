#!/bin/bash
#Desktop Environment
###################################################################
# 
# Install a basic gui desktop 
#
###################################################################
# sudo -i export DEBIAN_FRONTEND=noninteractive
sudo apt-get -y  update
sudo apt-get install -y  -f lubuntu-desktop
sudo apt-get install -y  -f man manpages manpages-dev freebsd-manpages funny-manpages gmt-manpages man2html manpages-posix manpages-posix-dev asr-manpages
sudo apt-get install -f -y xvfb python-psutil xbase-clients xrandr
sudo apt-get install -f -y  gtk2-engines-pixbuf
sudo apt-get install -f -y libxss1 libappindicator1 libindicator7 
sudo timedatectl set-timezone America/New_York
echo PATH=\"$PATH\"| sudo tee /etc/environment


/usr/local/bin/ACG-Package-Suite/ubuntu/install_chrome_and_remote_desktop.sh
/usr/local/bin/ACG-Package-Suite/ubuntu/install_office_suite.sh
sudo apt-get -y install firefox

sudo rm /var/crash/*
sudo apt-get -y autoremove
sudo apt-get remove -y light-locker
sudo apt-get remove -y gnome-screensaver
sudo apt-get remove -y xscreensaver
sudo apt-get remove -y abiword
sudo apt-get remove -y gnumeric

