#!/bin/bash 

sudo apt install slapd ldap-utils -y
sudo hostnamectl set-hostname techtonic.iut

sudo echo "192.168.60.80   techtonic.iut ldap" >> /etc/hosts

sudo dpkg-reconfigure slapd

sudo apt install ufw -y

echo "dn: ou=Personnes,dc=techtonic,dc=iut" >> /etc/ldap/users.ldif
echo "objectClass: organizationalUnit" >> /etc/ldap/users.ldif
echo "ou: Personnes" >> /etc/ldap/users.ldif

                                  ou: Personnes
                                                        
sudo ldapadd -D "cn=admin,dc=techtonic,dc=iut" -W -H ldapi:/// -f /etc/ldap/users.ldif


echo "dn: cn=alice,ou=Personnes,dc=techtonic,dc=iut" >> /etc/ldap/alice.ldif
echo "objectClass: top" >> /etc/ldap/alice.ldif
echo "objectClass: account" >> /etc/ldap/alice.ldif
echo "objectClass: posixAccount" >> /etc/ldap/alice.ldif
echo "objectClass: shadowAccount" >> /etc/ldap/alice.ldif
echo "cn: alice" >> /etc/ldap/alice.ldif
echo "uid: alice" >> /etc/ldap/alice.ldif
echo "uidNumber: 10001" >> /etc/ldap/alice.ldif
echo "gidNumber: 10001" >> /etc/ldap/alice.ldif
echo "homeDirectory: /home/alice" >> /etc/ldap/alice.ldif
echo "userPassword: test" >> /etc/ldap/alice.ldif
echo "loginShell: /bin/bash" >> /etc/ldap/alice.ldif


sudo ldapadd -D "cn=admin,dc=techtonic,dc=iut" -W -H ldapi:/// -f  /etc/ldap/alice.ldif


sudo echo "session     required      pam_mkhomedir.so skel=/etc/skel umask=0022" >> /etc/pam.d/common-session





