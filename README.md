![https://linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)

## Unraid Dependencies

### Format of variable files
* Commmon variables `variables.sh`
* Nvidia specific variables `nvidia-variables.sh`
* DVB specific variables `dvb-variables.sh`

### files folder

For any precompiled files used in either DVB or Nvidia builds

### gcc folder

Currently contains Slackware packages for gcc version 8.3 and associated v8.3 files.  When LT compile with gcc version 9.x then gcc and gcc-g++ could be put back into `variables.sh` and gcc-go back into `nvidia-variables.sh` for pulling from slackware-current directly.
