FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://inittab"
do_install:append() {
        install -d ${D}${sysconfdir}
        install -D -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
}