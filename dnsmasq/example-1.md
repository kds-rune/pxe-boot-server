# Example 1: DHCP & TFT, using PXE

Files & folders:

### Dnsmasq configuration (dhcp, dns & tftp)
- /etc/dnsmasq.conf

### PXE bootmenu files
- /var/lib/tftpboot/pxelinux.cfg/<filenames>

### Bootloader files
- /var/lib/tftpboot/pxelinux.0: single entries
- /var/lib/tftpboot/menu.c32: interactive menu

### Kernel files
- /var/lib/tftpboot/images/<distribution>/<version>/<architecture>/vmlinuz


## /etc/dnsmasq.conf
```
dhcp-range=172.16.10.1,172.16.10.255,30m
enable-tftp
tftp-root=/var/lib/tftpboot

# Legacy PXE
dhcp-match=set:bios,option:client-arch,0
dhcp-boot=pxelinux.0

# UEFI
dhcp-match=set:efi32,option:client-arch,6
dhcp-boot=tag:efi32,pxelinux.0

dhcp-match=set:efibc,option:client-arch,7
dhcp-boot=tag:efibc,pxelinux.0

dhcp-match=set:efi64,option:client-arch,9
dhcp-boot=tag:efi64,pxelinux.0

# verbose
log-queries
log-dhcp

# disable DNS and specify alternate
port=0
dhcp-option=6,208.67.222.222,208.67.220.220
```

For the dhcp-match, the values at the end corresponds to the following table:
```
      Id   Name
      ---  -----------------
       0    Intel x86PC
       1    NEC/PC98
       2    EFI Itanium
       3    DEC Alpha
       4    Arc x86
       5    Intel Lean Client
       6    EFI IA32
       7    EFI BC
       8    EFI Xscale
       9    EFI x86-64
```

## /var/lib/tftpboot/pxelinux.cfg/default

```
default menu.c32
prompt 0
timeout 300
ONTIMEOUT local

MENU TITLE Main Menu

LABEL local
        MENU LABEL Boot local disk
        LOCALBOOT 0

LABEL server_linux_x64
        MENU LABEL Linux Installation
        KERNEL menu.c32
        APPEND pxelinux.cfg/x86_64_Linux

```

## /var/lib/tftpboot/pxelinux.cfg/x86_64_Linux

```
MENU TITLE Linux Installation Menu

LABEL Main Menu
        MENU LABEL Main Menu
        KERNEL menu.c32
        APPEND pxelinux.cfg/default

LABEL CentOS 7
        MENU LABEL CentOS 7 (x86_64)
        KERNEL images/centos/7/x86_64/vmlinuz
        APPEND ks initrd=images/centos/7/x86_64/initrd.img ramdisk_size=100000 ksdevice=eth1 ip=dhcp url --url http://mirror.centos.org/centos/7/os/x86_64/

LABEL Ubuntu 18.04
        MENU LABEL Ubuntu 18.04 (x86_64)
        KERNEL images/ubuntu/bionic/x86_64/vmlinuz
        APPEND ks initrd=images/ubuntu/bionic/x86_64/initrd.img ramdisk_size=100000 ksdevice=eth0 ip=dhcp url --url http://archive.ubuntu.com/ubuntu/dists/bionic/main/installer-amd64/
```
