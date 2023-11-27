---
title: SAÉ 5B.01 - Équipe B
subtitle: SYSSKO
---

# Infos basiques
- Baie n°4
- IP public : 10.14.0.0/16
- IP privé : 192.168.x.x
- DNS : syssko.iut
- Connexion à Douglas : cisco@douglasXX.iut-infobio.priv.univ-lille1.fr

# Organisation d’équipe :
 - Coordinateur S1 (25/09): Guerric
 - Coordinateur S2 (09/10): Mathilde
 - Coordinateur S3 (13/11): Cyriac
 - Coordinateur S4 (27/11): Mattieu


## Répartition réseau public
 - Masque donné : 10.14.0.0/16
   - 10.14.0.0/27
   - 10.14.32.0/27
   - 10.14.64.0/27
   - 10.14.96.0/27

Au niveau de la sécurité, aucun serveur ne doit ping le public sauf si il est nécessaire (web, mail…) avec un Fail2Ban sur les différents services publics..

## Organisation des réseaux 
 - 1 réseau public
   - Serveur web
   - Serveur mail
 - 3 réseau privé
   - Service info
   - Service administratif
   - Service production

Infos supplémentaires : 
 - DNS autorité
 - Firewall

