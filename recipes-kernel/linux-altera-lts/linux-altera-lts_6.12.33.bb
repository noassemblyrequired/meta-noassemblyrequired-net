require linux-altera.inc

LINUX_VERSION = "6.12.33"
SRCREV="3234b1ed89566a5e8b6c22c68bdfd36347174267"
SRC_URI += " file://socfpga_defconfig_6.12.33"
SRC_URI += " file://socfpga.cfg"
