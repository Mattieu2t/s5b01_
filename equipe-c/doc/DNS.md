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

    root@dns:~/$ apt install bind9


# 5. Configuration 

Les fichiers de configuration de bind se situent ici : `/etc/bind/`  

Les deux principaux fichiers de configuration sont named.conf.local et named.conf.options

Le fichier `/etc/bind/named.conf.local` permet de déclarer les zones de domaine que le serveur DNS gère.

Voici un exemple de déclaration de zone : 
```
zone "info.capsule.iut" IN {
        type master;
        file "/var/lib/bind/db.info";
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


# 6. Création des zones

Un fichier de zone DNS est un fichier texte qui contient des informations de configuration spécifiques à une zone DNS particulière. Il répertorie les enregistrements associés à un domaine spécifique, tels que les enregistrements A (adresse IP) ou encore les enregistrements MX (mail exchange). Ces fichiers de zone sont utilisés par les serveurs DNS pour traduire les noms de domaine en adresses IP perlettant la résolution des requêtes DNS.

Pour permettre une bonne configuration du DNS Dynamique plus tard, nous allons mettre les fichiers de zone dans le dossier `/var/lib/bind/`.

voici un exemple de [zone dns](dns/zones/db.info)


# 7. DNS Dynamique

Le DNS dynamique permet à un serveur DHCP de mettre à jour dynamiquement les zones du serveur DNS. Pour cela il faut configurer le serveur DNS mais également le serveur DHCP. Vous pouvez retrouver ici la documentation pour le [DNS Dynamique pour le serveur DHCP](dhcp.md/#configuration-avec-un-dns-dynamique)

Concernant la configuration du DNS dynamique sur le serveur Bind9 il est nécessaire d'avoir la même clé d'authentification que le serveur DHCP afin d'assurer une mise à jour de zones sécurisée.

Il faut donc penser à inclure cette clé dans le fichier named.conf.local à l'aide de la ligne `include "/etc/bind/cle";` au début du fichier.

Ensuite il est nécessaire de modifier la déclaration des zones. Dans chacune des déclarations il faut ajouter la ligne `allow-update : { key "nom_de_votre_cle";};` voci un exemple : 

``` 
zone "info.capsule.iut" IN {
        type master;
        file "/var/lib/bind/db.info";
        allow-update { key "cle";  };
};
```
Les fichiers de zones sont déjà rangés au bon endroit il suffit maintenant de donner le droit à l'utilisateur Bind d'écrire dedans. Nous allons donc modifier le propriétaire des fichiers de zone. Ceci peut être réalisé à l'aide de la ligne suivante : 

    root@dns:~/$ chown bind:bind /var/lib/bind/db.*


Une fois toutes ces modifications effectuées vous pouvez redémarrer le serveur :

    root@dns:~/$ systemctl restart named
