DESCRIPTION = "Custom Device Tree Overlays"
LICENSE = "CLOSED"
PR = "r0"
DEPENDS:append = " dtc-native"

SRC_URI = "file://enable_bridges.dts"
SRC_URI:append = " file://dtbo-apply"

S = "${WORKDIR}"

do_compile() {
    for dts in ${S}/*.dts; do
        dtc -I dts -O dtb -o ${WORKDIR}/$(basename ${dts} .dts).dtbo ${dts}
    done
}

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware/overlays
    for dtbo in ${WORKDIR}/*.dtbo; do
        install -m 0644 ${dtbo} ${D}${nonarch_base_libdir}/firmware/overlays/
    done

    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/dtbo-apply ${D}${sysconfdir}/init.d/dtbo-apply
}

FILES:${PN} += "${nonarch_base_libdir}/firmware/overlays/*.dtbo ${sysconfdir}/init.d/dtbo-apply"

inherit update-rc.d

INITSCRIPT_NAME = "dtbo-apply"
INITSCRIPT_PARAMS = "defaults"