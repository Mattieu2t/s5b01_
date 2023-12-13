# Rapport journalier

## Semaine 41

### 27/11/23 :

1. Lecture du sujet
2. Organisation du travail et assignation des tâches
3. Pair Promaming avec Martin pour la configuration
4. Modification des réglages des routeurs et du switch
5. Test du dhcp sur un seul réseau qui fonctionne mais sur plusieurs non

### 28/11/23 :

1. J'ai essayé de résoudre les problèmes du DHCP en capturant les paquets et en les analysant, en modifiant les paramètres de routages.
2. En anlysant les paquets, j'ai remarqué que que le dhcp faisait des offres au machines des autres réseaux mais seulement dans son sous-réseaux donc il ne recevait jamais l'aquitement des machines sur les autres réseaux.

### 29/11/23 :

1. J'ai continué la résolution de problèmes du dhcp, j'ai modifié les ip en mettent des ip en classe C.
2. Dhcp fonctionnel

### 30/11/23 :

1. Connection de notre réseau au réseau du FAI
2. configuration du DNS et du NAT
3. Changement de notre infra. On passe de 2 routeurs à 1 routeurs.
4. Début de la configuration du DNS

### 01/12/23 :

1. Lecture de la documentation pour l'installation d'un serveur mail.
2. Début de l'installation du serveur web mais repoussé car trop complexe


### 11/12/23 :

1. Début du installation du pare-feu et configuration des routeurs
2. configuration du proxy.

### 12/12/23 :

1. Aide sur la configuration de LDAP
2. Réflection et test pour pouvoir mettre un firewall avec une seul interface réseau

### 13/12/23 :

1. J'ai réussi mettre en place un firewall via pfsense mais pas fini de configurer les rules
2. Test de différentes rules et configuration sur le firewall