#!/bin/bash
set -e

echo -e "${BLUE}NVIDIA Variables.sh${NC}    -----    set our package list"
slack_package_current=(\
atk \
bzip2 \
cairo \
cairomm \
dbus \
expat \
fontconfig \
freetype \
fribidi \
gcc-go \
gdk-pixbuf2 \
glib2 \
gtk+2 \
gtk+3 \
gtkmm2 \
gtkmm3 \
graphite2 \
shared-mime-info \
harfbuzz \
libdrm \
libpciaccess \
libpng \
libpthread-stubs \
libvdpau \
libX11 \
libXau \
libxcb \
libXdamage \
libXdmcp \
libXext \
libXfixes \
libXrandr \
libXrender \
libxshmfence \
libXv \
libXvMC \
libXxf86vm \
libzip \
mesa \
opencl-headers \
pango \
pangomm \
pkgtools \
pcre2 \
pcre \
pixman \
util-linux \
xcb-proto \
xorgproto \
xorg-server \
xrandr \
zlib \
)

echo -e "${BLUE}NVIDIA Variables.sh${NC}    -----    clean up old files if they exist"
[[ -f "$D"/NVIDIA_FILE_LIST_CURRENT ]] && rm "$D"/NVIDIA_FILE_LIST_CURRENT
[[ -f "$D"/NVIDIA_URLS_CURRENT ]] && rm "$D"/NVIDIA_URLS_CURRENT

echo -e "${BLUE}NVIDIA Variables.sh${NC}    -----    get slackware64-current FILE_LIST"
wget -nc http://mirrors.slackware.com/slackware/slackware64-current/slackware64/FILE_LIST -O $D/NVIDIA_FILE_LIST_CURRENT

slack_package_current_urlbase="http://mirrors.slackware.com/slackware/slackware64-current/slackware64"

for i in "${slack_package_current[@]}"
do
package_locations_current=$(grep "/$i-[[:digit:]].*.txz$" NVIDIA_FILE_LIST_CURRENT |  cut -d . -f2-7)
echo "$slack_package_current_urlbase""$package_locations_current" >> "$D"/NVIDIA_URLS_CURRENT
done


# Current RUNC that lines up with docker 18.09.1
# https://github.com/NVIDIA/nvidia-container-runtime/tree/master/runtime/runc/96ec2177ae841256168fcf76954f7177af9446eb
echo -e "${BLUE}NVIDIA Variables.sh${NC}    -----    current NVIDIA Release - "
export RUNC_GIT_HASH="96ec2177ae841256168fcf76954f7177af9446eb"

echo -e "${BLUE}NVIDIA Variables.sh${NC}    -----    current NVIDIA Container Runtime Hook Release - "
export NVIDIA_HOOK_SHA1="1ac122a9c7b9745749ffa72a1d4f71c70a8a8ab3"

##current NVIDIA Release
echo -e "${BLUE}NVIDIA Variables.sh${NC}    -----    current NVIDIA Release - "
##Releases grabbed here: https://download.nvidia.com/XFree86/Linux-x86_64/ 
export NVIDIA_DRIVER_VERSION="410.78"

