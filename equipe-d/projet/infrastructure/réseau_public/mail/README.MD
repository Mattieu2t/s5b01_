# Configuration serveur mail.

Détails sur la configuration Mail.

pour les utilisateurs finaux: mail.techtonic.iut/rainloop

pour les administrateurs: mail.techtonic.iut/postfixadmin/ (creation de boites mails ici)

pour configurer postfixadmin: mail.techtonic.iut/postfixadmin/?admin

## Mise en place du protocole SMTP avec Postfix.

SMTP sert a echanger des messages entre serveur de messagerie.

J’ai choisi d’utiliser le logiciel Postfix, qui va nous permettre de faire du SMTP, couplé à une interface web Postfixadmin pour aider à la gestion des comptes de messagerie sur le domaine.


## Mise en place du protocole IMAP avec Dovecot.

IMAP sert a stocker les messages.

Pour la partie récupération et classement des mails (IMAP), nous allons utiliser le logiciel Dovecot.

## Mise en place de l'interface Web pour l'utilisateur final avec Rainloop.

Pour que les utilisateurs puissent accéder à leur messagerie, nous utiliserons un webmail simple: Rainloop. Un webmail est un serveur web qui permet de lire et envoyer des messages directement via un navigateur plutôt qu’en utilisant une application comme Thunderbird par exemple.

