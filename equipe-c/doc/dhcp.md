# Service DHCP avec vagrant et isc-dhcp-server

## 1. Introduction 

Mise en place d'un service DHCP a l'aide de vagrant et du paquet isc-dhcp-server.  
Le protocole DHCP permet au serveur DHCP de donner des adresses IP à des machines du réseau en fonction du sous réseau sur lequel elles se situent.  
Le paquet isc-dhcp-server nous permet de creer le serveur DHCP sur la machine.    
Vagrant vas creer une machine rapidement avec toute ça configuration grace au Vagrantfile

## 2. Pré-requis  

- Disposé d'un reseaux local
- Avoir les bases de TCP/IP
- Avoir configuré les Router 1 et 2 de la baies 
- Avoir configuré les Switch 1 à 3 de la baies 

## 3. Instalation

Connectez vous sur une machine `douglasXX`. (nom et mdp : `cisco` )  
Creer un dossier dans le dossier courant et appelé le `dhcp` :  

    cisco@douglasXX:~$ mkdir dhcp

Maintenant vous allez creer un fichier `Vagrantfile` dans le dossier dhcp a l'aide de cette commande : 

    cisco@douglasXX:~/dhcp$ vagrant init

Vous pouvez remplacer tout le fichier `Vagrantfile` par ceci :

```sh
Vagrant.configure("2") do |config|
  
  config.vm.box = "debian/bookworm64"

  config.vm.define "dhcp" do |dhcp|
    dhcp.vm.hostname = "dhcp"
    dhcp.vm.network "public_network",bridge: "enp1s2", ip:"192.168.21.250", netmask: "255.255.255.0"
    dhcp.vm.provision "file", source: "config/dhcpd.conf",destination: "/tmp/"
    dhcp.vm.provision "file", source: "config/isc-dhcp-server",destination: "/tmp/"      
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

end
```

## Configuration 

Pour configurer le serveur DHCP les principaux fichiers à modifier sont _/etc/dhcp/dhcpd.conf_ et _/etc/default/isc-dhcp-server_

Il faut creer le dossier `config` avec les fichiers de configuration de dhcp afin d'utiliser ces fichiers dans le Vagrantfile :

    cisco@douglasXX:~/dhcp$ mkdir config
    cisco@douglasXX:~/dhcp$ touch config/dhcpd.conf
    cisco@douglasXX:~/dhcp$ touch config/isc-dhcp-server

Vous avez juste a modifier les fichier dhcpd.conf et isc-dhcp-server :  

Le fichier dhcpd.conf contient les informations de sous réseau pour l'attribution des machines.

La mise en place d'un pool d'adresse d'un sous réseau s'effectue comme ceci : 

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

Une fois les différents sous réseaux mis en place dans votre serveur vous pouvez redémarrer le service isc-dhcp-serveur à l'aide de la commande :

    root@dhcp:$ systemctl restart isc-dhcp-server


## Configuration avec un DNS dynamique

Le DNS dynamique permet au serveur DHCP de mettre à jour des zones spécifiques du DNS lors de l'attribution d'une adresse IP à une machine du sous réseau.

Pour activer le DNS dynamique (DDNS) il faut ajouter les deux lignes suivantes fichier dhcpd.conf :

```
ddns-updates on;
ddns-update-style interim;
```

Ces options permettent d'activer la mise à jour du DNS via le DHCP.

Il faut également modifier nos pool afin de spécifier la zone du serveur DNS a mettre à jour. 

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

option domain-name : permet de spécifier le nom de domaine des machines sur ce sous-réseau

option domain-name-servers : permet de spécifier l'adresse IP du serveur DNS

zone  permet de définir la zone DNS a mettre à jour.



Retrouvez la configuration complète de `dhcpd.conf` ici  
Retrouvez la configuration complète de `isc-dhcp-server` ici

Vous pouvez lancer votre serveur dhcp a l'aide de cette commande :

    cisco@douglasXX:~/dhcp$ vagrant up