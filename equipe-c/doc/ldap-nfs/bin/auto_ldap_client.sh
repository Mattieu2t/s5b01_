#!/bin/bash

#!/bin/bash

LDAP_IP="192.168.21.253"
DN="dc=capsule,dc=iut"

apt install -y debconf-utils

echo "nslcd	nslcd/ldap-auth-type	select	none" | debconf-set-selections
echo "nslcd	nslcd/ldap-base	string	${DN}" | debconf-set-selections
echo "nslcd	nslcd/ldap-binddn	string" | debconf-set-selections
echo "nslcd	nslcd/ldap-bindpw	password" | debconf-set-selections
echo "nslcd	nslcd/ldap-cacertfile	string	/etc/ssl/certs/ca-certificates.crt" | debconf-set-selections
echo "nslcd	nslcd/ldap-reqcert	select" | debconf-set-selections
echo "nslcd	nslcd/ldap-sasl-authcid	string" | debconf-set-selections
echo "nslcd	nslcd/ldap-sasl-authzid	string" | debconf-set-selections
echo "nslcd	nslcd/ldap-sasl-krb5-ccname	string	/run/nslcd/nslcd.tkt" | debconf-set-selections
echo "nslcd	nslcd/ldap-sasl-mech	select" | debconf-set-selections
echo "nslcd	nslcd/ldap-sasl-realm	string" | debconf-set-selections
echo "nslcd	nslcd/ldap-sasl-secprops	string" | debconf-set-selections
echo "nslcd	nslcd/ldap-starttls	boolean	false" | debconf-set-selections
echo "nslcd	nslcd/ldap-uris	string	ldap://${LDAP_IP}" | debconf-set-selections
echo "libnss-ldapd      libnss-ldapd/clean_nsswitch     boolean false" | debconf-set-selections
echo "libnss-ldapd:amd64        libnss-ldapd/clean_nsswitch     boolean false" | debconf-set-selections
echo "libnss-ldapd      libnss-ldapd/nsswitch   multiselect     passwd, group, shadow" | debconf-set-selections
echo "libnss-ldapd:amd64        libnss-ldapd/nsswitch   multiselect     passwd, group, shadow" | debconf-set-selections

apt install -y libpam-ldapd
dpkg-reconfigure -f noninteractive nslcd
#dpkg-reconfigure -f non interactive libnss-ldapd
