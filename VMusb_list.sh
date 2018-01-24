#!/bin/bash
# This gets the low byte of the machine that is connected to me
# via xrdp.  There is probably a more elegant solution.
# This will only work if xrdp is used.


#MYGUAC="192.168.0.`netstat -t |grep 3389 |cut -f 2 -d : |cut -f 4 -d .`"
# Rats, that didn't work

MYGUAC="192.168.0.34"

echo "my GUAC server is "$MYGUAC
MYUSBPORT=$((6000+$1))
MYSSHPORT=$((7000+$1))
echo $MYUSBPORT
sudo usbip --tcp-port $MYUSBPORT list -r $MYGUAC
