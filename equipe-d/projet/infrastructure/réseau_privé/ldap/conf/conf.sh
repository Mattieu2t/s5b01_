#!/bin/bash 
apt-get update
apt-get upgrade -y
apt install slapd ldap-utils -y
hostnamectl set-hostname techtonic.iut

echo "192.168.12.252   techtonic.iut ldap" >> /etc/hosts

dpkg-reconfigure slapd


echo "dn: ou=People,dc=techtonic,dc=iut
objectClass: organizationalUnit
objectClass: top
ou: People

dn: ou=Groups,dc=techtonic,dc=iut
objectClass: organizationalunit
objectClass: top
ou: Groups

dn: ou=admin,ou=People,dc=techtonic,dc=iut
objectClass: organizationalunit
objectClass: top
ou: admin
description: Utilisateurs Admin

dn: ou=info,ou=People,dc=techtonic,dc=iut
objectClass: organizationalunit
objectClass: top
ou: info
description: Utilisateurs Info

dn: ou=prod,ou=People,dc=techtonic,dc=iut
objectClass: organizationalunit
objectClass: top
ou: prod
description: Utilisateurs Prod" >> /etc/ldap/base.ldif

ldapadd -D "cn=admin,dc=techtonic,dc=iut" -W -H ldapi:/// -f /etc/ldap/base.ldif

echo "dn: uid=augustin.beeuwsaert,ou=admin,ou=People,dc=techtonic,dc=iut
objectClass: top
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: posixAccount
objectClass: shadowAccount
givenName: Augustin
sn: Beeuwsaert
cn: Augustin Beeuwsaert
uid: augustin.beeuwsaert
mail: augustin.beeuwsaert@techtonic.iut
uidNumber: 10000
gidNumber: 10000
userPassword: abeeuwsaert
homeDirectory: /home/augustin.beeuwsaert
loginShell: /bin/bash

dn: uid=mohamed.gazih,ou=admin,ou=People,dc=techtonic,dc=iut
objectClass: top
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: posixAccount
objectClass: shadowAccount
givenName: Mohamed
sn: Gazih
cn: Mohamed Gazih
uid: mohamed.gazih
mail: mohamed.gazih@techtonic.iut
uidNumber: 10001
gidNumber: 10000
userPassword: mgazih
homeDirectory: /home/mohamed.gazih
loginShell: /bin/bash

dn: uid=martin.rigaux,ou=info,ou=People,dc=techtonic,dc=iut
objectClass: top
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: posixAccount
objectClass: shadowAccount
givenName: Martin
sn: Rigaux
cn: Martin Rigaux
uid: martin.rigaux
mail: martin.rigaux@techtonic.iut
uidNumber: 10002
gidNumber: 10001
userPassword: mrigaux
homeDirectory: /home/martin.rigaux
loginShell: /bin/bash

dn: uid=saad.cheikhaoui,ou=info,ou=People,dc=techtonic,dc=iut
objectClass: top
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: posixAccount
objectClass: shadowAccount
givenName: Cheikhaoui
sn: Saad
cn:  Cheikhaoui Sada
uid: saad.cheikhaoui
mail: saad.cheikhaoui@techtonic.iut
uidNumber: 10003
gidNumber: 10002
userPassword: scheikhaoui
homeDirectory: /home/saad.cheikhaoui
loginShell: /bin/bash" >>  /etc/ldap/users.ldif 


ldapadd -D "cn=admin,dc=techtonic,dc=iut" -W -H ldapi:/// -f  /etc/ldap/users.ldif

