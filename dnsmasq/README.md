# Example 1: DHCP & TFT, using PXE

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
