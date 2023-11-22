# SAÉ 5B.01 - Évolution d'une infrastructure

## Sujet

L’objet de la SAÉ (Situation d'Apprentissage et d'Évaluation) 5B.01
est de permettre de mettre en œuvre la plupart des compétences
acquises lors des quatre premiers semestres de BUT sur une mise en
application proche d’un cas réel.

L’objectif du projet est de mettre en place une infrastructure
d’entreprise pour 4 organisations différentes dont une aura le rôle de
Fournisseur d'Accès à l'Internet (FAI) pour les 3 autres. Chaque
organisation sera gérée par un groupe d'étudiants.

## Logistique

### Séances

Les séances ont lieu lors des semaines où les étudiants alternants
sont en entreprise.

Pour l'année 2023-2024 cela correspond à 

- semaine 39 du 25/09 au 29/09
- semaine 41 du 09/10 au 13/10
- semaine 46 du 13/11 au 17/11
- semaine 48 du 27/11 au 01/12
- semaine 50 du 11/12 au 15/12

Pendant vos séances de TP, une salle de TP classique ainsi que la
salle de TP réseau sont à votre disposition.

### Salle de TP réseau

Chaque groupe a la responsabilité d'un poste de travail.

Sur chaque poste de travail il y 4 machines nommées `douglasNN` avec
`NN` 4 valeurs entières ansi qu'une baie réseau.

Chaque machine a 2 cartes réseaux physiques :

- une carte réseau connectée sur le réseau privé des salles de TP :
  `172.18.48.0/22`. Cette carte est configurée au démarrage de la
  machine par le DHCP du département est sa configuration **ne doit pas
  être modifiée**.
- une carte supplémentaire connectée directement à la baie réseeau
  (soit via le patch du bas de la baie soit via des cables posés à
  côté de la baie).
  
Au moins une des machines du poste est équipée d'un cable
série-ethernet (cable plat bleu) permettant de se connecter
directement au port de contrôle des équipements réseaux de la baie via
l'outil `minicom` installée en standard sur les machines du poste de
travail.

Chaque baie réseau est équipée du haut vers le bas par :

- un commutateur (`R0`)
- deux routeurs (`R1` et `R2`)
- un patch de brassage vers les éléments actifs
- 4 commutateurs (`S1`, `S2`, `S3`, `S4`)
- un patch de brassage vers les machines de travail

### Gestion du projet

Le projet est géré en respectant quelques
[règles](projet-regles.md) et des
[conventions](projet-conventions.md).

Le respect de celles-ci est **obligatoire** et sera pris en compte
pour l'évaluation finale.

## Contraintes communes

Pour chaque organisation l'infrastructure doit correspondre aux
contraintes spécifiées ici.

### Réseau

- avoir un réseau comportant 4 parties distinctes :
    - une partie *publique*, i.e. avec des adresses IP accessibles par
      toutes les autres organisations
    - une partie *privée*, i.e. avec des adresses IP privées
      accessibles **uniquement** par les ordinateurs de l'organisation
      (donc par exemple pas par les ordinateurs des autres
      organisations). 
      
      3 réseaux privés doivent être disponibles :

      - un réseau réservé aux machines du service informatique
      - un réseau réservé aux machines du service administratif
      - un réseau réservé aux machines du service de production
      
      Les flux de ces différents réseaux doivent être séparés pour
      assurer la qualité de service du réseau. Toutefois, une
      communication entre les machines des services doit être
      possible.

- le réseau *public* devra offrir les services suivants :
    - un serveur DNS **autorité** sur le nom attribué à l'organisation
    - un serveur email
    - un serveur web

- les réseaux privés informatique et administratif doivent pouvoir
  accéder complètement à l'Internet (i.e. aux réseaux publics des
  autres organisations et des machines qui y sont connectées)

- le réseau privé de production ne doit pouvoir se connecter à
  l'Internet (i.e. aux réseaux publics des autres organisations)
  uniquement via le web et à travers le proxy web de l'organisation.

- les réseaux privés sont *sécurisés* par un serveur jouant le rôle de
  pare-feu

### Services

- le réseau privé du service informatique doit héberger a minima
    - un service DHCP pour toutes les machines privées de l'organisation
    - un service proxy web
    - un service LDAP définissant les utilisateurs et groupes des
      différentes machines de l'organisation
    - un service NFS stockant les données des différentes utilisateurs
      des machines de l'organisation
    - une station de travail

- le réseau privé des services administratif et de production doivent
  héberger a minima
    - deux stations de travail avec au minium les outils suivants
      installés de manière cohérente :
        - navigateur web
        - outil de gestion des emails

Chaque organisation doit gérer a minima autant d'utilisateurs que
d'étudiants dans le groupe.

Tous les utilisateurs doivent être capable de s'échanger des emails, y
compris d'une organisation à une autre.

Toutes les ordinateurs et services de l'organisation doivent être
désignés par un nom.

### Extensions

Si l’ensemble de ces éléments a pu être mis en œuvre avant la fin du
projet, on pourra mettre en place les éléments suivants :

- Fournir l’ensemble des services en IPv4 **et** en IPv6

- offrir un accès sécurisé depuis un réseau extérieur (VPN)

- offrir aux utilisateurs un accès Wifi.

  Le flux correspondant sera séparé des autres flux et permettra
  uniquement le flux HTTP.

## Organisation du travail

Dans la mesure où certaines des compétences nécessaires seront
acquises durant le semestre, il faudra adopter une démarche
progressive permettant d’intégrer au fur et à mesure les différents
éléments. Pour cela une discussion avec les enseignants concernés du
planning possible.

Cependant certains services ou technologies ne seront pas forcément
abordés en cours. Il faudra alors les étudier et déterminer comment
les mettre en place.

En interne les étudiants organisent comme ils l'entendent. Cette
organisation doit être **décrite et documentée**.

Chaque semaine, chaque organisation désigne un membre chargé de la
mise en œuvre de l’infrastructure commune permettant de relier les
différentes organisations et est l'interlocuteur unique de
l'organisation FAI.

## Évaluation

Vous devrez produire un document de synthèse et faire une
démonstration des maquettes. Cette évaluation sera faite lors d'une
séance début janvier dont la date sera fixée tardivement dans le
semestre.


## Équipes

### Équipe A : FAI

### Équipe B : 

### Équipe C :

### Équipe D :



