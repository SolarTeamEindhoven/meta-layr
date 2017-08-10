SUMMARY = "Widevine plugin for chromium"
#HOMEPAGE = ""
#SECTION = "libs"
LICENSE = "LGPLv2.1+"
LIC_FILES_CHKSUM = "file://README.md;md5=7c453f2981566b28c6fa787f2cc108a7"

SRCREV = "08f947d5e40600259bb698c3b95538e9f2bfecc2"
PV = "1.0.0"

SRC_URI = "https://github.com/kusti8/chromium-build/releases/download/netflix-1.0.0/chromium-browser_56.0.2924.84-0ubuntu0.14.04.1.1011.deb"

SRC_URI[md5sum] = "94504ef46346ecd1260cd590b38d8914"
SRC_URI[sha256sum] = "fb56b510db529916b79d7b3f5a04e6c1e26322b132eea2d9d170ff8274419f62"

S = "${WORKDIR}/chromium-build-netflix-1.0.0"

#inherit cmake pythonnative

DEPEND += "tar"

do_install () {
	install -d ${D}/opt/google/chrome/
	install -m 0644 ${WORKDIR}/usr/lib/chromium-browser/libwidevinecdm.so ${D}/opt/google/chrome/
	install -m 0644 ${WORKDIR}/usr/lib/chromium-browser/libwidevinecdmadapter.so ${D}/opt/google/chrome/
}

WARN_QA_remove = "ldflags"
ERROR_QA_remove = "ldflags"

PACKAGES = "${PN}"

FILES_${PN} = "/opt/google/chrome/"
