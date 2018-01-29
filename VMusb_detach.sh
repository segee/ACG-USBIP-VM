#!/bin/bash
# needs error checking
#takes 1 argument, port returned from VMusb_port.sh

if test $# -ne 1
then
  echo
  echo "This script requires one argument that is the port"
  echo "You can get the port from VMusb_port.sh"
  echo 
  exit
fi
if test $1 -lt 0
then
  echo
  echo "port must be a positive integer returned by VMusb_port.sh"
  echo
  exit
fi

sudo usbip detach -p $1
