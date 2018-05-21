#!/bin/bash
sudo docker run -d --rm --cap-add=NET_ADMIN --network="host"  quay.io/coreos/dnsmasq \
  --no-daemon \
  --log-dhcp \
  --log-queries
  --dhcp-range=172.16.10.100,172.16.10.200,10m \
  --dhcp-option=3,172.16.8.100 \
  --dhcp-option=42,129.240.2.6 \
  --no-resolv \
  --strict-order \
  --server=208.67.222.222 \
  --server=208.67.220.220 \
  --server=8.8.8.8 \
  --server=8.8.4.4
