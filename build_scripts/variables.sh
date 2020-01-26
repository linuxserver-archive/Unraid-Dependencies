#!/bin/bash
set -e

##set our package list - Note gcc & gcc-g++ fixed for now until LT upgrade to GCC v9.x
echo -e "${BLUE}Variables.sh${NC}    -----    set our package list"
slack_package_current=(\
autoconf \
automake \
bc \
binutils \
bison \
cpio \
elfutils \
flex \
gc \
gcc \
gcc-g++ \
git \
glibc \
glibc-solibs \
guile \
gettext \
isl \
kernel-headers \
kernel-modules \
lftp \
libcgroup \
libffi \
libgudev \
libmpc \
libmnl \
libtool \
libunistring \
m4 \
make \
mpfr \
ncurses \
patch \
perl \
pkg-config \
python \
readline \
sqlite \
squashfs-tools \
zstd \
)

##Set colours
export NC='\e[39m' # No Color
export RED='\e[31m'
export BLUE='\e[96m'
export GREEN='\e[92m'

##current RocketRaid R750 Release - See http://www.highpoint-tech.com/BIOS_Driver/R750/Linux/
echo -e "${BLUE}Variables.sh${NC}    -----    current RocketRaid R750 Release - See http://www.highpoint-tech.com/BIOS_Driver/R750/Linux/"
export ROCKET="1.2.11-18_06_26"
export ROCKETSHORT=$(echo $ROCKET | cut -d"-" -f1)

##current RocketRaid RR3740A Release
echo -e "${BLUE}Variables.sh${NC}    -----    current RocketRaid RR3740A Release - "
export RR="1.19.0_19_04_04"
export RRSHORT=$(echo $RR | cut -d"-" -f1)

##current RocketNVMe Driver - See http://www.highpoint-tech.com/USA_new/series-ssd7101a-1-download.htm
echo -e "${BLUE}Variables.sh${NC}    -----    current RocketNVMe Release - "
export RN="1.2.16_19_05_06"
export RNSHORT=$(echo $RN | cut -d"-" -f1)

##current Intel IXGB - See https://sourceforge.net/projects/e1000/files/igb%20stable/
echo -e "${BLUE}Variables.sh${NC}    -----    current Intel 10GB IXGBE driver"
export IXGB="5.3.5.42"

##current Intel 10GB IXGBE - See https://sourceforge.net/projects/e1000/files/ixgbe%20stable/
echo -e "${BLUE}Variables.sh${NC}    -----    current Intel 10GB IXGBE driver"
export IXGBE="5.6.5"

##current Intel 10GB IXGBEVF - See https://sourceforge.net/projects/e1000/files/ixgbevf%20stable/
echo -e "${BLUE}Variables.sh${NC}    -----    current Intel 10GB IXGBEVF driver"
export IXGBEVF="4.5.1"

##tehuti Driver
echo -e "${BLUE}Variables.sh${NC}    -----    current Tehuti 10GB Driver"
export TEHUTI="0.3.6.17.2"

##Realtek r8125 Driver
echo -e "${BLUE}Variables.sh${NC}    -----    current Realtek r8125 Driver"
export REALTEK="9.002.02"

##find our working folder
echo -e "${BLUE}Variables.sh${NC}    -----    find our working folder"
export D="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

##clean up old files if they exist
echo -e "${BLUE}Variables.sh${NC}    -----    clean up old files if they exist"
[[ -f "$D"/FILE_LIST_CURRENT ]] && rm "$D"/FILE_LIST_CURRENT
[[ -f "$D"/URLS_CURRENT ]] && rm "$D"/URLS_CURRENT

##current Unraid Version
echo -e "${BLUE}Variables.sh${NC}    -----    current Unraid Version"
export UNRAID_VERSION=$(cat /etc/unraid-version | tr "." - | cut -d '"' -f2)

##Unraid Download
echo -e "${BLUE}Variables.sh${NC}    -----    current Unraid Version Download"
export UNRAID_DOWNLOAD_VERSION=$(grep -o '".*"' /etc/unraid-version | sed 's/"//g')

##get slackware64-current FILE_LIST
echo -e "${BLUE}Variables.sh${NC}    -----    get slackware64-current FILE_LIST"
wget -nc http://mirrors.slackware.com/slackware/slackware64-current/slackware64/FILE_LIST -O $D/FILE_LIST_CURRENT

slack_package_current_urlbase="http://mirrors.slackware.com/slackware/slackware64-current/slackware64"

for i in "${slack_package_current[@]}"
do
package_locations_current=$(grep "/$i-[[:digit:]].*.txz$" FILE_LIST_CURRENT | cut -b 53-9001)
echo "$slack_package_current_urlbase""$package_locations_current" >> "$D"/URLS_CURRENT
done

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
        ["6.8.1"]="ixgbe,realtek,rocketnvme,rocketraid,rr3740a,tehuti"
        ["6.8.2"]="ixgb,ixgbe,realtek,rocketnvme,rocketraid,rr3740a,tehuti"
)

export OOT_DRIVERS="${oot_driver_map[$UNRAID_DOWNLOAD_VERSION]}"

##Change to current directory
echo -e "${BLUE}Variables.sh${NC}    -----    Change to current directory"
cd ${D}
