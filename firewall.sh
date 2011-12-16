#!/bin/sh

P1=$1
P2=$2
P3=$3
P4=$4
P5=$5
P6=$6
P7=$7
P8=$8
P9=$9
P10=$10

iptables -F
iptables -X

iptables -N k

iptables -A k -m recent --name p10 --remove -j ACCEPT
iptables -A k -p tcp --dport $P1 -m recent --name p1 --set -j DROP
iptables -A k -p tcp --dport $P2 -m recent --name p1 --remove -m recent --name p2 --set -j DROP
iptables -A k -p tcp --dport $P3 -m recent --name p2 --remove -m recent --name p3 --set -j DROP
iptables -A k -p tcp --dport $P4 -m recent --name p3 --remove -m recent --name p4 --set -j DROP
iptables -A k -p tcp --dport $P5 -m recent --name p4 --remove -m recent --name p5 --set -j DROP
iptables -A k -p tcp --dport $P6 -m recent --name p5 --remove -m recent --name p6 --set -j DROP
iptables -A k -p tcp --dport $P7 -m recent --name p6 --remove -m recent --name p7 --set -j DROP
iptables -A k -p tcp --dport $P8 -m recent --name p7 --remove -m recent --name p8 --set -j DROP
iptables -A k -p tcp --dport $P9 -m recent --name p8 --remove -m recent --name p9 --set -j DROP
iptables -A k -p tcp --dport $P10 -m recent --name p9 --remove -m recent --name p10 --set -j DROP
iptables -A k -m recent --name p9 --remove -m recent --name p8 --remove -m recent --name p7 --remove -m recent --name p6 --remove -m recent --name p5 --remove -m recent --name p4 --remove -m recent --name p3 --remove -m recent --name p2 --remove -m recent --name p1 --remove -j DROP

iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -m state --state NEW -j k
