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

