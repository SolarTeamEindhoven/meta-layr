UMMARY = "Roboto fonts - TTF Version"
SECTION = "fonts"
HOMEPAGE = "https://www.google.com/fonts/specimen/Roboto"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
PR = "r0"
# we don't need a compiler nor a c library for these fonts
INHIBIT_DEFAULT_DEPS = "1"

inherit allarch
inherit qmake5_paths

SRC_URI = "git://github.com/google/roboto.git;protocol=https"
SRCREV = "23fb71672823d4d3d9616f8f541531de1aca2500"
S = "${WORKDIR}/git"

FONT_PACKAGES = "ttf-roboto"

do_compile() {
}

do_install() {
    # Different versions of OE seems to require different places for fonts so we install in both share and lib...
    install -d ${D}/usr/share/fonts/
    find ./ -name '*.tt[cf]' -exec install -m 0644 {} ${D}/usr/share/fonts/ \;
}

FILES_${PN} += "/usr/share/fonts/"
