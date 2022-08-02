#!/bin/bash

#change PATHS according to your setup

(
curl -o $HOME/torlist.txt https://raw.githubusercontent.com/merkleID/torlist/main/torlist.txt

/usr/sbin/ipset flush tor
/usr/sbin/iptables -D INPUT -m set --match-set tor src -j DROP
while read IP; do /usr/sbin/ipset -q -A tor $IP; done < $HOME/torlist.txt
/usr/sbin/iptables -A INPUT -m set --match-set tor src -j DROP
echo $(date)
) 2>&1 | tee -a $HOME/torlist-update.log
