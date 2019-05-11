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
libffi \
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

# RUNC version installed in Unraid
echo -e "${BLUE}NVIDIA Variables.sh${NC}    -----    current NVIDIA Release - "

#If setting manually the hash must match the version of docker obtained from `docker --version` here.
# https://github.com/NVIDIA/nvidia-container-runtime/blob/master/runtime/Makefile
export RUNC_GIT_HASH="6635b4f0c6af3810594d2770f662f34ddc15b40d"
#export RUNC_GIT_HASH="$(docker info | grep "runc version: " | cut -d":" -f2 | cut -d" " -f2)"

##current NVIDIA Release from Slackbuild
echo -e "${BLUE}NVIDIA Variables.sh${NC}    -----    current NVIDIA Release - "
export NVIDIA_DRIVER_VERSION="$(curl -silent https://slackbuilds.org/slackbuilds/14.2/system/nvidia-driver/nvidia-driver.info | grep VERSION= | cut -d"=" -f2 | sed -e 's/^"//' -e 's/"$//')"

#libnvidia-container-version
export CONTAINER_VERSION="1.0.1"
