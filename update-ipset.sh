#!/bin/bash

curl -o $HOME/torlist.txt https://raw.githubusercontent.com/merkleID/torlist/main/torlist.txt

ipset flush tor
iptables -D INPUT -m set --match-set tor src -j DROP
while read IP; do ipset -q -A tor $IP; done < $HOME/torlist.txt
iptables -A INPUT -m set --match-set tor src -j DROP
