#!/bin/bash

apt-get install ipset
ips=$(which ipset)
ipt=$(which iptables)
$ips create tor iphash
$ipt -A INPUT -m set --match-set tor src -j DROP

