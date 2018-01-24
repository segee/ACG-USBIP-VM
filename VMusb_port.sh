#!/bin/bash

if test $# -ne 0 
then
  echo
  echo 
  echo "use this command without an argument to  see which"
  echo "usbip ports are in use."
  echo
  echo "(this information is useful for VMusb_detach.sh)"
  exit
fi
sudo usbip port
