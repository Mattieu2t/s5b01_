# Service DHCP avec vagrant et isc-dhcp-server

## 1. Introduction 

Mise en place d'un service DHCP a l'aide de vagrant et du paquet isc-dhcp-server.  
Le serveur DHCP donne des adresses IP aux machines sur le réseau en fonction du sous réseau sur lequel elles se situent.  
Grace a vagrant le serveur DHCP ce créer rapidement avec ça configuration déjà implémenté.

## 2. Pré-requis  

- Avoir configuré les Router 1 et 2 de la baies ([routeur 1 et 2](router.md))
- Avoir configuré les Switch 1 à 4 de la baies ([Switch 1 à 4](switch.md))

## 3. Instalation

Connectez vous sur une machine `douglasXX`. (nom et mdp : `cisco` )  
Creer un dossier 'dhcp' dans le dossier courant, ce dossier vas contenir tout les fichier d'installation du serveur DHCP :  

    cisco@douglasXX:~$ mkdir dhcp

Maintenant creez un fichier `Vagrantfile` dans le dossier dhcp a l'aide de cette commande : 

    cisco@douglasXX:~/dhcp$ vagrant init

Le fichier Vagrantfile est le fichier le plus important, grace a lui nous allons créer une machine virtuelle ou nous allons ajouté toute les configurations nécessaire a l'installation du serveur DHCP.

Voici la configuration du Vagrantfile pour créer le serveur DHCP :

```sh
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
```

IP de la machine : 192.168.21.250/24  
Dans cette config vagrant nous retrouverons les fichiers `dhcpd.conf` et `isc-dhcp-server` que nous allons transférer dans le dossier `/tmp`, sur la machine DHCP.  
Ensuite nous allons lancer un SHELL afin de mettre a jour la machine, déplacer les fichiers de configuartion de DHCP et changer les route par defaut. 

Pour avoir la configuration final du Vagrantfile vous la retrouveré [ici](dhcp-nfs/Vagrantfile)

## Configuration 

Pour configurer le serveur DHCP les principaux fichiers à modifier sont _/etc/dhcp/dhcpd.conf_ et _/etc/default/isc-dhcp-server_

Il faut creer le dossier `config` avec les fichiers de configuration de dhcp afin d'utiliser ces fichiers dans le Vagrantfile :

    cisco@douglasXX:~/dhcp$ mkdir config
    cisco@douglasXX:~/dhcp$ touch config/dhcpd.conf
    cisco@douglasXX:~/dhcp$ touch config/isc-dhcp-server

Vous avez juste a modifier les fichier dhcpd.conf et isc-dhcp-server :  

Le fichier dhcpd.conf contient les informations de sous réseau pour l'attribution des machines.

La mise en place d'un `pool` d'adresse d'un sous réseau s'effectue comme ceci : 

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

Retrouvez la configuration complète de `dhcpd.conf` [ici](dhcp-nfs/config/dhcpd.conf)  
Retrouvez la configuration complète de `isc-dhcp-server` [ici](dhcp-nfs/config/isc-dhcp-server)

---