FROM alpine:3.7
MAINTAINER Rune Rønneseth <rune.ronneseth@aiqu.no>

RUN apk --no-cache add dnsmasq curl

RUN mkdir /var/lib/tftpboot && \
    curl -o /var/lib/tftpboot/undionly.kpxe http://boot.ipxe.org/undionly.kpxe && \
    curl -o /var/lib/tftpboot/ipxe.efi http://boot.ipxe.org/ipxe.efi

EXPOSE 53 67 69

ENTRYPOINT ["/usr/sbin/dnsmasq"]
