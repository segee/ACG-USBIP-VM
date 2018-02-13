#!/bin/bash
# needs error checking
#takes 1 argument, port returned from VMusb_port.sh

sudo usbip detach -p $1
