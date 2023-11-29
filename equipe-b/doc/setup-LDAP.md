## Procédure pour setup le service LDAP : 

# Installation et configuration : 

 ## Pour installer et configurer LDAP : 

-  `sudo apt-get install slapd ldap-utils `. L'annuaire sera installé.
- `sudo dpkg-reconfigure slapd`. L'outil de configuration *debconf* de Debian sera installé afin de configurer la base de l'annuaire.

Lors de l'installationde *debconf*, il faut indiquer : 
- No pour la première question pour pouvoir utiliser l'outil de configuration
- pour nom DNS : *syssko.iut*
- pour nom organisation : *syssko*
- le mot de passe administrateur
- No pour ne pas supprimer la base quand slapd est purgé
- Yes pour déplacer l'ancienne base de données

Vérifier à l'aide cette commande que la visualisation du DIT est possible : `sudo ldapsearch -Q -L -Y EXTERNAL -H ldapi:/// -b dc=syssko,dc=com`

- Ajouter des logs (par défaut aucune logs ne sont sauvegardées) : créer un fichier *logLevel.ldif* contenant : 
`dn: cn=config
changeType: modify
replace: olcLogLevel
olcLogLevel: stats`

Appliquer le changement avec la commande : `sudo ldapmodify -Q -Y EXTERNAL -H ldapi:/// -f logLevel.ldif`

## Sauvegarder l'annuaire sous forme de fichier LDIF :

En cas de perte de données, il est important de sauvegarder l'annuaire afin de pouvoir facilement le restaurer.

- `sudo slapcat -b dc=syssko,dc=com -l syssko_backup.ldif` afin de sauvegarder l'arbre *(copier le fichier sur un autre support pour éviter de le perdre en même temps que la configuration)*

- `sudo tar -cvf syssko_ldap.tar /etc/ldap` afin de sauvegarder la configuration de l'annuaire dans un fichier compressé

Pour restaurer les données : 

- `sudo systemctl stop slapd` afin d'éteindre slapd

- `sudo slapadd -c -b dc=syssko,dc=com -F /etc/ldap/slapd.d -l syssko.ldif` afin de restaurer la base avec la sauvegarde

- `sudo tar -xvf syssko_ldap.tar /etc/ldap ` afin de restaurer la configuration