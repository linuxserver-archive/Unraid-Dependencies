#!/bin/bash
set -e

##current Intel IXGB - See https://sourceforge.net/projects/e1000/files/igb%20stable/
export IXGB="5.3.5.42"

##current Intel 10GB IXGBE - See https://sourceforge.net/projects/e1000/files/ixgbe%20stable/
export IXGBE="5.6.5"
export IXGBE_INTEL_NUMBER="14687"

##current Intel 10GB IXGBEVF - See https://downloadcenter.intel.com/download/18700/Intel-Network-Adapter-Virtual-Function-Driver-for-Intel-10-Gigabit-Ethernet-Network-Connections?product=36773
export IXGBEVF="4.5.1"
export IXGBEVF_INTEL_NUMBER="28521"

##current Realtek r8125 Driver
echo -e "${BLUE}Variables.sh${NC}    -----    current Realtek r8125 Driver"
export REALTEK="9.003.05"

##current Realtek r8152 Driver - See https://github.com/wget/realtek-r8152-linux/releases
echo -e "${BLUE}Variables.sh${NC}    -----    current Realtek r8152 Driver"
export R8152="2.13.20200712"

##current RocketRaid RR272x Release - See https://highpoint-tech.com/USA_new/rr272x_download.htm
echo -e "${BLUE}Variables.sh${NC}    -----    current RocketRaid RR272x Release - See https://highpoint-tech.com/USA_new/rr272x_download.htm/"
export R272X="1.10.6_19_12_05"
export R272XSHORT=$(echo $R272X | cut -d"-" -f1)

##current RocketRaid RR3740A Release
echo -e "${BLUE}Variables.sh${NC}    -----    current RocketRaid RR3740A Release - "
export R3740A="1.19.0_19_04_04"
export R3740ASHORT=$(echo $R3740A | cut -d"-" -f1)

##current RocketRaid R750 Release - See http://www.highpoint-tech.com/BIOS_Driver/R750/Linux/
echo -e "${BLUE}Variables.sh${NC}    -----    current RocketRaid R750 Release - See http://www.highpoint-tech.com/BIOS_Driver/R750/Linux/"
export R750="1.2.11-18_06_26"
export R750SHORT=$(echo $R750 | cut -d"-" -f1)

##current RocketNVMe Driver - See http://www.highpoint-tech.com/USA_new/series-ssd7101a-1-download.htm
echo -e "${BLUE}Variables.sh${NC}    -----    current RocketNVMe Release - "
export RNVME="1.2.16_19_05_06"
export RNVMESHORT=$(echo $RNVME | cut -d"-" -f1)

##current Tehuti Driver
echo -e "${BLUE}Variables.sh${NC}    -----    current Tehuti 10GB Driver"
export TEHUTI="0.3.6.17.3"


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
        ["6.9.0-beta22"]=""
        ["6.9.0-beta25"]="rr272x,realtek"
        ["6.9.0-beta29"]="r8152,realtek,rr272x,tehuti"
        ["6.9.0-beta30"]="r8152,realtek,rr272x,tehuti"
)

export OOT_DRIVERS="${oot_driver_map[$UNRAID_VERSION]}"
