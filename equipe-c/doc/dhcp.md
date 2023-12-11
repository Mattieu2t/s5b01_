# Service DHCP avec vagrant et isc-dhcp-server

## 1. Introduction 

Mise en place d'un service DHCP a l'aide de vagrant et du paquet isc-dhcp-server.  
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
      #echo "INTERFACESv4=\"eth1 eth2 eth3\"" > /etc/default/isc-dhcp-server
      cp -f /tmp/dhcpd.conf /etc/dhcp/
      cp -f /tmp/isc-dhcp-server /etc/default/
      systemctl restart isc-dhcp-server
      ip route del default via 10.0.2.2
      ip route add default via 192.168.21.1 dev eth1
    SHELL
  end

end
```

Il faut creer le dossier `config` avec les fichiers de configuration de dhcp :

    cisco@douglasXX:~/dhcp$ mkdir config
    cisco@douglasXX:~/dhcp$ touch config/dhcpd.conf
    cisco@douglasXX:~/dhcp$ touch config/isc-dhcp-server

Vous avez juste a modifier les fichier dhcpd.conf et isc-dhcp-server :  

Retrouvez la config de `dhcpd.conf` ici  
Retrouvez la config de `isc-dhcp-server` ici

Vous pouvez lancer votre serveur dhcp a l'aide de cette commande :

    cisco@douglasXX:~/dhcp$ vagrant up
