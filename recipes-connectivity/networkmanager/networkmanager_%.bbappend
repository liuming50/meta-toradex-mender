FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += "file://boatrax-nmconnection.conf file://network.nmconnection.in"

PACKAGECONFIG_remove = "ifupdown dnsmasq"

RPROVIDES_${PN}_append = " network-configuration"

do_install_append() {
    install -m 0600 ${WORKDIR}/boatrax-nmconnection.conf ${D}${nonarch_libdir}/NetworkManager/conf.d

    sed -e "s/@NET_NUM@/0/g" \
        ${WORKDIR}/network.nmconnection.in \
        >  ${D}${sysconfdir}/NetworkManager/system-connections/network0.nmconnection

    sed -e "s/@NET_NUM@/1/g" \
        ${WORKDIR}/network.nmconnection.in \
        >  ${D}${sysconfdir}/NetworkManager/system-connections/network1.nmconnection

    chmod 0600 ${D}${sysconfdir}/NetworkManager/system-connections/network?.nmconnection
}
