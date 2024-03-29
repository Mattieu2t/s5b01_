# Service DHCP avec vagrant et isc-dhcp-server

## 1. Introduction 

Mise en place d'un service DHCP à l'aide de vagrant et du paquet isc-dhcp-server.  
Le serveur DHCP donne des adresses IP aux machines sur le réseau en fonction du sous réseau sur lequel elles se situent.  
Grâce a vagrant, le serveur DHCP se créé rapidement avec sa configuration déjà implémentée.

## 2. Pré-requis  

- Avoir configuré les Router 1 et 2 de la baies ([routeur 1 et 2](router.md))
- Avoir configuré les Switch 1 à 4 de la baies ([Switch 1 à 4](switch.md))

## 3. Instalation

Connectez vous sur une machine `douglasXX`. (nom et mdp : `cisco` )  
Créez un dossier 'dhcp' dans le dossier courant, ce dossier va contenir tous les fichiers d'installation du serveur DHCP :  

    cisco@douglasXX:~$ mkdir dhcp

Maintenant créez un fichier `Vagrantfile` dans le dossier dhcp à l'aide de cette commande : 

    cisco@douglasXX:~/dhcp$ vagrant init

Le fichier Vagrantfile est le fichier le plus important, grace a lui nous allons créer une machine virtuelle dans laquelle nous allons ajouter toutes les configurations nécessaires à l'installation du serveur DHCP.

Voici la configuration du Vagrantfile pour créer le serveur DHCP :

```sh
config.vm.define "dhcp" do |dhcp|
      dhcp.vm.hostname = "dhcp"
      dhcp.vm.network "public_network",bridge: "enp1s2", ip:"192.168.21.250", netmask: "255.255.255.0"
      dhcp.vm.provision "file", source: "config/dhcp/dhcpd.conf",destination: "/tmp/"
      dhcp.vm.provision "file", source: "config/dhcp/isc-dhcp-server",destination: "/tmp/"      
      dhcp.vm.provision "shell", inline: <<-SHELL
        apt update -y
        apt install -y isc-dhcp-server
        cp -f /tmp/dhcpd.conf /etc/dhcp/
        cp -f /tmp/isc-dhcp-server /etc/default/
        systemctl restart isc-dhcp-server
        ip route del default via 10.0.2.2
        ip route add default via 192.168.21.1 dev eth1
      SHELL
    end
```

IP de la machine : 192.168.21.250/24  
Dans cette config vagrant nous retrouvons les fichiers `dhcpd.conf` et `isc-dhcp-server` que nous allons transférer dans le dossier `/tmp`, sur la machine DHCP.  
Ensuite nous allons lancer un SHELL afin de mettre à jour la machine, déplacer les fichiers de configuartion de DHCP et changer les routes par defaut. 

Pour avoir la configuration finale du Vagrantfile vous la retrouverez [ici](dhcp/Vagrantfile)

## Configuration 

Pour configurer le serveur DHCP les principaux fichiers à modifier sont _/etc/dhcp/dhcpd.conf_ et _/etc/default/isc-dhcp-server_

Il faut créer le dossier `config` avec les fichiers de configuration de dhcp afin d'utiliser ces fichiers dans le Vagrantfile :

    cisco@douglasXX:~/dhcp$ mkdir config
    cisco@douglasXX:~/dhcp$ touch config/dhcpd.conf
    cisco@douglasXX:~/dhcp$ touch config/isc-dhcp-server

Vous avez juste a modifier les fichiers dhcpd.conf et isc-dhcp-server :  

Le fichier dhcpd.conf contient les informations de sous réseau pour l'attribution des machines.

La mise en place d'un `pool` d'adresses d'un sous réseau s'effectue comme ceci : 

```
subnet 192.168.21.0 netmask 255.255.255.0 {
  range 192.168.21.100 192.168.21.150;
  option routers 192.168.21.1;
}
```

L'option **range** permet de définir une fourchette d'adresses IP qui seront attribuées aux machines sur le sous réseau défini par l'option **subnet** ci-dessus.

Le fichier isc-dhcp-server doit lui être configuré en fonction de l'interface réseau sur laquelle le serveur dhcp doit écouter.

Voici un exemple pour une écoute sur l'interface réseau `eth1` pour des adresses IPV4 :

    INTERFACESv4="eth1"


## Configuration avec un DNS dynamique

Le DNS dynamique permet au serveur DHCP de mettre à jour des zones spécifiques du DNS lors de l'attribution d'une adresse IP à une machine du sous réseau.

Pour activer le DNS dynamique (DDNS) il faut ajouter les deux lignes suivantes fichier dhcpd.conf :

```
ddns-updates on;
ddns-update-style interim;
```

Ces options permettent d'activer la mise à jour du DNS via le DHCP.

Il est également nécessaire d'ajouter une clé d'authentification dans ce fichier qui doit être exactement la même que celle du serveur DNS. Ceci permettra d'effectuer une mise à jour des zones de manière sécurisée.

Ensuite, il faut modifier nos pool afin de spécifier la zone du serveur DNS a mettre à jour. 

Voici un exemple : 

```
subnet 192.168.21.0 netmask 255.255.255.0 {
  range 192.168.21.100 192.168.21.150;
  option routers 192.168.21.1;
  option domain-name "info.capsule.iut";
  option domain-name-servers 192.168.21.50;
  zone info.capsule.iut.{
        primary 192.168.21.50;
  }
}
```

Ici nous avons ajouté différentes options : 

`option domain-name` : permet de spécifier le nom de domaine des machines sur ce sous-réseau

`option domain-name-servers` : permet de spécifier l'adresse IP du serveur DNS

`zone info.capsule.iut.` permet de définir la zone DNS a mettre à jour.

## Commande d'initialisation 

Vous pouvez lancer votre serveur dhcp a l'aide de cette commande :

    cisco@douglasXX:~/dhcp$ vagrant up


Une fois la machine lancée vous pouvez vous y connecter et voir le status de votre serveur DHCP à l'aide de la commande suivant :
    
    cisco@douglasXX:~/dhcp$ vagrant ssh dhcp
    vagrant@dhcp:$ sudo systemctl status isc-dhcp-server

Si vous effectuez des modifications dans votre serveur DHCP vous pouvez redémarrer le service isc-dhcp-server à l'aide de la commande suivante :

    vagrant@dhcp:$ sudo systemctl restart isc-dhcp-server


----

Configuration complète de [`dhcpd.conf`](dhcp-nfs/config/dhcp/dhcpd.conf)  
Configuration complète de [`isc-dhcp-server`](dhcp-nfs/config/dhcp/isc-dhcp-server)

---
