#!/bin/bash

set -e

## this is a script to download adblocking list for bind 
#DN4C=
#IP4C=

cd /etc/bind/
wget -O adblock 'http://pgl.yoyo.org/adservers/serverlist.php?hostformat=bindconfig&showintro=0&startdate[day]=&startdate[month]=&startdate[year]=&mimetype=plaintext'
sed -i 's_" {_" IN {_' /etc/bind/adblock
sed -i 's_"null.zone.file"_"/etc/bind/null.zone.file"_' /etc/bind/adblock
mv adblock blacklist

sed -i "s/example.com/$DN4C/g" /etc/bind/null.zone.file
sed -i "s/172.17.42.1/$IP4C/g" /etc/bind/null.zone.file

chown -hR bind:bind /etc/bind/blacklist
  
