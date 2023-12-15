#!/bin/bash 

sudo slapcat -b dc=techtonic,dc=iut -l mon_backup.ldif
sudo tar -cvf conf_backup.tar /etc/ldap restorbakcup.sh

# faut ajouter la cle public sur le serveur de backup 
scp -r /vagrant/conf/  vagrant@192.168.60.84:~





