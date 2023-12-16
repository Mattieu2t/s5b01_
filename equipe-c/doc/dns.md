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

public.capsule.iut
info.capsule.iut
admin.capsule.iut
prod.capsule.iut

Ces sous domaines nous permetterons, plus tard, de configurer le DNS dynamique.

## 4. Installation
Pour installer le paquet Bind la commande suivante suffit :

    root@dns:$~/ apt install bind9


# 5. Configuration 

Les fichiers de configuration de bind se situent ici : `/etc/bind/`  

Les deux principaux fichiers de configuration sont named.conf.local et named.conf.options

Le fichier `*/etc/bind/named.conf.local` permet de déclarer les zones de domaine que le serveur DNS gère.

Voici un exemple de déclaration de zone : 
```
zone "info.capsule.iut" IN {
        type master;
        file "/var/lib/bind/db.capsule";
};
```
Ici nous définissons une zone pour le sous domaine "info.capsule.iut" de type master.  
Le type master signifie que le serveur DNS est l'autorité principale pour cette zone.
L'option *file* permet quant à elle de définir l'emplacement du fichier de description de cette zone. 

Le fichier `*/etc/bind/named.conf.options` permet de définir les options du serveur DNS.

Beaucoup d'options existent pour ce fichier, ici nous allons utiliser les options *forwarders*, *allow-query* et *recursion*

L'option `recursion` permet d'activer ou de desactiver la récursion. Si cette option est activée notre serveur DNS effectuera des requêtes à d'autres serveurs DNS s'il n'a pas de réponse à donner au client. 

L'option `forwarders ` permet d'indiquer au serveur DNS quels serveurs doivent être contacté en cas de requête récursive.

L'option `allow-query` permet de limiter les machines pouvant effectuer des requêtes sur le serveur DNS à l'aide d'une IP, d'une adresse de sous-réseau ou d'un réseau.


# 6. DNS Dynamique

Le DNS dynamique permet à un serveur DHCP de mettre à jour dynamiquement les zones du serveur DNS. Pour cela il faut configurer le serveur DNS mais également le serveur DHCP. Vous pouvez retrouver ici la documentation pour le [DNS Dynamique pour le serveur DHCP](dhcp.md/#configuration-avec-un-dns-dynamique)





