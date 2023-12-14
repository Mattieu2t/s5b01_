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

### 14/12/23 :

Journée dédiée au firewall afin de pouvoir bloqué les réquètes Web du service production.
J'ai eu différents soucis:

- Quand les requêtes passait le R1, elle se faisait natés donc une fois arrivé au pare-feu, elle avait l'ip du routeur donc elle se faisait pas reject. J'ai passé la majorité de mon temps à trouver une solution, j'en ai essayé plusieurs et j'ai fini par en trouver une. La première qui ne fonctionne pas consisté à ne pas nattés les pacquets mais quand j'enlevais le nattage les paquets ne sortait plus du routeur. La deuxième solution que j'ai fais est que j'ai mis mon parefeu sur un port LAN de mon routeur et lui attribuer une ip privé et ça résolu le problème de nattage.

- J'avais des problèmes de routages et de nattages avec pfsense. J'ai analysé les paquets sur pfsense et j'ai remarqué que les paquets sortaient bien du parfeu, mais avec une ip privé donc les paquets n'était pas nattés ne revenait pas au parefeu. J'ai donc fini par installer IPFire pour résoudre le problème.

- J'ai appliqué une rules sur IPfire mais le paquet n'est pas reject j'ai essayé fait plusieurs tests, mais les paquets n'était pas reject. Mais grâce à un ip route et sur Ipfire, je vois bien que les paquets passent par le firewall. Si je n'arrive pas résoudre ce problème demain, j'utiliserais simplement un machine linux pour faire office de parefeu grâce à iptables.