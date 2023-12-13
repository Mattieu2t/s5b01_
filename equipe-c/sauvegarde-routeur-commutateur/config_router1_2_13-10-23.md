# Router 

Connection a une machine `douglasXX` pui pour aller sur le router R1 a l'aide de `minicom`:  
```
ssh cisco@douglasXX.iut-infobio.priv.univ-lille1.fr
minicom
```
Commande a connaitre pour minicom :

**enable** : Permet de passer en root sur le router R1.  
**configure terminal** : Configuration global de router R1.  
**interface "NOM DE L'INTERFACE"** : permet de modifier les atribues de l'interface.  
Pour executer des commandes tel que "**show running-config**" ou "**ip address**" dans configure terminal il faut ajouter au debut de la commande "**do**".

## R1

Config :
```
douglas13:~$ minicom
Welcome to minicom 2.8

OPTIONS: I18n 
Port /dev/ttyS0, 14:42:44

Press CTRL-A Z for help on special keys


R1>enable
R1#configure terminal
R1(conf)#interface Fastinternet4 
R1(conf-if)#ip address 192.168.1.1 255.255.255.252

vlan21
name info
vlan22
name admin
vlan23
name prodcution

interface vlan21
ip address 192.168.21.0 255.255.255.0
interface vlan22
ip address 192.168.22.0 255.255.255.0
interface vlan23
ip address 192.168.23.0 255.255.255.0

interface Fastintenet0
switchport mode access
switchport access vlan21

interface Fastintenet1
switchport mode access
switchport access vlan22

interface Fastintenet2
switchport mode access
switchport access vlan23

ip dhcp pool vlan21
network 192.168.21.0 255.255.255.0
default-router 192.168.1.1

ip dhcp pool vlan22
network 192.168.21.0 255.255.255.0
default-router 192.168.1.1

ip dhcp pool vlan23
network 192.168.21.0 255.255.255.0
default-router 192.168.1.1
```

## R2

Config :
```
douglas15:~$ minicom
Welcome to minicom 2.8

OPTIONS: I18n 
Port /dev/ttyS0, 14:42:44

Press CTRL-A Z for help on special keys


R1>enable
R1#configure terminal
R1(conf)#interface vlan3 
R1(conf-if)#ip address 192.168.1.2 255.255.255.252
R1(conf-if)#exit
R1(conf)#interface Fastinternet3
R1(conf-if)#switchport access vlan 3
R1(conf-if)#exit
R1(conf)#interface Fasteternet4
R1(conf-if)#ip address dhcp
```