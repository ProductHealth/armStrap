# Usage: installOS
function installOS {
  httpExtract "${BUILD_MNT_ROOT}" "${BUILD_ARMBIAN_ROOTFS}" "${BUILD_ARMBIAN_EXTRACT}"

  chrootLocales "${BUILD_MNT_ROOT}" "${BUILD_LANG}" "${BUILD_LANG_EXTRA}"
  chrootTimeZone "${BUILD_MNT_ROOT}" "${BUILD_TIMEZONE}"
  
  setHostName "${BUILD_MNT_ROOT}" "${ARMSTRAP_HOSTNAME}"
  
  chrootUpgrade "${BUILD_MNT_ROOT}"
  
  if [ -n "${BUILD_DPKG_EXTRAPACKAGES}" ]; then
    chrootInstall "${BUILD_MNT_ROOT}" "${BUILD_DPKG_EXTRAPACKAGES}"
  fi
  
  if [ -n "${ARMSTRAP_SWAP}" ]; then
    printf "CONF_SWAPSIZE=%s" "${ARMSTRAP_SWAP_SIZE}" > "${BUILD_MNT_ROOT}/etc/dphys-swapfile"
  else
    printf "CONF_SWAPSIZE=0" > "${BUILD_MNT_ROOT}/etc/dphys-swapfile"
  fi

  if [ ! -z "${BUILD_ARMBIAN_RECONFIG}" ]; then
    chrootReconfig "${BUILD_MNT_ROOT}" "${BUILD_ARMBIAN_RECONFIG}"
  fi
  
  BUILD_DPKG_LOCALPACKAGES="`find ${ARMSTRAP_BOARDS}/${ARMSTRAP_CONFIG}/dpkg/*.deb -maxdepth 1 -type f -print0 | xargs -0 echo` ${BUILD_DPKG_LOCALPACKAGES}"

  if [ ! -z "${BUILD_DPKG_LOCALPACKAGES}" ]; then
    for i in ${BUILD_DPKG_LOCALPACKAGES}; do
      chrootDPKG "${BUILD_MNT_ROOT}" ${i}
    done
  fi

  chrootPassword "${BUILD_MNT_ROOT}" "${ARMSTRAP_PASSWORD}"
  
  addTTY "${BUILD_MNT_ROOT}" "${BUILD_SERIALCON_ID}" "${BUILD_SERIALCON_RUNLEVEL}" "${BUILD_SERIALCON_TERM}" "${BUILD_SERIALCON_SPEED}" "${BUILD_SERIALCON_TYPE}"

  initFSTab "${BUILD_MNT_ROOT}" 
  addFSTab "${BUILD_MNT_ROOT}" "${BUILD_FSTAB_ROOTDEV}" "${BUILD_FSTAB_ROOTMNT}" "${BUILD_FSTAB_ROOTFST}" "${BUILD_FSTAB_ROOTOPT}" "${UILD_FSTAB_ROOTDMP}" "${BUILD_FSTAB_ROOTPSS}"

  for i in "${BUILD_KERNEL_MODULES}"; do
    addKernelModule "${BUILD_MNT_ROOT}" "${i}"
  done

  addIface "${BUILD_MNT_ROOT}" "eth0" "${ARMSTRAP_ETH0_MODE}" "${ARMSTRAP_ETH0_IP}" "${ARMSTRAP_ETH0_MASK}" "${ARMSTRAP_ETH0_GW}" "${ARMSTRAP_ETH0_DOMAIN}" "${ARMSTRAP_ETH0_DNS}"
  
  chrootKernel "${BUILD_MNT_ROOT}" "${BUILD_ARMBIAN_KERNEL}"
  
  httpExtract "${BUILD_MNT_ROOT}/boot" "${BUILD_ARMBIAN_UBOOT}" "${BUILD_ARMBIAN_EXTRACT}"
  
  rm -f "${BUILD_BOOT_CMD}"
  touch "${BUILD_BOOT_CMD}"
  
  ubootSetEnv "${BUILD_BOOT_CMD}" "bootargs" "${BUILD_CONFIG_CMDLINE}"
  ubootSetEnv "${BUILD_BOOT_CMD}" "ext2load" "${BUILD_BOOT_BIN_LOAD}"
  ubootSetEnv "${BUILD_BOOT_CMD}" "ext2load" "${BUILD_BOOT_KERNEL_LOAD}"
  ubootSetEnv "${BUILD_BOOT_CMD}" "bootm" "${BUILD_BOOT_KERNEL_ADDR}"
  
  ubootImage ${BUILD_BOOT_CMD} ${BUILD_BOOT_SCR}
  
  if [ "${ARMSTRAP_MAC_ADDRESS}" != "" ]; then
    fexMac "${BUILD_BOOT_FEX}" "${ARMSTRAP_MAC_ADDRESS}"
  fi
  
  ${BUILD_MNT_ROOT}/boot/fexc_x86 -I fex -O bin ${BUILD_BOOT_FEX} ${BUILD_BOOT_BIN}
  rm -f ${BUILD_MNT_ROOT}/boot/fexc_x86
  
  ubootDDLoader "${BUILD_BOOT_SPL}" "${ARMSTRAP_DEVICE}" "${BUILD_BOOT_SPL_SIZE}" "${BUILD_BOOT_SPL_SEEK}"
  ubootDDLoader "${BUILD_BOOT_UBOOT}" "${ARMSTRAP_DEVICE}" "${BUILD_BOOT_UBOOT_SIZE}" "${BUILD_BOOT_UBOOT_SEEK}"
}