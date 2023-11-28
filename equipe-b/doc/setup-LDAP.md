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

