# Compte rendu de la semaine du 13 au 17 novembre

## Avancement :
 - Discussion sur le fonctionnement des différents réseaux et répartition des tâches
 - Création des Vagrantfile pour le DHCP et DNS (Cyriac et Mattieu)
 - Création des Vagrantfile pour le Mail et le Firewall (Guerric et Mathilde)
 - Branchement du routeur 1 : (Ensemble)
   - Lan0 : FAI
   - Lan1 : Switch 1
   - Lan2 :
   - Lan3 : Switch 3
   - WLan4 : Commutateur Liaison (R0)

 - Branchement sur Switch 1 : (Ensemble)
   - Douglas09
   - Douglas10

 - Branchement sur Switch 3 : (Ensemble)
   - Douglas11
   - Douglas12

 - Tests de différents services comme le Mail, Firewall (Guerric et Mathilde)
 - Mise en place et quelques tests sur le DHCP et l'attribution d'IP (Cyriac et Mattieu)
 - Routage d'un switch avec mise en place d'un VLan (Mattieu et Cyriac)

## Points bloquants
 - Routage et mise en place des différents réseaux
 - Flou sur le fonctionnement de notre réseau
 - FAI non fait, impossible de tester ou de régler les soucis d'accès à internet

## Tâches à faire pour la semaine suivante
 - Vérifier le routage
 - Test réseau entre les différents services
 - Continuer la documentation et la mise en place des VM
 - Mettre à plat le fonctionnement de nos VM et leurs utilité