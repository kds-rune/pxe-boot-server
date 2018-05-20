# File- and folderstructure

This folder shows an example structure for a basic pxe-bootserver

- root folder: pxe bootimages (from syslinux)
- images: boot-imagefiles (vmlinuz and initrd.img from distros)
- pxelinux.cfg: config/menufiles

run 'copy-bootimages.sh' to copy files from syslinux-folder (requires syslinux installed)

## Basic description of pxe booting

1) Client boots, and requests ip from DHCP-server
2) DHCP-server responds, and eventually the client receives an ip-lease
3) DHCP-server sends info about tFTP-server (option 66*) & boot-image (option 67)
4) Client downloads & executes boot-image
5) Client looks for configuration-file in the pxelinux.cfg-folder (if no other found, it uses 'default')

* if tFTP-server is the same as DHCP-server, then option 66 can be ignored

## Required files

### PXE Bootimage

* Example: pxelinux.0

This is the bootloader. It is selected based on the client architecture.
Note that EFI doesn't require a booltoader, as it can execute kernel-files directly

### PXE Configuration

* Example: pxelinux.cfg/default

This files can be an interactive menu, or it can be specific settings based on mac-address,
tags or other parameters. It specifies which kernel and ramdisk to use

### VMLINUZ

This is the bootable, compressed linux kernel-file

### INITRD

This is an 'initial ramdisk'; it contains an initial root-filesystem, with helperfiles
for the linux kernel
