@augustin Beeuwsaert -> only me men 


tapez les commandes suivantes :



sudo apt update
sudo apt install slapd ldap-utils

- entrez le mdp root 

sudo hostnamectl set-hostname ldap.techtonic.iut
192.168.60.80 ldap.techtonic.iut ldap

sudo dpkg-reconfigure slapd




sudo systemctl restart slapd
sudo apt install ufw

sudo ufw allow LDAP
sudo ufw allow LDAPS


sudo nano /etc/ldap/users.ldif

dn: ou=People,dc=techtonic,dc=iut
objectClass: organizationalUnit
ou: People


sudo ldapadd -D "cn=admin,dc=techtonic,dc=iut" -W -H ldap://127.0.0.1 -f /etc/ldap/users.ldif

                                                                                                                                 
# Add user alice to LDAP Server
dn: cn=alice,ou=People,dc=techtonic,dc=iut
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: alice
uid: alice
uidNumber: 10001
gidNumber: 10001
homeDirectory: /home/alice
userPassword: root
loginShell: /bin/bash



sudo apt install libnss-ldap



passwd:         compat systemd ldap
group:          compat systemd ldap
shadow:         compat ldap  
gshadow:        files  


sudo apt install libpam-ldap












