# pxe-boot-server

..in proggress..

## Resources

* dnsmasq (dns, dhcp, pxe, tftp)
* (pxelinux)[https://www.syslinux.org/wiki/index.php?title=PXELINUX] (network bootloader)
* (syslinux)[https://www.syslinux.org/wiki/index.php?title=SYSLINUX] (fat bootloader)
* (isolinux)[https://www.syslinux.org/wiki/index.php?title=ISOLINUX] (iso bootloader)
* (extlinux)[https://www.syslinux.org/wiki/index.php?title=EXTLINUX] (ext+ bootloader)

## Traditional server installation

Dedicated installation on RedHat-based server (CentOS) using CLI, using dnsmasq

1) Install required software:
  - # yum -y install dnsmasq syslinux pxelinux
