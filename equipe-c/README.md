---
title: SAÉ 5B.01 - Équipe C
subtitle: CapsuleCorp

Membres
 jugurtha.saada.etu
 benoit.dessaint.etu
 cedric.larsonnier.etu
 younes.bendhiab.etu
 
DNS : capsule.iut

---

# Informations :

Maquettage resaux : 

![image](doc/images/Maquette2.0.png)

# Plages d'adresse IP :

- 10.10.10.9 - .14
- IP Publique = 10.10.10.13 /29
- Gateway = 10.10.10.14 /29

# Nom de domaine :
| **Domaine**         | **IP /Masque**                    |
|--------------------|-----------------------------------|
| `capsule.iut`      | 192.168.4.5 /24 & 10.10.10.11 /29 |
| `ns.capsule.iut`   | 192.168.4.2 /24 & 10.10.10.10 /29 |
| `mail.capsule.iut` | 192.168.4.5 /24 & 10.10.10.11 /29 |
| `proxy.capsule.iut`| 192.168.21.10 /24                 |

# Services :
| **Nom**     | **Machine**          | **IP /Masque**                      |
|-------------|----------------------|-------------------------------------|
| `DHCP`      | douglas14 - vagrant  | 192.168.21.250 /24                  |
| `Ldap`      | douglas14 - vagrant  | 192.168.21.253 /24                  |
| `Nfs`       | douglas14 - vagrant  | 192.168.21.249 /24                  |
| `ProxyWeb`  | douglas14 - vagrant  | 192.168.21.10 /24                   |
| `DNS`       | douglas16 - vagrant  | 192.168.4.2 /24 & 10.10.10.10 /29   |
| `Web`       | Raspberry            | 192.168.4.5 /24 & 10.10.10.11 /29   |
| `Mail`      | Raspberry            | 192.168.4.5 /24 & 10.10.10.11 /29   |
| `Firewall`  | XXXXXXXXX - vagrant  | XX.XX.XX.XX /XX                     |


---

# Documentation :

Commande de base pour les [routeurs/commutateurs](doc/routeur-commutateur.md)  
Installation du service [DHCP](doc/dhcp.md)  
Installation du service [DNS](doc/dns.md)  
Installation du service [proxy-cache](doc/proxy-cache.md)  
Installation du service [serveur mail](doc/serveur-mail.md)  
Installation du service [LDAP](doc/ldap-nfs/ldap-nfs.md)


---

# Intermédiaire du groupe :

- Semaine 39 du 25/09 au 29/09 = Jugurtha
- Semaine 41 du 09/10 au 13/10 = Cédric
- Semaine 46 du 13/11 au 17/11 = Benoit
- Semaine 48 du 27/11 au 01/12 = Younes
- Semaine 50 du 11/12 au 15/12 = Jugurtha
