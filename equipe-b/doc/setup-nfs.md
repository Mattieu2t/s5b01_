# Guide d'Installation et Configuration de NSF

Ce guide détaille les étapes pour mettre en place un environnement de machine virtuelle Vagrant avec plusieurs disques, un RAID 5, NFS, et Samba.

### Configuration de la Machine Virtuelle

La configuration de la machine virtuelle se fait via Vagrant et VirtualBox.
1. **Définition de la Machine :** Nom de la machine : "iolite"
2. **Réseau :**
   - Configuration d'un réseau privé avec l'adresse IP : `192.168.60.30` et le masque de sous-réseau `255.255.255.0`.

### Gestion des Disques

La machine virtuelle est configurée avec quatre disques d'une taille de 5GB chacun.

1. **Disques :**
   - `disk1`, `disk2`, `disk3`, `disk4`

### Provisionnement avec Shell

Le provisionnement de la machine est effectué via un script shell pour installer et configurer certains services.

1. **Installation de Paquets :**
   - Mise à jour des paquets (`apt update`)
   - Installation de :
     - `mdadm`
     - `nfs-kernel-server`
     - `samba`

2. **Configuration du RAID 5 :**
   - Création d'un RAID 5 avec 3 disques et 1 disque de secours.

3. **Système de Fichiers :**
   - Formatage du RAID avec `mkfs.ext4`
   - Création d'un point de montage : `/home/RAID`
   - Montage du RAID sur `/home/RAID`

4. **Configuration NFS :**
   - Configuration des partages NFS pour différents réseaux IP et utilisateurs.
   - Création de répertoires pour les partages NFS.

5. **Configuration Samba :**
   - Création de répertoires pour les partages Samba.
   - Montage de tous les partages.

6. **Démarrage des Services :**
   - Démarrage du service `nfs-kernel-server`.

### Accès aux Partages

1. **Partages NFS :**
   - `/home` est partagé en lecture pour le réseau `192.168.60.0/24`.
   - `/var/share/public` est partagé en lecture pour les réseaux `192.168.60.0/24`, `192.168.70.0/24`, `192.168.80.0/24`.
   - `/var/share/root` est partagé en lecture-écriture pour l'adresse IP `192.168.60.50`.

2. **Partages Samba :**
   - Création de répertoires pour différents types de partage.
