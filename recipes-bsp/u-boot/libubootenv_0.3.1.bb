SUMMARY = "U-Boot libraries and tools to access environment"

DESCRIPTION = "This package contains tools and libraries to read \
and modify U-Boot environment. \
It provides a hardware-independent replacement for fw_printenv/setenv utilities \
provided by U-Boot"

HOMEPAGE = "https://github.com/sbabic/libubootenv"
LICENSE = "LGPL-2.1"
LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
SECTION = "libs"

SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https \
           file://fw_env.config \
"

SRCREV = "95101640b28501bcc1971db30115905c2320fafa"

S = "${WORKDIR}/git"

inherit uboot-config cmake lib_package

EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"

DEPENDS = "zlib"
PROVIDES += "u-boot-fw-utils"
RPROVIDES_${PN}-bin += "u-boot-fw-utils"

FILES_${PN}-bin_append = " ${sysconfdir}/fw_env.config /data/u-boot/fw_env.config"

PACKAGE_ARCH = "${MACHINE_ARCH}"

do_install_append () {
    install -d ${D}${sysconfdir}
    install -d ${D}/data/u-boot
    install -m 0644 ${WORKDIR}/fw_env.config ${D}/data/u-boot/fw_env.config
    lnr ${D}/data/u-boot/fw_env.config ${D}${sysconfdir}/fw_env.config
}

BBCLASSEXTEND = "native"
