# Procédure de Modification d'un Utilisateur LDAP

## - [Ldap](../equipe-d/projet/infrastructure/réseau_privé/ldap/Procédure/) 
- [Instalation de LDAP ](../equipe-d/projet/infrastructure/réseau_privé/ldap/Procédure/Installation.md) 
- [Ajouter un utilisateur ](../equipe-d/projet/infrastructure/réseau_privé/ldap/Procédure/Add_user.md) 
- [Supprimer un utilisateur ](../equipe-d/projet/infrastructure/réseau_privé/ldap/Procédure/Del_user.md) 
- [Modifier un utilisateur  ](../equipe-d/projet/infrastructure/réseau_privé/ldap/Procédure/Modify_user.md)

## 1. Connexion au Serveur LDAP

Connectez-vous au serveur LDAP en utilisant la commande suivante :

```bash
vagrant ssh ldap
```

## 2. Modification du Fichier LDIF

Modifiez le fichier LDIF de l'utilisateur que vous souhaitez mettre à jour. Par exemple, modifiez le fichier `utilisateur_modifie.ldif` avec les modifications nécessaires :

```ldif
dn: uid=utilisateur_modifie,ou=people,dc=techtonic,dc=iut
changetype: modify
replace: gecos
gecos: Nouvelles Informations Utilisateur
```

Dans cet exemple, la modification concerne le champ `gecos` de l'utilisateur `utilisateur_modifie`.

## 3. Application des Modifications

Utilisez la commande suivante pour appliquer les modifications à l'utilisateur en utilisant le fichier LDIF modifié :

```bash
sudo ldapmodify -x -D "cn=admin,dc=techtonic,dc=iut" -W -f utilisateur_modifie.ldif
```

- `-x`: Utilise la méthode simple d'authentification.
- `-D`: Spécifie le DN de l'utilisateur avec des droits de modification (généralement l'administrateur).
- `-W`: Demande le mot de passe de l'utilisateur spécifié avec l'option `-D`.
- `-f`: Spécifie le fichier LDIF à utiliser.

Entrez le mot de passe de l'administrateur LDAP lorsque vous y êtes invité.

## 4. Vérification de la Modification

Vous pouvez vérifier que les modifications ont été appliquées en effectuant une recherche LDAP pour le DN spécifié :

```bash
ldapsearch -x -D "cn=admin,dc=techtonic,dc=iut" -W -b "dc=techtonic,dc=iut" "(uid=utilisateur_modifie)"
```

Assurez-vous de remplacer `cn=admin,dc=techtonic,dc=iut` par le DN de l'administrateur LDAP et `uid=utilisateur_modifie` par le filtre de recherche approprié.

La recherche devrait retourner les informations mises à jour de l'utilisateur.

