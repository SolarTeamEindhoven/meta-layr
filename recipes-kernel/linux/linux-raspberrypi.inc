do_configure_prepend() {
    mv -f ${B}/.config ${B}/.config.patched
    CONF_SED_SCRIPT=""

    # Support for AD7998 ADC
    kernel_configure_variable IIO y
    kernel_configure_variable IIO_TRIGGER y
    kernel_configure_variable IIO_KFIFO_BUF y
    kernel_configure_variable IIO_TRIGGERED_BUFFER y
    kernel_configure_variable IIO_BUFFER y
    kernel_configure_variable IIO_CONFIGFS y
    kernel_configure_variable IIO_SW_DEVICE y
    kernel_configure_variable IIO_SW_TRIGGER y
    kernel_configure_variable AD799X y

    # SMAC and Co
    kernel_configure_variable IP_NF_SECURITY m
    kernel_configure_variable IP6_NF_SECURITY m
    kernel_configure_variable EXT2_FS_SECURITY y
    kernel_configure_variable EXT3_FS_SECURITY y
    kernel_configure_variable EXT4_FS_SECURITY y
    kernel_configure_variable SECURITY y
    kernel_configure_variable SECURITY_SMACK y
    kernel_configure_variable TMPFS_XATTR y
    kernel_configure_variable DEFAULT_SECURITY "smack"
    kernel_configure_variable DEFAULT_SECURITY_SMACK y
    kernel_configure_variable FANOTIFY_ACCESS_PERMISSIONS y

    # NBD for netboot
    kernel_configure_variable BLK_DEV_NBD y

    # ramblk for inird
    kernel_configure_variable BLK_DEV_RAM y

    # ramblk for inird
    kernel_configure_variable BLK_DEV_RAM y

    # Keep this the last line
    # Remove all modified configs and add the rest to .config
    sed -e "${CONF_SED_SCRIPT}" < '${B}/.config.patched' >> '${B}/.config'
    rm -f ${B}/.config.patched
}
