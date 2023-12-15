# Configuration des switch :

## Configuration du switch S1 :

Current configuration : 1506 bytes
!
! Last configuration change at 23:58:28 UTC Tue Mar 2 1993
!
version 15.0
no service pad
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname Switch
!
boot-start-marker
boot-end-marker
!
!
no aaa new-model
system mtu routing 1500
vtp domain null
vtp mode transparent
!
!
!
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
vlan internal allocation policy ascending
!
vlan 10
 name public
!
!
!
!
!
!
interface FastEthernet0/1
 switchport access vlan 10
!
interface FastEthernet0/2
!
interface FastEthernet0/3
!
interface FastEthernet0/4
!
interface FastEthernet0/5
!
interface FastEthernet0/6
!
interface FastEthernet0/7
!
interface FastEthernet0/8
!
interface FastEthernet0/9
!
interface FastEthernet0/10
!
interface FastEthernet0/11
!
interface FastEthernet0/12
!
interface FastEthernet0/13
!
interface FastEthernet0/14
!
interface FastEthernet0/15
!
interface FastEthernet0/16
!
interface FastEthernet0/17
!
interface FastEthernet0/18
!
interface FastEthernet0/19
!
interface FastEthernet0/20
!
interface FastEthernet0/21
!
interface FastEthernet0/22
!
interface FastEthernet0/23
!
interface FastEthernet0/24
 switchport trunk allowed vlan 1-5,10-40
 switchport mode trunk
!
interface GigabitEthernet0/1
!
interface GigabitEthernet0/2
!
interface Vlan1
 no ip address
!
interface Vlan10
 ip address 10.10.10.25 255.255.255.248
!
ip http server
ip http secure-server
logging esm config
!
line con 0
line vty 5 15
!
end


1. **`vlan 10`** : Crée un VLAN avec l'ID 10.

2. **`name public`** : Donne le nom "public" au VLAN 10.

3. **`interface FastEthernet0/1`** : Configure les paramètres pour l'interface FastEthernet0/1.

4. **`switchport access vlan 10`** : Configure l'interface FastEthernet0/1 pour utiliser le VLAN 10 en mode d'accès.

5. **`interface FastEthernet0/24`** : Configure les paramètres pour l'interface FastEthernet0/24.

6. **`switchport trunk allowed vlan 1-5,10-40`** : Autorise les VLAN 1 à 5 et 10 à 40 sur l'interface en mode trunk.

7. **`switchport mode trunk`** : Configure l'interface en mode trunk.

8. **`interface Vlan10`** : Configure les paramètres pour l'interface Vlan10.

9. **`ip address 10.10.10.25 255.255.255.248`** : Attribue une adresse IP statique (10.10.10.25 avec un masque de sous-réseau de 255.255.255.248) à l'interface Vlan10.