armStrap
========

An universal sd/image creator for small arm development platform

Prerequisite
------------

You will need to run this from Linux and it has been tested with Ubuntu 13.x 64bits

You will need dpkg-dev installed:

    sudo aptitude install dpkg-dev

You will also need gcc for ARM:

	sudo aptitude install gcc-4.8-arm-linux-gnueabihf
	ln -s /usr/bin/arm-linux-gnueabihf-gcc-4.8 /usr/bin/arm-linux-gnueabihf-gcc



QuickStart
----------

You need to be root to run this script. You have two options:

1) With no parameter from the command line, create an image using values found in config.sh.

2) Configure your build using the command line (Not recommended for version 0.8x, i've made
   many changes and some options have changed meanings or simply do nothing. Use the config
   file until i remove this message) :

    armStrap.sh version 0.82
    Copyright (C) 2013 Eddy Beaupre

    Usage : sudo armStrap.sh [PARAMETERS]

    Image/SD Builder:
      -b <BOARD>              Use board definition <BOARD>.
      -d <DEVICE>             Write to <DEVICE> instead of creating an image.
      -i <FILE>               Set image filename to <FILE>.
      -s <SIZE>               Set image size to <SIZE>MB.
      -h <HOSTNAME>           Set hostname.
      -p <PASSWORD>           Set root password.
      -w <SIZE>               Enable swapfile.
      -W                      Disable swapfile.
      -Z <SIZE>               Set swapfile size to <SIZE>MB.
      -n "<IP> <MASK> <GW>"   Set static IP.
      -N                      Set DHCP IP.
      -r "<NS1> [NS2] [NS3]"  Set nameservers.
      -e <DOMAIN>             Set search domain.
    
    Kernel Builder:
      -K <ARCH>               Build Kernel (debian packages). (Build all if arg is -)
         -                    Build all avalables Kernel.
      -I                      Call menuconfig before building Kernel.
    
    BootLoader Builder:
      -B <BOOTLOADER>         Build BootLoader (.txz package).
         -                    Build all avalables BootLoaders.
      -F <FAMILY>             Select bootloader family.
    
    RootFS updater:
      -R <ROOTFS>             Update RootFS (.txz package).
         -                    Update all avalables RootFS.
      -O <FAMILY>             Select which RootFS to update.
      -M                      Execute a shell into the RootFS instead of updating it.
    
    All Builder:
      -A                      Build Kernel/RootFS/U-Boot for all boards/configurations
    
    Utilities:
      -g                      Disable GUI.
      -q                      Quiet.
      -c                      Directory Cleanup.
      -l                      Show licence.
    
    Avalable boards, kernels and RootFS:
    
              Board          Kernel    Family      BootLoader
    --------------- --------------- ---------- ---------------
              A70Xh           sun7i     armv7l    u-boot-sunxi
         CubieBoard           sun4i     armv7l    u-boot-sunxi
        CubieBoard2           sun7i     armv7l    u-boot-sunxi
         CubieTruck     sun7i-stage     armv7l    u-boot-sunxi
          HackBerry           sun4i     armv7l    u-boot-sunxi
        RaspBerryPI          bcmrpi     armv6l            none
    
             Kernel     Config    Version
    --------------- ---------- ----------
         sunxi-test    default     3.13.0
        sun7i-stage    default    3.4.67+
              sun7i    default     3.4.67
        sun4i-stage    default    3.4.67+
              sun4i    default     3.4.67
             bcmrpi    default    3.6.11+
    
             RootFS    Family     Version
    --------------- ---------- ----------
             armv7l     ubuntu      saucy
             armv7l     ubuntu    rarring
             armv7l     debian     wheezy
             armv7l     debian    testing
             armv7l     debian     stable
             armv7l     debian        sid
             armv7l     debian     jessie
             armv6l   raspbian     wheezy
             armv6l   raspbian    testing
             armv6l   raspbian     stable
             armv6l   raspbian     jessie
    
    With no parameter, create an image using values found in config.sh.

Licence
-------
Copyright (c) 2013 Eddy Beaupre. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 
2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
