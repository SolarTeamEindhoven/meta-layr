FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += "\
    file://0001-Support-class-names-not-stating-with-capital-Q.patch \
    file://0001-Support-notify-signals-in-DBus-properties.patch \
"

PACKAGECONFIG[sctp] = "-sctp,-no-sctp,lksctp-tools"

PACKAGECONFIG_remove = "linuxfb"
PACKAGECONFIG += " \
    accessibility \
    dbus \
    eglfs \
    evdev \
    fontconfig \
    freetype \
    gbm \
    gif \
    gles2 \
    glib \
    harfbuzz \
    ico \
    icu \
    journald \
    kms \
    libinput \
    libproxy \
    libs \
    mtdev \
    openssl \
    qml-debug \
    sctp \
    sql-psql \
    sql-sqlite \
    tools \
    tslib \
    udev \
    widgets \
    xkbcommon-evdev \
    "

SRCREV = "02b0f44fab7808b4a687b526beada44c7015a98c"
