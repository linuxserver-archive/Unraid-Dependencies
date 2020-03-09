#!/bin/bash
set -e

# current LibreELEC Release - See https://github.com/LibreELEC/dvb-firmware/releases
export LE="1.4.0"

# current Digital Devices Github release - See https://github.com/DigitalDevices/dddvb/releases
export DD="master"

##current Date (DDExp & TBS OS Version)
export DATE=$(date +'%d%m%y')