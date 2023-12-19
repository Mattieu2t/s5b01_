---
title: SAÉ 5B.01 - Martin Rigaux
subtitle: Equipe D - TechTonic
---

# Suivi du Projet

## Semaine 41 (09/10 au 13/10)

- Prise en compte du cahier des charges.
- Choix du nom de l'entreprise.
- Répartition des tâches.

## Semaine 46 (13/11 au 17/11)

- Choix de l'infrastructure.
- Définition de la plage d'adresses.
- Choix du matériel/VM.
- Sélection des logiciels.

## Semaine 48 (27/11 au 01/12)

### 27/11/23 :

1. Lecture du sujet
2. Organisation du travail et assignation des tâches
3. Lecture de la doc pour DHCP
4. Configuration de DHCP + corrections des erreurs systèmes
5. Test de demande DHCP + erreurs de routage


### 28/11/23 :

1. Connaissance des noms de domaines à utiliser pour DNS
2. Le DHCP ne fonctionne pas car erreurs de routage  
3. Mise en place d'un Vagrantfile avec les logiciels demandés pour les clients

### 29/11/23 :

1. Familiarisation avec NFS
2. Mise en commun avec Augustion sur les liens entre NFS et LDAP
3. Premiers tests NFS 

### 30/11/23 :

1. Finalisation du serveur NFS et de sa structure
2. Premiers tests de connexions entre NFS et LDAP via une machine cliente

## Semaine 50 (11/12 au 15/12)

### 11/12/23 :

1. Je continue de lier NFS et LDAP 
2. Configuration de la machine cliente (web,nfs,ldap)

### 12/12/23 :

1. La connexion entre LDAP et NFS est faites. Création automatique d'un répertoire si l'utilisateur est nouveau 
2. Classement des dossiers et récapitulatif de ce que nous avons fait et ce qu'il nous reste à faire


### 13/12/23

1. Configuration du client LDAP ainsi que son lien avec NFS. 

2. J'ai eu du mal à configurer le montage automatique de NFS au démarage via le fichier `fstab` pour des raisons liées au Vagrantfile cela me donnait une erreur lors de ma connection à la VM.
 
### 14/12/23

1. Installation des derniers logiciels demandé dans le sujet pour le client(`Chromium`,`Thunderbird`). 

2. Tests pour savoir si tous les services fonctionnaient bien correctement sur le réseau.

### 15/12/23

1. Aujourd'hui j'ai principalement écrit de la documentation des différents services que j'ai mis en places.

2. Nous avons fait un brainstorming afin de savoir ce qu'il nous restait à faire avant la fin du projet.

