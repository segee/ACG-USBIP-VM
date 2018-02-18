#!/bin/bash
# needs error checking.  $1 is my unique number $2 is bus_id
# need to run VMusb_list.sh to get bus_id

#MYGUAC="192.168.0.`netstat -t |grep 3389 |cut -f 2 -d : |cut -f 4 -d .`"
# Rats, that didn't work
if test $# -ne 2
then
  echo
  echo
  echo "You must provide two arguments in the correct sequence."
  echo "The first is the same unique id that you use for VMusb_list.sh"
  echo "The second is the bus id of the device that you want to attach"
  echo " from VMusblist.sh."
  echo
  exit
fi

if test $1 -gt 0 && test $1 -lt 1000
then

MYGUAC="192.168.0.5"

#echo "my GUAC server is "$MYGUAC
MYUSBPORT=$((6000+$1))
MYSSHPORT=$((7000+$1))
#echo $MYUSBPORT
sudo usbip --tcp-port $MYUSBPORT attach -r $MYGUAC -b $2

else

echo
echo "Bad Unique id value"
fi

