ARG ALPINE_VERSION=3.7
ARG TFTP_ROOT="/var/lib/tftpboot"

FROM alpine:${ALPINE_VERSION}
MAINTAINER Rune Rønneseth (rune.ronneseth@kred.no)

# - DNS: 53/TCP
# - DHCP Server: DHCP Client broadcasts DHCPDISCOVER to port 67 (UDP)
# - DHCP Client: DHCP Server sends DHCPOFFER to client on port 68 (UDP)
# - TFTP Server: tFTP transfer is offered on port 69 (UDP)
EXPOSE 53 67/udp 69/udp

# https://pkgs.alpinelinux.org/packages
RUN ["apk --no-cache add","dnsmasq","syslinux"]
RUN ["mkdir","/var/lib/tftpboot"]
RUN ["ln -s","/usr/share/syslinux/*","/var/lib/tftpboot"]

#COPY ["./tftpboot","/var/lib/tftpboot"]

ENTRYPOINT ["/usr/sbin/dnsmasq"]
