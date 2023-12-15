



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

# younes.bendhiab.etu, users, info, univ-lille.fr
dn: uid=younes.chahid.etu,ou=users,ou=admin,dc=univ-lille,dc=fr
uid: younes.bendhiab.etu
cn: Ben Dhiab Younes
gecos: Younes Ben Dhiab
givenName: Younes
sn: BEN DHIAB
uidNumber: 10001
mail: younes.bendhiab.etu@univ-lille.fr
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
homeDirectory: /home/admin/younes.bendhiab.etu