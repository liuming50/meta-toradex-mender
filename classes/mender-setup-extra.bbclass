get_uboot_interface_from_device() {
    case "$1" in
        /dev/mmcblk* )
            echo mmc
            ;;
        /dev/vd* )
            echo virtio
            ;;
        *)
            bberror "Could not determine U-Boot interface from $1"
            exit 1
            ;;
    esac
}

get_uboot_device_from_device() {
    dev_base="0"
    case "$1" in
        /dev/mmcblk*p* )
            dev_base=$(echo $1 | cut -dk -f2 | cut -dp -f1)
            ;;
        /dev/mmcblk* )
            dev_base=$(echo $1 | cut -dk -f2)
            ;;
    esac

    device=$(printf "%d" $dev_base 2>/dev/null)
    if [ $? = 1 ]; then
        bberror "Could not determine U-Boot device from $1"
        exit 1
    else
        echo $device
    fi
}

get_part_number_from_device() {
    dev_base="unknown"
    case "$1" in
        /dev/mmcblk*p* )
            dev_base=$(echo $1 | cut -dk -f2 | cut -dp -f2)
            ;;
        /dev/[vsh]d[a-z][1-9])
            dev_base=${1##*d[a-z]}
            ;;
        /dev/nvme[0-9]n[0-9]p[0-9])
            dev_base=$(echo $1 | cut -dp -f2)
            ;;
        ubi*_* )
            dev_base=$(echo $1 | cut -d_ -f2)
            ;;
        /dev/disk/by-partuuid/* )
            bberror "Please enable mender-partuuid Distro feature to use PARTUUID"
            ;;
    esac
    part=$(printf "%d" $dev_base 2>/dev/null)
    if [ $? = 1 ]; then
        bberror "Could not determine partition number from $1"
        exit 1
    else
        echo $part
    fi
}

def mender_linux_partition_base(dev):
    import re
    if re.match("^/dev/[vsh]d[a-z]", dev):
        return dev
    else:
        return "%sp" % dev
