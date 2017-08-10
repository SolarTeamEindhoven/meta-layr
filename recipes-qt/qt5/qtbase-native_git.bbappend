FILESEXTRAPATHS_prepend := "${THISDIR}/qtbase:"

SRC_URI += "\
    file://0001-Support-class-names-not-stating-with-capital-Q.patch \
    file://0001-Support-notify-signals-in-DBus-properties.patch \
"

SRCREV = "02b0f44fab7808b4a687b526beada44c7015a98c"
