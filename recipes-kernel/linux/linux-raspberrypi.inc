do_configure_prepend() {
    mv -f ${B}/.config ${B}/.config.patched
    CONF_SED_SCRIPT=""

    kernel_configure_variable IIO y
    kernel_configure_variable IIO_TRIGGER y
    kernel_configure_variable IIO_KFIFO_BUF y
    kernel_configure_variable IIO_TRIGGERED_BUFFER y
    kernel_configure_variable IIO_BUFFER y
    kernel_configure_variable IIO_CONFIGFS y
    kernel_configure_variable IIO_SW_DEVICE y
    kernel_configure_variable IIO_SW_TRIGGER y
    kernel_configure_variable AD799X y

    # Keep this the last line
    # Remove all modified configs and add the rest to .config
    sed -e "${CONF_SED_SCRIPT}" < '${B}/.config.patched' >> '${B}/.config'
    rm -f ${B}/.config.patched
}
