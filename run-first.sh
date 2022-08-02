#!/bin/bash

apt-get install ipset
/usr/sbin/ipset create tor iphash
/usr/sbin/iptables -A INPUT -m set --match-set tor src -j DROP

