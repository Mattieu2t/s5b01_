# Compte rendu Hebdomadaire semaine 48

## 1 - les tâches effectuées et leur responsable

#### Mohamed Ghazi et Saad Cheikhaoui

- Configuration des switchs et routeurs: Ils ont configurés les vlans et les routes pour que les différents puissent se ping entre eux et l'extérieur.
- Configuration du DHCP: Ils ont configurés le DHCP afin qu'il puisse affecté les ip en fonction du réseau de la machine.
- Configuration du DNS:
- Lecture de la documentation pour l'installation d'un serveur de mail

#### Augustin Beeuwsaert

- Configuration d'un serveur LDAP en local sur des vm.

#### Martin Rigaux

- Configuration d'un serveur NFS en local sur des vm.

## 2 - les points bloquants

#### Mohamed Ghazi et Saad Cheikhaoui

- Ils ont du mal pour le DHCP car la configuration ne fonctionnait pas comme il le souhaitait. En effet, le dhcp attribuait ip que d'un réseau à toutes les machines qui faisait un DHCP request. Le problème qu'ils ont trouvé venait du router car la même configuration sur le R1 fonctionnait parfaitement.
- Ils ont eu aussi des soucis sur le DNS car le DNS du FAI ne transitait pas nos requêtes dns. Ils ont juste remonté le problème au FAI qui a résolu le problème

#### Augustin Beeuwsaert

- LDAP était quelque chose nouveau qu'il n'avait pas encore vu en cours donc il y a eu une longue phase du protocole.

## 3 - les tâches planifiées

On a décidé de faire les tâches dans un certains ordre pour afin de ne pas devoir revenir en arrière pour adapté les configurations.

- Modification du DHCP pour intégré le DNS
- Configuration du serveur de mail
- Configuration du Proxy
- Configuration du NFS et du LDAP
- Configuration du serveur Web
- Installation des postes de travail
- Installation du Pare-feu
