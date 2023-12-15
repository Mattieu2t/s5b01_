---
title: SAÉ 5B.01 - Saada Jugurtha
subtitle: Equipe C - Capsule Corp.

---
# <center>Semaine 46 (13/11 au 17/11) :</center>

## Schématisation sur Packet Tracer

![image](https://cdn.discordapp.com/attachments/687337171434078244/1178678328044044339/image.png)

## Branchement de la baie

![image](https://cdn.discordapp.com/attachments/687337171434078244/1178677424200896643/IMG_9037.JPG)

## Configuration des Routeurs

### Interfaces sur R1 :
| **Interface**  | **Port**  | **IP /Masque** |
|----------------|-------------|----------------|
| `FastEthernet 0`   | vlan21 | 192.168.21.0 /24   |
| `FastEthernet 1`   | vlan22 | 192.168.22.0 /24   |
| `FastEthernet 2`   | vlan23 | 192.168.23.0 /24   |
| `FastEthernet 3`   | XXXX | XX.XX.XX.XX /XX   |
| `FastEthernet 4`   | WLAN | 192.168.1.1    /30   |

### Interfaces sur R2 :
| **Interface**  | **Port**  | **IP /Masque** |
|----------------|-------------|----------------|
| `FastEthernet 0`   | vlan10  | 192.168.4.1 /24   |
| `FastEthernet 1`   | XXXX | XX.XX.XX.XX /XX   |
| `FastEthernet 2`   | XXXX | XX.XX.XX.XX /XX   |
| `FastEthernet 3`   | vlan3 | 192.168.1.2 /24   |
| `FastEthernet 4`   | WLAN | 10.10.10.13 /29 |

# <center>Semaine 48 (27/11 au 01/12) :</center>

Lundi:
- Pris en compte enfin du vrai sujet
- Mise en place du Markdown individuel

Mardi:
- Installation d'un serveur dhcp avec isc-dhcp-server sur douglas14

Mercredi:
- Déinstallation du firewall raspberry qui bloquer tout le traffic
- Installation du service dns en local sur douglas14

Jeudi:
- Mise en place du service dns sur le réseau public avec l'ip 10.10.10.10 sur douglas14
- Configuration du serveur dns pour être accessible depuis l'exterieur

Vendredi: 
- Installation d'un service web (apache2) sur le réseau public
- Documentation de toute la semaine
- Backup des routeurs, switchs et machine vagrant (tftp)

### Schématiation sur Packet Tracer
![image](https://cdn.discordapp.com/attachments/687337171434078244/1180099311028142140/Capture_decran_2023-12-01_a_11.51.53.png?ex=657c3020&is=6569bb20&hm=535173918b8d67cb489b3b51b2c34d819f04a839a94bd9628a7913126ef07dcc&)

# <center>Semaine 50 (11/12 au 15/12) :</center>


Lundi:
- Mise en place du serveur mail sous docker

Mardi:
- Reflexion d'une mise en place d'un plan de reprise d'activité (docker ?)
- Reflexion d'un système de gestion des equipements réseaux
- Script pour up en même temps les services DHCP et DNS sur les douglas

Mercredi:
- Finalisation du DNS & DNS Dynamique & DNS Resolver sur l'ip 10.10.10.10 (Translation NAT sur 192.168.4.2)
- Mise en place du service web sur un raspberry sur l'ip 10.10.10.11 & http://capsule.iut/
- Mise en place du service mail sur le meme rapsberry sur l'ip 10.10.10.11 & http://mail.capsule.iut/ avec Postfix (admin) et Dovecot (save) et Rainloop (gestion)

Jeudi:
- Tentative de mise en place d'un pare feu avec pfsense (annulé)
- Mise en place du proxy web pour le service production avec squid :
On voit ici que le curl passe bien par le proxy en 192.168.23.10 
avant d'aller sur internet depuis un pc prod
![image](https://cdn.discordapp.com/attachments/687337171434078244/1185195267092385832/Capture_du_2023-12-14_15-00-23.png)

- Filtrage des packets des services info et admin vers production : 
On voit que les ping depuis Info vers Production sont bloqués par le routeur
![image](https://media.discordapp.net/attachments/687337171434078244/1184876890708774932/unnamed.png)

Vendredi: 
- Test d'envoi de mails réussi
- Procèdure de la mise en place du serveur mail & web
- Documentation de toute la semaine
- Backup des routeurs, switchs, raspberry et machine vagrant (tftp)
