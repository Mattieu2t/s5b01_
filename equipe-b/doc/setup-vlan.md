# **Configuration des VLAN sur un Switch Cisco**
## **Connexion au Switch**
 - Utilisez minicom pour vous connecter au switch Cisco.

`minicom`

- Connectez-vous au switch.

## **Configuration des VLANs**

```
enable
configure terminal
```
- Pour configurer un port pour un VLAN spécifique (par exemple, VLAN 10) :

```
interface Fa0
switchport mode access
switchport access vlan 10
```
- Pour créer une interface virtuelle pour le VLAN 10 avec une adresse IP :

```
interface Vlan10
name prod
ip address 10.14.0.1 255.255.255.224
no shutdown
end
```

- Assurez-vous d'adapter les adresses IP et masques de sous-réseau selon vos besoins.

## **Enregistrement des Modifications**

`write memory`

- Cela sauvegardera la configuration dans la mémoire persistante du switch.

-----
Assurez-vous de remplacer les valeurs spécifiques (comme les adresses IP) par celles correspondant à votre propre réseau. Cette documentation fournit une base pour configurer les VLANs sur un switch Cisco, mais les détails peuvent varier en fonction du modèle et de la version du switch.
