#!/bin/bash

apt-get install ipset
ips=$(which ipset)
ipt=$(which iptables)
$ips create tor iphash
$ipt -A INPUT -m set --match-set tor src -j DROP

apt install netfilter-persistent ipset-persistent iptables-persistent
netfilter-persistent save
systemctl enable netfilter-persistent
systemctl start netfilter-persistent
systemctl status netfilter-persistent
