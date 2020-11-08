FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot-toradex:"

require recipes-bsp/u-boot/u-boot-mender.inc

# Not compatible with u-boot-toradex 2019.07
SRC_URI_remove = " \
    file://0006-env-Kconfig-Add-descriptions-so-environment-options-.patch \
"

SRC_URI_append = " \
    file://0001-env_default.h-use-mender-bootcommand-by-default.patch \
    file://0001-env_mender.h-add-more-colibri-imx6ull-specific-boota.patch \
"

PROVIDES += "u-boot"

MENDER_UBOOT_AUTO_CONFIGURE = "0"
