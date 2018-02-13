#!/bin/bash
# needs error checking.  $1 is my unique number $2 is bus_id
# need to run VMusb_list.sh to get bus_id

#MYGUAC="192.168.0.`netstat -t |grep 3389 |cut -f 2 -d : |cut -f 4 -d .`"
# Rats, that didn't work

MYGUAC="192.168.0.5"

echo "my GUAC server is "$MYGUAC
MYUSBPORT=$((6000+$1))
MYSSHPORT=$((7000+$1))
echo $MYUSBPORT
sudo usbip --tcp-port $MYUSBPORT attach -r $MYGUAC -b $2
