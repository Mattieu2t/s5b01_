### Procédure de Suppression d'un Utilisateur LDAP


## - [Ldap](../Procédure/) 
- [Instalation de LDAP ](../Procédure/Installation.md) 
- [Ajouter un utilisateur ](../Procédure/Add_user.md) 
- [Modifier un utilisateur  ](../Procédure/Modify_user.md)

# 1. Connexion au Serveur LDAP
Connectez-vous au serveur LDAP en utilisant la commande suivante :
```
vagrant ssh ldap
```

# 2. Utilisation de la Commande ldapdelete
Utilisez la commande ldapdelete pour supprimer l'entrée de l'utilisateur que vous souhaitez supprimer. Remplacez <dn> par le DN de l'utilisateur que vous souhaitez supprimer. Par exemple :

```
sudo ldapdelete -x -D "cn=admin,dc=techtonic,dc=iut" -W -r "uid=nom_utilisateur,ou=people,dc=techtonic,dc=iut"
```
Assurez-vous de remplacer cn=admin,dc=techtonic,dc=iut par le DN de l'administrateur LDAP et uid=nom_utilisateur,ou=people,dc=techtonic,dc=iut par le DN de l'utilisateur que vous souhaitez supprimer.

# 3. Confirmation de la Suppression
La commande demandera le mot de passe de l'administrateur LDAP. Entrez-le et confirmez la suppression.

# 4. Vérification de la Suppression
Vous pouvez vérifier que l'utilisateur a été supprimé en effectuant une recherche LDAP pour le DN spécifié :

```
ldapsearch -x -D "cn=admin,dc=techtonic,dc=iut" -W -b "dc=techtonic,dc=iut" "(uid=nom_utilisateur)"
```
Assurez-vous de remplacer cn=admin,dc=techtonic,dc=iut par le DN de l'administrateur LDAP et uid=nom_utilisateur par le filtre de recherche approprié.

La recherche ne devrait pas retourner de résultats si l'utilisateur a été supprimé avec succès.