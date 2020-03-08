#!/bin/bash
set -e

##set our package list - Note gcc-go fixed for now until LT upgrade to GCC v9.x
echo -e "${BLUE}NVIDIA Variables.sh${NC}    -----    set our package list"
nvidia_package_current=(\
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
libffi \
libglvnd \
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


export STOCK_DIR=${D}/${UNRAID_VERSION}/stock/
export MODIFIED_DIR=${D}/${UNRAID_VERSION}/nvidia/

mkdir -p ${D}/${UNRAID_VERSION}
mkdir -p ${STOCK_DIR}
mkdir -p ${MODIFIED_DIR}

export ROOT_FILES=${D}/unraid-packages/rootfiles
mkdir -p ${D}/unraid-packages
mkdir -p ${ROOT_FILES}
chmod -R 755 ${ROOT_FILES}
chown -R root:root ${ROOT_FILES}

##current NVIDIA Release from Slackbuild
echo -e "${BLUE}Install Packages.sh${NC}    -----    current NVIDIA Release - "
export NVIDIA_DRIVER_VERSION="$(curl -silent https://slackbuilds.org/slackbuilds/14.2/system/nvidia-driver/nvidia-driver.info | grep VERSION= | cut -d"=" -f2 | sed -e 's/^"//' -e 's/"$//')"
