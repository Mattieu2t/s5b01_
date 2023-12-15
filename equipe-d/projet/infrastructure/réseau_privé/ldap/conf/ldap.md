



# univ-lille.fr
dn: dc=univ-lille,dc=fr
objectClass: top
objectClass: dcObject
objectClass: organization
o: univ-lille.fr
dc: univ-lille

# bio, univ-lille.fr
dn: ou=bio,dc=univ-lille,dc=fr
ou: bio
objectClass: organizationalUnit
objectClass: top

# groups, bio, univ-lille.fr
dn: ou=groups,ou=bio,dc=univ-lille,dc=fr
objectClass: organizationalUnit
objectClass: top
ou: groups

# users, bio, univ-lille.fr
dn: ou=users,ou=bio,dc=univ-lille,dc=fr
objectClass: organizationalUnit
objectClass: top
ou: users

# admin, univ-lille.fr
dn: cn=admin,dc=univ-lille,dc=fr
objectClass: simpleSecurityObject
objectClass: organizationalRole
cn: admin
description: LDAP administrator

# augustin.beeuwsaert.etu, users, info, univ-lille.fr
dn: uid=augustin.beeuwsaert.etu,ou=users,ou=admin,dc=univ-lille,dc=fr
uid: augustin.beeuwsaert.etu
cn: Beeuwsaert Augustin
gecos: Augustin Beeuwsaert
givenName: Augustin
sn: BEEUWSAERT
uidNumber: 10001
mail: augustin.beeuwsaert.etu@techtonic.iut
employeeNumber: 42133304
employeeType: 100915772
departmentNumber: {UAI:0597239Y}3BFQDV-123
objectClass: top
objectClass: person
objectClass: posixAccount
objectClass: shadowAccount
objectClass: organizationalPerson
objectClass: inetOrgPerson
gidNumber: 1005
homeDirectory: /home/admin/augustin.beeuwsaert.etu


dn: uid=mohamed.gazih.etu,ou=users,ou=admin,dc=univ-lille,dc=fr
uid: mohamed.gazih.etu
cn: Gazih Mohamed
gecos: Mohamed Gazih 
givenName: Mohamed
sn: GAZIH
uidNumber: 10001
mail: mohamed.gazhi.etu@techtonic.iut
employeeNumber: 42133304
employeeType: 100915772
departmentNumber: {UAI:0597239Y}3BFQDV-123
objectClass: top
objectClass: person
objectClass: posixAccount
objectClass: shadowAccount
objectClass: organizationalPerson
objectClass: inetOrgPerson
gidNumber: 1005
homeDirectory: /home/admin/mohamed.gazhi.etu


dn: uid=martin.rigeaux.etu,ou=users,ou=admin,dc=univ-lille,dc=fr
uid: martin.rigeaux.etu
cn: Rigeaux Martin
gecos: Martin Rigeaux 
givenName: Martin
sn: Rigeaux
uidNumber: 10001
mail: martin.rigeaux.etu@techtonic.iut
employeeNumber: 42133304
employeeType: 100915772
departmentNumber: {UAI:0597239Y}3BFQDV-123
objectClass: top
objectClass: person
objectClass: posixAccount
objectClass: shadowAccount
objectClass: organizationalPerson
objectClass: inetOrgPerson
gidNumber: 1005
homeDirectory: /home/admin/martin.rigeaux.etu


dn: uid=saad.cheikhaoui.etu,ou=users,ou=admin,dc=univ-lille,dc=fr
uid: saad.cheikhaoui.etu
cn: Cheikhaoui Saad
gecos: Martin Cheikhaoui 
givenName: Saad
sn: Cheikhaoui
uidNumber: 10001
mail: saad.cheikhaoui.etu@techtonic.iut
employeeNumber: 42133304
employeeType: 100915772
departmentNumber: {UAI:0597239Y}3BFQDV-123
objectClass: top
objectClass: person
objectClass: posixAccount
objectClass: shadowAccount
objectClass: organizationalPerson
objectClass: inetOrgPerson
gidNumber: 1005
homeDirectory: /home/admin/saad.cheikhaoui.etu