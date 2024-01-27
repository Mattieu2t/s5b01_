---
title: SAÉ 5B.01 - Équipe D
subtitle: TechTonic

Membres
 saad.cheikhaoui.etu
 mohamed.ghazi.etu
 augustin.beeuwsaert.etu
 martin.rigaux.etu
 
DNS : techtonic.iut

---

# Notre projet : 
Dans le cadre du projet de notre entreprise "TechTonic", nous avons pour objectif de mettre en place une infrastructure réseau comprenant 1 réseau public ainsi qu'un réseau privé. Chaque réseau comprend plusieurs services. 

CF : Voir [sujet](../README.md) !

# Les services installés aisi que les procédures:

## - [Ldap](../equipe-d/projet/infrastructure/réseau_privé/ldap/Procédure/) 
- [Instalation de LDAP ](../equipe-d/projet/infrastructure/réseau_privé/ldap/Procédure/Installation.md) 
- [Ajouter un utilisateur ](../equipe-d/projet/infrastructure/réseau_privé/ldap/Procédure/Add_user.md) 
- [Supprimer un utilisateur ](../equipe-d/projet/infrastructure/réseau_privé/ldap/Procédure/Del_user.md) 
- [Modifier un utilisateur  ](../equipe-d/projet/infrastructure/réseau_privé/ldap/Procédure/Modify_user.md)

## - [Serveur de mail](../equipe-d/projet/infrastructure/réseau_public/mail/README.MD)

## - [Serveur Web](../equipe-d/projet/infrastructure/réseau_public/web/README.MD)
## - [DHCP](../equipe-d/projet/infrastructure/réseau_privé/dhcp/README.MD)
## - [DNS](../equipe-d/projet/infrastructure/réseau_public/dns/README.MD)
## - [NFS](../equipe-d/projet/infrastructure/réseau_privé/nfs/README.MD)
## - [PROXY](../equipe-d/projet/infrastructure/réseau_privé/)

| Réseau            | Adresse IP        | Masque de Sous-réseau | Nom de la Machine  | Utilité                   |
|-------------------|-------------------|-----------------------|--------------------|---------------------------|
| Public            | 10.10.10.18       | 255.255.255.248       | Douglas06          | DNS                       |
| Public            | 10.10.10.18       | 255.255.255.248       | Douglas06          | Mail                      |
| Public            | 10.10.10.18       | 255.255.255.248       | Douglas06          | Web                       |
| Public            | 10.10.10.19       | 255.255.255.248       | Douglas05          | Firewall                  |
| Privé             | 192.168.0.1       | 255.255.0.0           | Douglas05          | Firewall                  |
| Privé             | 192.168.12.254    | 255.255.255.0         | Douglas05          | DHCP                      |
| Privé             | 192.168.12.252    | 255.255.255.0         | Douglas05          | LDAP                      |
| Privé             | 192.168.12.253    | 255.255.255.0         | Douglas05          | NFS                       |
| Privé             | 192.168.12.251    | 255.255.255.0         | Douglas05          | Proxy Web                 |
| Privé             | 192.168.12.240    | 255.255.255.0         | PC1                | Client test                |


# Information : 
Pour ce projet nous allons travailler sur la baie N°3 ainsi que sur le réseaux privé : 10.10.10.0
 

# Compte rendu :

Chaque membre de l'équipe dépose un compte rendu hebdomadaire de ce qu'il a fait. Vous pouvez retrouver ses comptes rendus dans le répertoire **/projet/cr-team**

Chaque semaine, l'équipe fait également le point sur l'avancement du projet. Vous pouvez retrouver ces comptes rendus dans le répertoire **/projet/cr-hebdo**
