
PACKAGECONFIG[proprietary] = "WEBENGINE_CONFIG+=use_proprietary_codecs,,"
PACKAGECONFIG[ppapi] = "WEBENGINE_CONFIG+=use_pepper_plugins,,"
PACKAGECONFIG[embedded] = "WEBENGINE_CONFIG+=embedded_build,,"

RDEPENDS_${PN} += "widevine"

PACKAGECONFIG += "opus ffmpeg libwebp flac libevent libxslt speex vpx proprietary ppapi"
