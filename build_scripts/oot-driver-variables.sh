#!/bin/bash
set -e

##current RocketRaid R750 Release - See http://www.highpoint-tech.com/BIOS_Driver/R750/Linux/
export ROCKET="1.2.11-18_06_26"
export ROCKETSHORT=$(echo $ROCKET | cut -d"-" -f1)

##current RocketRaid RR3740A Release
export RR="1.19.0_19_04_04"
export RRSHORT=$(echo $RR | cut -d"-" -f1)

##current RocketNVMe Driver - See http://www.highpoint-tech.com/USA_new/series-ssd7101a-1-download.htm
export RN="1.2.16_19_05_06"
export RNSHORT=$(echo $RN | cut -d"-" -f1)

##current Intel IXGB - See https://sourceforge.net/projects/e1000/files/igb%20stable/
export IXGB="5.3.5.42"

##current Intel 10GB IXGBE - See https://sourceforge.net/projects/e1000/files/ixgbe%20stable/
export IXGBE="5.6.5"
export IXGBE_INTEL_NUMBER="14687"

##current Intel 10GB IXGBEVF - See https://downloadcenter.intel.com/download/18700/Intel-Network-Adapter-Virtual-Function-Driver-for-Intel-10-Gigabit-Ethernet-Network-Connections?product=36773
export IXGBEVF="4.5.1"
export IXGBEVF_INTEL_NUMBER="28521"

##tehuti Driver
export TEHUTI="0.3.6.17.2"

##Realtek r8125 Driver
export REALTEK="9.002.02"


declare -A oot_driver_map=(
    	  ["6.6.6"]="ixgbe"
        ["6.6.7"]="ixgbe"
    	  ["6.7.0"]="ixgbe,tehuti"
        ["6.7.1"]="ixgbe,tehuti"
        ["6.7.2"]="ixgbe,tehuti"
        ["6.7.3-rc4"]="ixgbe,tehuti"
        ["6.8.0-rc1"]="tehuti,rocketnvme"
        ["6.8.0-rc3"]="tehuti,rocketnvme,realtek"
        ["6.8.0-rc4"]="tehuti,rocketnvme,realtek"
        ["6.8.0-rc5"]="tehuti,rocketnvme,realtek"
        ["6.8.0-rc6"]="tehuti,rocketnvme,realtek"
        ["6.8.0-rc7"]="tehuti,rocketnvme,realtek"
        ["6.8.0-rc8"]="ixgbe,rocketnvme,realtek"
        ["6.8.0-rc9"]="ixgbe,rocketnvme,realtek"
        ["6.8.0"]="ixgbe,realtek,rocketnvme,rr3740a,,tehuti"
        ["6.8.1"]="ixgbe,realtek,rocketnvme,rocketraid,rr3740a,tehuti,wireguard,wireguard-tools"
        ["6.8.2"]="igb,ixgbe,realtek,rocketnvme,rocketraid,rr3740a,tehuti"
        ["6.8.3"]="igb,ixgbe,realtek,rocketnvme,rocketraid,rr3740a,tehuti"
        ["6.9.0-rc1"]=""
)

export OOT_DRIVERS="${oot_driver_map[$UNRAID_VERSION]}"