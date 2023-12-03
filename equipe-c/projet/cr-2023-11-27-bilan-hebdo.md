# Bilans Hebdomadaires

## Bilan Semaine 48

Les tâches sont à peu près divisées en deux groupes : du côté système, il y a Younes Ben Dhiab et Benoît Dessaint ; et du côté réseau, il y a Cedric Larsonnier et Jugurtha Saada. 
<br>
Younes Ben Dhiab a commencé/terminé la mise en place du LDAP, du cache-proxy, du NFS et du serveur mail.
<br>
Benoît Dessaint a commencé/terminé à mettre en place le serveur mail, le protocole NFS, certains services, le DNS dynamique et le DHCP.
<br>
Cedric Larsonnier et Jugurtha Saada ont commencé/terminé à mettre en place le DNS, le DHCP, certaines sauvegardes/backups et câblage.

Les différents problèmes rencontrés se trouvent surtout sur la mise en place de choses non étudiées en cours, comme le serveur mail, le LDAP (LDAP sera étudié durant la semaine 49)...
Sinon, voici quelques problèmes spécifiques :

    - Le DHCP qui mettait à jour le DNS des machines douglas et le DHCP qui n'avait pas la permission de mettre à jour les zones du DNS.
    - Un problème de routes qui posait problème pour l'attribution des IP sur les machines qui n'étaient pas sur le même Switch.

Les tâches complètement terminées cette semaine sont logiquement le DHCP et le DNS dynamique. 
Une connexion entre le réseau public et les réseaux privés a été établi, et l’ensemble de l’infrastructure est relié au FAI.
<br>
Les autres protocoles, services… sont encore en phase de tests grâce à l’utilisation de Vagrant et de scripts.
L’objectif de la semaine 50 est donc la finalisation : 

    - du NFS 
    - du LDAP 
    - du Cache-Proxy 
    - du Serveur Mail 
    - de la Configuration des Services

## Bilan Semaine 50