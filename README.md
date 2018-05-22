# pxe-boot-server

..in progress..

## Resources

* dnsmasq (dns, dhcp, tftp)
* (pxelinux)[https://www.syslinux.org/wiki/index.php?title=PXELINUX] (network bootloader)
* (syslinux)[https://www.syslinux.org/wiki/index.php?title=SYSLINUX] (fat bootloader)
* (isolinux)[https://www.syslinux.org/wiki/index.php?title=ISOLINUX] (iso bootloader)
* (extlinux)[https://www.syslinux.org/wiki/index.php?title=EXTLINUX] (ext+ bootloader)

## Traditional server installation

Dedicated installation on RedHat-based server (CentOS) using CLI, using dnsmasq

1) Install required software:
  - # yum -y install dnsmasq syslinux pxelinux

2) Configure dnsmasq: see /example/dnsmasq.conf
  - # vi /etc/dnsmasq.conf

    port=0

    log-dhcp
    dhcp-range=<ip-range-start>,<ip-range-end>,<ip-subnet>,<lease-time>
    dhcp-option=<option-id>,<configuration>

    enable-tftp
    tftp-root=/var/lib/tftpboot
