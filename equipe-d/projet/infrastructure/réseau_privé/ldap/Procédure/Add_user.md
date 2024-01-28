# Procédure d'Ajout d'un Utilisateur LDAP

## - [Ldap](../Procédure/) 
- [Instalation de LDAP ](../Procédure/Installation.md) 
- [Supprimer un utilisateur ](../Procédure/Del_user.md) 
- [Modifier un utilisateur  ](../Procédure/Modify_user.md)

## 1. Connexion au Serveur LDAP

Connectez-vous au serveur LDAP en utilisant la commande suivante :

```bash
vagrant ssh ldap
```

## 2. Utilisation de la Commande `ldapadd`

Utilisez la commande `ldapadd` pour ajouter un nouvel utilisateur. Créez un fichier LDIF (LDAP Data Interchange Format) contenant les informations de l'utilisateur. Par exemple, créez un fichier `nouvel_utilisateur.ldif` avec le contenu suivant :

```ldif
dn: uid=nouvel_utilisateur,ou=people,dc=techtonic,dc=iut
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: Nouvel Utilisateur
uid: nouvel_utilisateur
uidNumber: 10001
gidNumber: 10001
homeDirectory: /home/nouvel_utilisateur
loginShell: /bin/bash
gecos: Nouvel Utilisateur
userPassword: {SSHA}MotDePasseChiffre
```

- `dn`: Distinguished Name, spécifie le chemin de l'entrée dans l'arborescence LDAP.
- `objectClass`: Définit les classes d'objet auxquelles l'entrée appartient.
- `cn`: Common Name, le nom commun de l'utilisateur.
- `uid`: Identifiant de l'utilisateur.
- `uidNumber`: Numéro d'identification de l'utilisateur.
- `gidNumber`: Numéro d'identification du groupe.
- `homeDirectory`: Répertoire personnel de l'utilisateur.
- `loginShell`: Shell de connexion de l'utilisateur.
- `gecos`: Informations complémentaires sur l'utilisateur.
- `userPassword`: Mot de passe chiffré.

## 3. Ajout de l'Utilisateur

Utilisez la commande suivante pour ajouter l'utilisateur en utilisant le fichier LDIF créé :

```bash
sudo ldapadd -x -D "cn=admin,dc=techtonic,dc=iut" -W -f nouvel_utilisateur.ldif
```

- `-x`: Utilise la méthode simple d'authentification.
- `-D`: Spécifie le DN de l'utilisateur avec des droits d'ajout (généralement l'administrateur).
- `-W`: Demande le mot de passe de l'utilisateur spécifié avec l'option `-D`.
- `-f`: Spécifie le fichier LDIF à utiliser.

Entrez le mot de passe de l'administrateur LDAP lorsque vous y êtes invité.

## 4. Vérification de l'Ajout

Vous pouvez vérifier que l'utilisateur a été ajouté en effectuant une recherche LDAP pour le DN spécifié :

```bash
ldapsearch -x -D "cn=admin,dc=techtonic,dc=iut" -W -b "dc=techtonic,dc=iut" "(uid=nouvel_utilisateur)"
```

Assurez-vous de remplacer `cn=admin,dc=techtonic,dc=iut` par le DN de l'administrateur LDAP et `uid=nouvel_utilisateur` par le filtre de recherche approprié.

La recherche devrait retourner les informations de l'utilisateur ajouté.

C'est tout ! Vous avez maintenant ajouté un nouvel utilisateur LDAP sur votre serveur.