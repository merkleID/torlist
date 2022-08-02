#!/bin/bash

#change PATHS according to your setup

ips=$(which ipset)
ipt=$(which iptables)

(
curl -o $HOME/torlist.txt https://raw.githubusercontent.com/merkleID/torlist/main/torlist.txt

$ips flush tor
$ipt -D INPUT -m set --match-set tor src -j DROP
while read IP; do $ips -q -A tor $IP; done < $HOME/torlist.txt
$ipt -A INPUT -m set --match-set tor src -j DROP
echo $(date)
) 2>&1 | tee -a $HOME/torlist-update.log
