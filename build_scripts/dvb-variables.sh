#!/bin/bash
set -e

# current LibreELEC Release - See https://github.com/LibreELEC/dvb-firmware/releases
echo -e "${BLUE}Variables.sh${NC}    -----    current LibreELEC Release"
export LE="1.4.0"

# current Digital Devices Github release - See https://github.com/DigitalDevices/dddvb/releases
echo -e "${BLUE}Variables.sh${NC}    -----    current Digital Devices Github release"
export DD="master"

##current Date (DDExp & TBS OS Version)
echo -e "${BLUE}Variables.sh${NC}    -----    current Date (DDExp & TBS OS Version)"
export DATE=$(date +'%d%m%y')