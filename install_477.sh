#!/bin/bash
# Software for ECE 477
# Install a base GUI

sudo apt-get update
sudo apt -y autoremove

sudo apt-get -y autoremove
printf "student\nacgrocks" | sudo /usr/local/bin/ACG-Package-Suite/ubuntu/add_a_user.sh
sudo deluser --remove-home ubuntu
sudo deluser --remove-home acguser
sudo cp /usr/local/bin/ACG-USBIP-VM/acg /etc/sudoers.d/acg
sudo chmod 444 /etc/sudoers.d/acg
/usr/local/bin/ACG-USBIP-VM/install_lubuntu.sh


export PATH=$PATH:/usr/local/bin/ACG-Package-Suite:/usr/local/bin/ACG-Package-Suite/ubuntu:/usr/local/bin/ACG-USBIP-VM:/usr/games:/usr/local/games

echo PATH=\"$PATH\" | sudo tee /etc/environment

sudo timedatectl set-timezone America/New_York


# Code to download, patch, and build avrdude 6.3 on Ubuntu
#
# 
export PREFIX=/usr/local
cd
sudo apt-get remove avrdude
sudo apt-get install -f -y  build-essential wget gcc libevent-dev libcurl3 python-gtk2-dev uuid-dev libsqlite0-dev libjansson-dev intltool cmake  libfuse-dev libtool  gcc

sudo apt-get install -f  -y make automake autoconf flex bison libusb-dev libusb-1.0-0-dev  libx11-dev libftdi1 subversion vim
wget http://download.savannah.gnu.org/releases/avrdude/avrdude-doc-6.3.pdf
cd /tmp
mkdir avrdude
cd avrdude

svn co svn://svn.sv.gnu.org/avrdude/tags/RELEASE_6_3
#wget http://download.savannah.gnu.org/releases/avrdude/avrdude-6.3.tar.gz
#gunzip -c avrdude-6.3.tar.gz |tar xf -
cd RELEASE_6_3
wget http://savannah.nongnu.org/bugs/download.php?file_id=32171
patch < download.php\?file_id\=32171
./bootstrap
mkdir obj-avr
cd obj-avr
sudo ../configure --prefix=$PREFIX
sudo make
sudo make install

## Other avr stuff

sudo apt-get -f -y install
sudo apt -y autoremove

sudo apt-get -f -y install
sudo apt-get install -y gcc-avr
sudo apt-get -f -y install
sudo apt -y autoremove

sudo apt-get install -y binutils-avr
sudo apt-get install -y avr-libc

sudo apt -y autoremove

/usr/local/bin/ACG-Package-Suite/ubuntu/install_usbip.sh
/usr/local/bin/ACG-Package-Suite/ubuntu/install_seafile.sh
/usr/local/bin/ACG-Package-Suite/ubuntu/install_chrome_and_remote_desktop.sh
sudo apt-get install -y dfu-programmer


/usr/local/bin/ACG-USBIP-VM/install_xrdp.sh
