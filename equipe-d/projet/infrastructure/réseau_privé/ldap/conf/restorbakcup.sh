#!/bin/bash 


sudo systemctl stop slapd
slapadd -c -b dc=techtonic,dc=iut -F /etc/ldap/slapd.d -l mon_backup.ldif
sudo tar -xvf conf_backup.tar /etc/ldap 
