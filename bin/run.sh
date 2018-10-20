#!/bin/sh

set -e

[ -d /dev/net ] || mkdir -p /dev/net
[ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200
chmod a+w /dev/net/tun

iptables -t nat -A POSTROUTING -s 10.88.255.0/24 -o eth0 -j MASQUERADE

NAMELOG=`date +'%F-%I%M'`-openvpn.log
touch /var/log/openvpn/$NAMELOG

while true ; do openvpn --config /etc/openvpn/config/openvpn.conf ; done >> /var/log/openvpn/$NAMELOG &
tail -F /var/log/openvpn/$NAMELOG
