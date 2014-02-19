##############################################################################
# Build configuration
#
# Set this to the name of the board you want to build
ARMSTRAP_CONFIG="CubieBoard2"

##############################################################################
# Basic configuration
#
# Set this to the hostname you want for the board, default is "armStrap"
ARMSTRAP_HOSTNAME="PHGateway"
# Set this to the password you want for the root user, default is "armStrap"
ARMSTRAP_PASSWORD="phGateway"

##############################################################################
# TimeZone
# If you want to select the timezone, set it here. If not, America/Montreal
# is used as the default.
#
ARMSTRAP_TIMEZONE="Etc/UTC"

##############################################################################
# Locales
# By default, armStrap install the default locale of the maching used to
# run the script, if you want to change it, set it here.
#
#ARMSTRAP_LANG="fr_CA.UTF-8"
#ARMSTRAP_LANGUAGE="fr_CA:fr"
#
# If you want to install more locales, set it here.
#ARMSTRAP_LANG_EXTRA="fr_CA.ISO-8859-1"

##############################################################################
# Swapfile
# ArmStrap always create a swapfile, the default size is 128MB, you can
# adjust the swapfile configuration here. Once the board is booted you can
# always modify /etc/dphys-swapfile to change theses values.
# 
# Size of the swap file (in MB), if 0, dphys-swapfile will try to guess
# the correct size of the swapfile.
#ARMSTRAP_SWAPSIZE="1024"
# Location of the swap file
#ARMSTRAP_SWAPFILE="/var/swap"
#
# If we are autodetecting swap size, this control its size  (SWAPSIZE = 
# SWAPFACTOR x RAM)
#ARMSTRAP_SWAPFACTOR="2"
# The maximum size of the swapfile in autodetect mode
#ARMSTRAP_MAXSWAP=2048

##############################################################################
# OS Section
#
# Currently we support ubuntu and debian for armv7l and Raspbian for armv6l.
# Board configuration generally have debian stable as default value.
#
# See help for valid targets.
#
#ARMSTRAP_ROOTFS_FAMILY="ubuntu"
#ARMSTRAP_ROOTFS_VERSION="saucy"

##############################################################################
# Kernel Section
#
# Some board can use many kernels, the stable one is the default but you can
# try an alternate version if you wish. See armStrap -? for a list of avalable
# kernels.
#
# See help for valid targets.
#
#ARMSTRAP_KERNEL_CONFIG="default"
#ARMSTRAP_KERNEL_VERSION="3.4.67"
#
# If you want to test the unified 3.13 kernel, you must override the default
# CPU of the board (eventually, sunxi will become the default CPU but right
# now, the kernel is too young to make it the default one, that's why the
# repository is called sunxi-test... Once it's matured enough, i will create
# a sunxi repository and keep sunxi-test for mainline development.)
#
#ARMSTRAP_BOARD_KERNEL="sunxi-test"
#ARMSTRAP_KERNEL_VERSION="3.13.0"
#
# You can add kernel modules to the default ones here
#
#ARMSTRAP_KERNEL_MODULES=""
ARMSTRAP_KERNEL_MODULES="tty cdc_acm acm r8712u r8192s_usb r8192u_usb rt2870sta rt73usb rtl8187 rtl8192cu rt2500usb rt2501usb rt2800usb"

##############################################################################
# BootLoader Section
#
#
# If you want to change the kernel root device (like for installing on NAND)
# change it there... Default is to boot from first partition of SD card.
#
ARMSTRAP_LOADER_ROOT="/dev/mmcblk0p1"

##############################################################################
# Packages Sections
#
# If you want to install packages to the base distribution, add them here
ARMSTRAP_DPKG_EXTRAPACKAGES="git-core apache2 isc-dhcp-server-ldap php5 libapache2-mod-php5 ntp cpufrequtils sysfsutils usbutils wvdial"
#
# If you want to reconfigure packages, add them here
#ARMSTRAP_DPKG_RECONFIG=""

##############################################################################
# Network configuration
#
# By default, the board will get its ip address by dhcp, uncomment and
# ajust the following if you want a static ip.
#ARMSTRAP_ETH0_MODE="static"
#ARMSTRAP_ETH0_IP="192.168.0.100" 
#ARMSTRAP_ETH0_MASK="255.255.255.0"
#ARMSTRAP_ETH0_GW="192.168.0.1" 
#ARMSTRAP_ETH0_DNS="8.8.8.8 8.8.4.4"
#ARMSTRAP_ETH0_DOMAIN="localhost.com"
# Some board need a mac address, if this is not set and the board need one,
# a pseudo random mac address will be generated. The vendor mac prefix used
# to generate the mac address is define in the board configuration.
#ARMSTRAP_MAC_ADDRESS="DEADBEEFBAAD"

##############################################################################
# Output configuration
#
# If you want to install directly into your SD card, put the device here. If
# it's not defined, an image will be generated.
#ARMSTRAP_DEVICE="/dev/sdc"
# If you want to name your image something else than the generated name
#ARMSTRAP_IMAGE_NAME="wathever_you_want_to_name_your_image.img"
# Specify the size of the image to be build in MB
#ARMSTRAP_IMAGE_SIZE="2048"

##############################################################################
# armStrap Repository Enabler
#
# Unless you're me, or you want to run your own repo with your own builds leave
# this option commented out.
#ARMSTRAP_ABUILDER_REPO_ENABLE="Yes"
