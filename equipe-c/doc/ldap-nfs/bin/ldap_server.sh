#!/bin/bash

#LDAP_ROOTPASS=root
#LDAP_DOMAIN=capsule.iut
#LDAP_ORGANIZATION="capsule.iut"

#apt install -y debconf-utils

apt install -y slapd
dpkg-reconfigure slapd

#slapd slapd/root_password password ${LDAP_ROOTPASS}
#slapd slapd/root_password_again password ${LDAP_ROOTPASS}
#echo "slapd shared/organization string ${LDAP_ORGANIZATION}" | debconf-set-selections
#echo "slapd slapd/domain string ${LDAP_DOMAIN}" | debconf-set-selections
#echo "slapd slapd/dump_database select when needed" | debconf-set-selections
#echo "slapd slapd/dump_database_destdir string /var/lib/ldap/backups/slapd-VERSION" | debconf-set-selections
#echo "slapd slapd/internal/adminpw password ${LDAP_ROOTPASS}" | debconf-set-selections
#echo "slapd slapd/internal/generated_adminpw password ${LDAP_ROOTPASS}" | debconf-set-selections
#echo "slapd slapd/invalid_config boolean true" | debconf-set-selections
#echo "slapd slapd/move_old_database boolean false" | debconf-set-selections
#echo "slapd slapd/no_configuration  boolean false" | debconf-set-selections
#echo "slapd slapd/password1 password ${LDAP_ROOTPASS}" | debconf-set-selections
#echo "slapd slapd/password2 password ${LDAP_ROOTPASS}" | debconf-set-selections
#echo "slapd slapd/password_mismatch note" | debconf-set-selections
#echo "slapd slapd/postinst_error note" | debconf-set-selections
#echo "slapd slapd/purge_database boolean false" | debconf-set-selections
#echo "slapd slapd/upgrade_slapcat_failure error" | debconf-set-selections

#apt install -y slapd
#dpkg-reconfigure -f noninteractive slapd

systemctl restart slapd

apt install -y ufw
ufw allow OpenSSH
echo "y" | ufw enable
ufw allow LDAP
ufw allow LDAPS
ufw allow "WWW Full"
ufw reload

ldapadd -x -D cn=admin,dc=capsule,dc=iut -H ldapi:/// -W -f structure.ldif

ldapadd -x -D cn=admin,dc=capsule,dc=iut -H ldapi:/// -W -f people.ldif

# echo "session     required      pam_mkhomedir.so skel=/etc/skel umask=0022" >> /etc/pam.d/common-session
