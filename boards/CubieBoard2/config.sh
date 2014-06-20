# Theses must always be set for a board configuration
BOARD_CPU="sun7i"
BOARD_CPU_ARCH="arm"
BOARD_CPU_FAMILY="v7l"

BOARD_LOADER="u-boot-sunxi"

BOARD_KERNEL="${BOARD_CPU}"
BOARD_KERNEL_CONFIG="default"
BOARD_KERNEL_MODULES="sw_ahci_platform lcd hdmi ump disp mali mali_drm cdc_acm r8712u r8192s_usb r8192u_usb rt2870sta rt73usb rtl8187 rtl8192cu rt2500usb rt2501usb rt2800usb"BOARD_KERNEL_DTB="sun7i-a20-cubieboard2.dtb"

BOARD_LOADER_NAND_KERNEL="/boot/bootloader/uImage"

BOARD_ROOTFS="${BOARD_CPU_ARCH}${BOARD_CPU_FAMILY}"
BOARD_ROOTFS_FAMILY="debian"
BOARD_ROOTFS_VERSION="stable"

# Include the default values last.
source ${ARMSTRAP_BOARDS}/.defaults/sunxi.sh
