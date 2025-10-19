LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

KERNEL_REPO ?= "git://github.com/altera-fpga/linux-socfpga.git"
KERNEL_PROT ?= "https"

require recipes-kernel/linux/linux-yocto.inc

inherit kernel

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI = "${KERNEL_REPO};protocol=${KERNEL_PROT};branch=${KBRANCH}"
SRC_URI:append = " file://socfpga.cfg"

S = "${WORKDIR}/git"

LINUX_VERSION_EXTENSION ?= "-altera-lts" 

KERNEL_IMAGETYPE = "zImage"
KERNEL_IMAGETYPE:aarch64 = "Image"

PV = "${LINUX_VERSION}+git${SRCREV}"

KBRANCH = "socfpga-${LINUX_VERSION}-lts"
