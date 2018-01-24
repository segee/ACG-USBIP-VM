#!/bin/bash
if test $# -ne 1
then
  echo
  echo
  echo "You must provide your unique id as the first argument"
  echo
  echo "Your unique id is a number between 1 and 999 given in class"
  echo
  echo "If you don't have one, please don't use this script."
  exit 
fi
if test $1 -gt 0 && test $1 -lt 1000
then


# This gets the low byte of the machine that is connected to me
# via xrdp.  There is probably a more elegant solution.
# This will only work if xrdp is used.
#MYGUAC="192.168.0.`netstat -t |grep 3389 |cut -f 2 -d : |cut -f 4 -d .`"
# Rats, that didn't work

MYGUAC="192.168.0.5"

echo "my GUAC server is "$MYGUAC
MYUSBPORT=$((6000+$1))
MYSSHPORT=$((7000+$1))
echo $MYUSBPORT
sudo usbip --tcp-port $MYUSBPORT list -r $MYGUAC
fi

echo
echo "Bad value:"

