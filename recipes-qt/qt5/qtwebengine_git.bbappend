
PACKAGECONFIG[proprietary] = "WEBENGINE_CONFIG+=use_proprietary_codecs,,"
PACKAGECONFIG[ppapi] = "WEBENGINE_CONFIG+=use_pepper_plugins,,"

RDEPENDS_${PN} += "widevine"

PACKAGECONFIG += "opus ffmpeg libwebp flac libevent libxslt speex vpx proprietary ppapi"

SRC_URI_remove = "file://0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch"

SRCREV_qtwebengine = "fb639faa8898ce6b8fbcc8870ec316114a79f975"
SRCREV_chromium = "02fb09feaed516d49c50f51172d687adf382e49e"
