FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot-toradex:"

require recipes-bsp/u-boot/u-boot-mender.inc

SRC_URI_remove = " \
    file://0006-env-Kconfig-Add-descriptions-so-environment-options-.patch \
"

SRC_URI_append = " \
    file://0001-colibri-imx6ull-use-distro-boot-by-default.patch \
"

PROVIDES += "u-boot"

MENDER_UBOOT_AUTO_CONFIGURE = "0"
