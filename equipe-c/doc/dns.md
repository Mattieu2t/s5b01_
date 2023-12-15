# Service DNS avec Bind9

## 1. Introduction 

Le DNS (Domain Name System) est un système qui traduit les noms de domaine, comme "example.com", en adresses IP pour localiser des ressources en ligne. Un nom de domaine est une adresse conviviale permettant aux utilisateurs d'identifier facilement des sites web, composée d'un nom et d'une extension (par exemple, "example.com").
Notre serveur DNS est un serveur autoritaire, il répond aux requêtes pour les enregistrements de zones dont il a la responsabilité. 
Notre TLD est *capsule.iut*
Nous allons ici mettre en place un serveur DNS à l'aide du service Bind9 disponible sous Debian.

## 2. Pré-requis

La machine est installée sur le réseau publique. Il faut donc s'assurer que ce réseau est bien configuré et qu'il peut être contacté par les réseaux privés. 

## 3. Explications

Pour rendre notre domaine le plus clair possible nous l'avons divisé en plusieurs sous domaines en fonction des sous-réseaux.  

Nous avons donc quatres sous domaines : 
- *public.capsule.iut*
- *info.capsule.iut*
- *admin.capsule.iut*
- *prod.capsule.iut*

Ces sous domaines nous permetterons, plus tard, de configurer le DNS dynamique.

## 4. Installation

Pour installer le paquet Bind la commande suivante suffit : 

    root@dns:$~/ apt install bind9

Les fichiers de configuration de bind se situent ici : */etc/bind/*