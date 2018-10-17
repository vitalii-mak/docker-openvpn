#!/bin/sh

set -e

[ -d /dev/net ] || mkdir -p /dev/net
[ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200
chmod a+w /dev/net/tun

# sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -s 192.168.255.0/24 -o eth0 -j MASQUERADE
# 172.18.0.2

touch tcp443.log udp1194.log
# while true ; do openvpn tcp443.conf ; done >> tcp443.log &
while true ; do openvpn --config /etc/openvpn/config/tcp443.conf ; done >> tcp443.log &
while true ; do openvpn --config /etc/openvpn/config/udp1194.conf ; done >> udp1194.log &
tail -F *.log