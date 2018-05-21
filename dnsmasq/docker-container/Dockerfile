FROM alpine:3.7
MAINTAINER Rune Rønneseth (rune.ronneseth@kred.no)

# https://pkgs.alpinelinux.org/packages
RUN apk --no-cache add curl dnsmasq

#COPY tftpboot /var/lib/tftpboot

# Port Info:
# - DNS: 53/TCP
# - DHCP Server: DHCP Client broadcasts DHCPDISCOVER to port 67 (UDP)
# - DHCP Client: DHCP Server sends DHCPOFFER to client on port 68 (UDP)
# - TFTP Server: tFTP transfer is offered on port 69 (UDP)
#
EXPOSE 53 67 69

ENTRYPOINT ["/usr/sbin/dnsmasq"]
