#!/bin/bash
set -e

##set our package list - Note gcc-go fixed for now until LT upgrade to GCC v9.x
export nvidia_package_current="
atk,
brotli,
bzip2,
cairo,
cairomm,
dbus,
expat,
fontconfig,
freetype,
fribidi,
gcc-go,
gdk-pixbuf2,
glib2,
gtk+2,
gtk+3,
gtkmm2,
gtkmm3,
gperf,
graphite2,
shared-mime-info,
harfbuzz,
libdrm,
libffi,
libglvnd,
libpciaccess,
libpng,
libpthread-stubs,
libvdpau,
libX11,
libXau,
libxcb,
libXdamage,
libXdmcp,
libXext,
libXfixes,
libXrandr,
libXrender,
libxshmfence,
libXft,
libXv,
libXvMC,
libXxf86vm,
libxml2,
libzip,
mesa,
opencl-headers,
pango,
pangomm,
pkgtools,
pcre2,
pcre,
pixman,
util-linux,
xcb-proto,
xorgproto,
xorg-server,
xrandr,
wxGTK3,
zlib
"

##current NVIDIA Release from Slackbuild
export NVIDIA_DRIVER_VERSION="$(curl -silent https://slackbuilds.org/slackbuilds/14.2/system/nvidia-driver/nvidia-driver.info | grep VERSION= | cut -d"=" -f2 | sed -e 's/^"//' -e 's/"$//')"
