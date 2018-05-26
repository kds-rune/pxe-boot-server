#!/bin/bash
docker run -d --rm --cap-add=NET_ADMIN --network="host" pxe:1 \
  --no-daemon \
  --log-dhcp \
  --log-queries \
  --enable-tftp \
  --tftp-root=/var/lib/tftpboot \
  --dhcp-range=192.168.10.0,proxy,255.255.255.0 \
  --dhcp-match=set:ipxe,175 \
  --pxe-service=tag:#ipxe,x86PC,"Chainload ipxe",undionly.kpxe \
  --pxe-service=tag:#ipxe,BC_EFI,"Chainload ipxe",ipxe.efi \
  --pxe-service=tag:ipxe,x86PC,"Loading ipxe-menu",http://boot.ipxe.org/demo/boot.php \
  --pxe-service=tag:ipxe,BC_EFI,"Loading ipxe-menu",http://boot.ipxe.org/demo/boot.php
  
