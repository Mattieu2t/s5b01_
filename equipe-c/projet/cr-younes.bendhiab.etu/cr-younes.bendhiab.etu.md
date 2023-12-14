# <center> Rapport journalier </center>

## Semaine 48

## 27-11-2023

### LDAP

- Création d'un arbre LDAP:

![Schéma LDAP](ldap.svg)

- Commencé la création du fichier LDIF.

- Test du firewall avec ufw/iptables.

## 28-11-2023

- Presque fini la création du fichier LDIF (quelques doutes).
- Automatisation scripts d'installation du LDAP (vagrant...).
- Encore quelques modifications à faire avec le firewall (bloque tout lorsque la raspberry est connecté, ça marche à moitié on va dire).

## 29-11-2023

- Logiquement terminé la création du fichier utilisateurs.ldif et structure.ldif.
- À peu près terminé l'automatisation de l'installation d'un serveur LDAP et surtout d'un client LDAP.

## 30-11-2023

- Commencé à regarder pour installer le serveur mail.
- Réussi à se connecter avec un autre utilisateur sur le serveur LDAP, mais pas sur une machine cliente (bien que je puisse voire les informations contenus sur le serveur LDAP depuis la machine cliente).

## 01-12-2023

- Commencé à documenter et à installer le cache-proxy "Squid"
- Encore essayé de faire fonctionner un client LDAP (ne marche toujours pas, je verrais la semaine prochaine avec le cours de monsieur Hauspie).

## Semaine 50

## 11-12-2023

- Refonte de l'arbre LDAP + documentation. N'a pas réussi à faire fonctionner PAM (cours arrive la semaine prochaine).

![Schéma LDAP New](ldap2.drawio.svg)

## 12-12-2023

- Réussi à faire fonctionner une connexion contre le serveur LDAP. LDAP logiquement terminé.
- Finition de la documentation pour le proxy.

## 13-12-2023

- Test de l'automatisation de l'installation d'un serveur ldap et d'un client (ne marche pas pour l'instant, n'arrive pas à changer le mot de passe).
- Mise en place NFS, problème de montage sur le home directory. On montera donc le /home dans un autre répértoire (du type "nfs_home").

## 14-12-2023

- LDAP/NFS mis en place, un seul problème, les utilisateurs ne peuvent pas s'authntifier, le serveur NFS ne laisse pas les utilisateurs distant à créer leur home directory

## 15-12-2023
