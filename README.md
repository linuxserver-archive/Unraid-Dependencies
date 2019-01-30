![https://linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)


## NVIDIA Driver Install

* From a base Unraid install and in a dedicated cache directory run this.

It will compile the kernel, with the nvidia kernel modules and nvidia drivers.  

```
#!/bin/bash

wget -nc https://raw.githubusercontent.com/linuxserver/Unraid-Nvidia/master/build_scripts/build.sh
chmod +x build.sh
./build.sh
```

To grab card identity
`lspci -v | grep GeForce | grep VGA | cut -d [ -f 2 | cut -d ] -f 1`

To grab driver module
`lspci -v | grep driver | grep nvidia | cut -d : -f 2`

To grab kernel module
`lspci -v | grep modules | grep nvidia | cut -d : -f 2`
