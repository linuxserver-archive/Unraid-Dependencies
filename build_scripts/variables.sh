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
libgudev \
libmpc \
libtool \
libunistring \
libffi \
libmnl \
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

##clean up old files if they exist
echo -e "${BLUE}Variables.sh${NC}    -----    clean up old files if they exist"
[[ -f "$D"/FILE_LIST_CURRENT ]] && rm "$D"/FILE_LIST_CURRENT
[[ -f "$D"/URLS_CURRENT ]] && rm "$D"/URLS_CURRENT
