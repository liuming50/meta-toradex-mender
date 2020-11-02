UBOOT_MACHINE = "qemu_arm64_defconfig"
UBOOT_ENTRYPOINT = "0x40080000"

KERNEL_CLASSES = "kernel-mender-fitimage"
KERNEL_IMAGETYPE_qemuarm64 = "fitImage"

IMAGE_BOOT_FILES_qemuarm64 = "boot.scr"
WKS_FILE_DEPENDS_append = " virtual/bootloader u-boot-default-script"

# We are using fitimage for qemuarm64 machine
MACHINE_ESSENTIAL_EXTRA_RDEPENDS_remove = "kernel-devicetree"

QB_MACHINE = "-machine virt"
QB_DRIVE_TYPE = "/dev/vda"
QB_DEFAULT_FSTYPE = "sdimg"
QB_ROOTFS_OPT = "-drive file=@ROOTFS@,if=sd,format=raw"
QB_MEM_qemuarm64 = "-m 1057"
QB_OPT_APPEND_qemuarm64 = "-show-cursor -device VGA,edid=on -device qemu-xhci -device usb-tablet -device usb-kbd -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -no-acpi -bios ${DEPLOY_DIR_IMAGE}/u-boot.bin -d unimp -semihosting-config enable,target=native"

PREFERRED_RPROVIDER_network-configuration_qemuarm64 = "networkd-static-conf"
PREFERRED_RPROVIDER_u-boot-default-script_qemuarm64 = "u-boot-mender-boot"
PREFERRED_RPROVIDER_u-boot-default-env = "u-boot-env"
