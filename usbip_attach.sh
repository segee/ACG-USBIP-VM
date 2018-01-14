#!/bin/bash

# run hostname and get the last byte of my IP address
# useful for finding what ports to use
# takes the fourth column delimited by a period
MYIP=`hostname -I |cut -f 4 -d .`
BUSID=$1
#
# This gets the low byte of the machine that is connected to me
# via xrdp.  There is probably a more elegant solution.
# This will only work if xrdp is used.

MYGUAC="192.168.0.`netstat -t |grep 3389 |cut -f 2 -d : |cut -f 4 -d .`"
echo "my IP is 192.168.0."$MYIP
echo "my GUAC server is "$MYGUAC

MYUSBPORT=$((6000+$MYIP))
MYSSHPORT=$((7000+$MYIP))

echo $MYUSBPORT
echo $MYSSHPORT
echo $BUSID

usbip --tcp-port $MYUSBPORT attach -r $MYGUAC -b $BUSID
