## Semaine 1 :

- Compréhension du sujet
- Mise en commun avec les autres groupes afin de se mettre d'accord sur les plages IP
- Premiers tests réseau (routage, Vlan)
- Beaucoup de réflexions autour du réseau (comment faire, où mettre les différents éléments)

## Semaine 2 :

- Travail plus orienté sur la partie infra
- Création du Vagrantfile pour le DHCP
- Tentative infructueuse de mettre en place le serveur mail
- Aide des autres membres du groupe sur leurs sujets

## Lundi 27 Novembre 2023 :

- Lecture et compréhension du sujet
- Travail sur le DNS (création des zones, configuration, tests)
- Trvail sur le DHCP afin qu'il mette à jour le DNS lorsqu'une nouvelle machine est ajoutée.
- Automatisation de la création de la machine DNS avec Vagrant
- Lecture de documentation en vue de la configuration du serveur mail


## Mardi 28 Novembre 2023 : 

- Debug DHCP pour qu'il attribue la bonne IP en fonction du sous-réseau sur lequel la machine est branchée

- Mise en place du DNS Dynamique pour mettre à jour automatiquement le DNS via le DHCP (sur des machines de test)
- Debug du DDNS
- Début du serveur NFS
- Création des Vagrantfile pour les postes utilisateurs 

## Mercredi 29 Novembre 2023
- Mise en place du DNS dynamique sur l'infrastructure
- Debug du DNS dynamique car il attribuait un DNS aux machines Douglas. Il a donc été nécessaire de faire une exception pour ces machines afin de leur laisser le DNS de l'Université 
- Finalisation du DHCP, tests sur plusieurs Vagrantfile se trouvant sur des sous-réseaux différents.

## Jeudi 30 Novembre 2023

- Journée sur le DNS, jusque la le DHCP donnait le DNS aux machines mais les machines n'étaient pas ajoputées au DNS. Problème de permission pour modifier le DNS

## Vandredi 1 Décembre 2023

- DNS enfin disponible
- Sécurisation du DNS dynamique à l'aide d'une clé
- Tests avec différentes machines sur les différents réseaux
- Création des machines utilisateurs avec Firefox et Thunderbird

## Lundi 11 Décembre 2023

- Automatisation du déploiement du DNS et du DHCP
- Réalisation de la documentation sur le DHCP et le DNS (et DNS dynamique)
- Mise en place du serveur NFS

## Mardi 12 Décembre

- Discussions autour de LDAP et NFS
- Aide FAI pour faire commiquer nos DNS (comprendre leur infrastructure, trouver les causes du problème)


## Mercredi 13 Décembre 

- Aide FAI pour faire commiquer nos DNS (résolution du problème + tests)
- Lecture d'une documentation sur la sécurisation du DNS avec BIND et mise en place de certains conseils.