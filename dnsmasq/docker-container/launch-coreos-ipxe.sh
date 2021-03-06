#!/bin/bash
sudo docker run -d --rm --cap-add=NET_ADMIN --network="host" quay.io/coreos/dnsmasq \
  --no-daemon \
  --no-resolv \
  --log-queries \
  --log-dhcp \
  --enable-tftp \
  --tftp-root=/var/lib/tftpboot \
  --dhcp-range=172.16.10.100,172.16.10.200,10m \
  --dhcp-option=3,172.16.8.100 \
  --dhcp-option=42,129.240.2.6 \
  --strict-order \
  --server=208.67.222.222 \
  --server=208.67.220.220 \
  --server=8.8.8.8 \
  --server=8.8.4.4 \
  --dhcp-match=set:bios,option:client-arch,0 \
  --dhcp-boot=tag:bios,undionly.kpxe \
  --dhcp-match=set:efi32,option:client-arch,6 \
  --dhcp-boot=tag:efi32,ipxe.efi \
  --dhcp-match=set:efibc,option:client-arch,7 \
  --dhcp-boot=tag:efibc,ipxe.efi \
  --dhcp-match=set:efi64,option:client-arch,9 \
  --dhcp-boot=tag:efi64,ipxe.efi \
  --dhcp-userclass=set:ipxe,iPXE \
  --dhcp-boot=tag:ipxe,http://172.16.10.1:8080/boot.ipxe
