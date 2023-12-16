# <center> LDAP & NFS </center>
## Infrastructure
### Serveur LDAP

Un serveur LDAP (Lightweight Directory Access Protocol) est une application logicielle qui gère les informations d'un annuaire à l'aide d'une structure hiérarchique. Il stocke des données telles que les identités des utilisateurs, les appartenances à des groupes et les autorisations d'accès. 

Le serveur LDAP va permettre la gestion de tout les employés/utilisateurs d'une entreprise, d'une organisation, d'une université. Dans notre cas, cela permet de gérer les participants du groupe, Younes, Cedric, Benoît et Jugurtha.

### Serveur NFS

Le protocole NFS (Network File System) est un protocole de système de fichiers distribué qui permet à un client/utilisateur d'accéder à des répertoires sur un réseau comme si les fichiers se trouvaient sur la machine locale. Il permet le partage des fichiers et des ressources entre plusieurs ordinateurs sur un même réseau.

Dans notre cas, notre serveur NFS partage en commun le home directory de tout les utilisateurs. Les utilisateurs pourront donc utiliser n'importe quel ordinateurs, leur fichiers seront toujours présent.
Ce répertoire commun doit être monté sur toutes les machines utilisateurs, donc ici sur toutes les stations de travail.
Pour éviter d'avoir un problème avec l'utilisateur par défaut situé dans le répertoire /home/ (ici l'utilisateur vagrant), le montage ce fera dans le répertoire /home/nfs_home/.

## Arbre LDAP

Voici l'infrastructure LDAP mise en place:

![Schéma LDAP](https://gitlab.univ-lille.fr/etu/2023-2024/s5b01/-/blob/master/equipe-c/projet/cr-younes.bendhiab.etu/ldap2.drawio.svg)

## Protocole de mise en place du serveur LDAP

Plusieurs fichiers sont utilisés lors l'installation du serveur LDAP:

- Le VagrantFile
  - Changement du hostname en "ldap"
  - Synchronisation du répertoire courant sur la VM cliente afin de copiers les fichiers:
  -  ldap_serveur.sh, structure.ldif, people.ldif dans /root/ et resolv.conf dans /etc/
  - Un bridge est effectué
  - Création d'une route vers le routeur
- bin/ldap_server.sh
  - Installation manuelle du serveur LDAP.
- ldap_tree/{structure.ldif,people.ldif}
  - structure.ldif: fichier de création de l'infrastructure LDAP.
  - people.ldif: création des utilisateurs LDAP.
- resolv.conf
  - Dit à la machine cliente quel DNS utiliser.

Pour commencer, il faut lancer les machines vagrant:

`vagrant up`

Il faut maintenant se rendre sur la VM en mode root, et exécuter le fichier **ldap_server.sh** afin d'effectuer l'installation manuelle du serveur:

`vagrant ssh ldap` <br>
`su -` <br>
`source ldap_server.sh`

Il faut répondre aux prompt qui s'affichent au fur et à mesure:

Administrator password: `<mot_de_passe>` <br>
Confirm password: `<mot_de_passe>`

> Note: Le mot de passe admin va être changé juste après.

Omit OpenLDAP server configuration: `No` <br>
DNS Domain name: `capsule.iut` <br>
Organization name: `capsule.iut` <br>
Administrator password: `<mot_de_passe>` <br>
Confirm password: `<mot_de_passe>` <br>
Do you want the databse to be removed when slapd is purged: `No` <br>
Move old database: `Yes`

Deux derniers prompts bash sont demandés, ils permettent la création de l'infrastructure LDAP, il faut juste remettre le mot de passe précédemment créé:

Enter LDAP Password: `<mot_de_passe>` <br>
Enter LDAP Password: `<mot_de_passe>`

L'installation du serveur LDAP est terminé.

> Note: Les fichiers utilisés devront être modifié selon l'infrastructure à mettre en place (ip différentes...). <br>
> 

## Protocole de mise en place du serveur NFS

Plusieurs fichiers sont utilisés lors de l'installation du serveur NFS:

- VagrantFile
  - Changement du hostname en "ldap"
  - Envoie du fichier bin/client.sh sur la VM dans le /tmp/
  - Un bridge est effectué
  - Création d'une route vers le routeur
  - Installation du service NFS
  - Modification du fichier /etc/export avec l'ajout d'un 'export' NFS pour le partage du répertoire /home/nfs_home
  - Copie du fichier resolv.conf dans le dossier /etc/
  - Execution du fichier /tmp/client.sh
  - Ajout d'une ligne dans le fichier /etc/pam.d/common-session afin de pouvoir créér le home directory d'un utilisateur dont les différents répértoires y menant
- bin/client.sh
  - Permet l'installation du client LDAP

La vm se créer et se configure automatiquement lors de sa création avec la commande:

`vagrant up`

L'installation du serveur NFS est terminé.

> Note: Les fichiers utilisés devront être modifié selon l'infrastructure à mettre en place (ip différentes...).

## Protocole de mise en place d'un client

Plusieurs fichiers sont utilisés lors de l'installation d'un client LDAP/NFS:

- bin/client.sh
  - Permet l'installation du client LDAP
- bin/client_nfs_mount.sh
  - Permet de monter le répértoire /home/nfs_home/ et d’accéder aux fichiers partagés par le serveur NFS.

Les deux fichiers n'ont qu'à être lancés en mode root sur une machine cliente.

La mise en place d'un client LDAP/NFS est terminé.

> Note: Les fichiers utilisés devront être modifié selon l'infrastructure à mettre en place (ip différentes...).

## Création d'un home directory utilisateur/client

Un utilisateur ne peut pas s'authentifier directement faute de droits (on a pas réussi à régler cela malheureusement).

Pour créer un utilisateur, l'administrateur doit se rendre sur la machine NFS et s'authentifier avec les différents comptes utilisateurs, par exemple manuellement ou grâce à la commande suivante en mode root:

```su - younes.bendhiab```

L'utilisateur "younes.bendhiab" peut maintenant se connecter sur une machine.

Une autre manière afin que cette création de home directory se fasse automatiquement, est l'utilisateur du fichier `bin/auto_su.sh` qui grâce à une liste d'utilisateurs, créés automatiquement tout les home directory de tout les utilisateurs. Ce fichier n'a qu'à être exécuté sur la machine NFS en mode root.

> Note: Il faudra modifier le fichier bin/auto_su.sh en ajoutant les utilisateurs dans la liste.