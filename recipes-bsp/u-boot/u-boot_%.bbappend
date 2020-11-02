FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

MENDER_UBOOT_AUTO_CONFIGURE_qemuarm64 = "0"

SRC_URI_append_qemuarm64 = " \
    file://0001-qemu-arm-increase-bootm-length-to-64M.patch \
    file://0001-fat-check-for-buffer-size-before-reading-blocks.patch \
    file://0001-env-Kconfig-support-SYS_REDUNDAND_ENVIRONMENT-for-EN.patch \
    file://bootcount.cfg \
    file://bootlimit.cfg \
    file://fitfatenv.cfg \
"
