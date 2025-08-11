#!/bin/bash

ip route | awk '{print $1}' | sed 's/[^0-9./]//g' | sort -u > CIDR.txt
sudo nmap -sn -iL CIDR.txt -oG  grepable.txt
cat grepable.txt | grep -v "#" | cut -d : -f2 | sed 's/[^0-9.]//g' > hosts.txt
sudo nmap -sS -iL hosts.txt -oA results
