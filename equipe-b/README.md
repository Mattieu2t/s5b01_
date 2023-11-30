---
title: SAÉ 5B.01 - Équipe B
subtitle: SYSSKO
---

# Infos basiques
- Baie n°4
- IP public : 10.10.10.8/29
- IP privé : 192.168.90.x
- DNS : syssko.iut
- Connexion à Douglas : cisco@douglasXX.iut-infobio.priv.univ-lille1.fr

# Organisation d’équipe :
 - Coordinateur S1 (25/09): Guerric
 - Coordinateur S2 (09/10): Mathilde
 - Coordinateur S3 (13/11): Cyriac
 - Coordinateur S4 (27/11): Mattieu


## Répartition réseau public
- 10.10.10.8/29
- Gateway: 10.10.10.14
- Zone DNZ: syssko.iut.
- VLAN: 20


Au niveau de la sécurité, aucun serveur ne doit ping le public sauf si il est nécessaire (web, mail…) avec un Fail2Ban sur les différents services publics..

## Organisation des réseaux 
 - 1 réseau public
   - Serveur web
   - Serveur mail
 - 3 réseau privé
   - Service info
   - Service administratif
   - Service production (public)

Infos supplémentaires : 
 - DNS autorité
 - Firewall


| Réseau            | Adresse IP        | Masque de Sous-réseau | Nom de la Machine  | Utilité                   |
|-------------------|-------------------|-----------------------|--------------------|---------------------------|
| Public            | 10.10.10.9        | 255.255.0.0           | Kyanite            | DNS                       |
| Public            | 10.10.10.10       | 255.255.0.0           | Topaze             | Email                     |
| Public            | 10.10.10.11       | 255.255.0.0           | Péridot            | Web                       |
| Public            | 10.10.10.12       | 255.255.0.0           | Quartz             | Firewall                  |
| Informatique      | 192.168.60.10     | 255.255.255.0         | Labradorite        | DHCP                      |
| Informatique      | 192.168.60.20     | 255.255.255.0         | Opale              | LDAP                      |
| Informatique      | 192.168.60.30     | 255.255.255.0         | Iolite             | NFS                       |
| Informatique      | 192.168.60.40     | 255.255.255.0         | Calcédoine         | Proxy Web                 |
| Informatique      | 192.168.60.50     | 255.255.255.0         | PC1-I              | Machine pour les admins   |
| Administratif     | 192.168.70.10     | 255.255.255.0         | PC1-A              | Machine pour les salariés |
| Administratif     | 192.168.70.20     | 255.255.255.0         | PC2-A              | Machine pour les salariés |
| Production        | 192.168.80.10     | 255.255.255.0         | PC1-P              | Machine pour les salariés |
| Production        | 192.168.80.20     | 255.255.255.0         | PC2-P              | Machine pour les salariés |
