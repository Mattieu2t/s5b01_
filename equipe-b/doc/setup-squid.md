# Guide d'Installation et Configuration SQUID

Ce guide détaille les étapes pour mettre en place une machine virtuelle avec des configurations spécifiques.

### Configuration de la Machine "calcedoine"

La configuration de la machine "calcedoine" comprend les éléments suivants :

1. **Définition de la Machine :** Nom de la machine : "calcedoine"
2. **Réseau :**
   - Configuration d'un réseau privé avec l'adresse IP : `192.168.60.40`.
3. **Provisionnement :**
   - Transfert de fichiers :
     - Copie du dossier "config" depuis le répertoire local vers `/home/vagrant/` sur la machine virtuelle.
   - Exécution de commandes shell pour :
     - Mise à jour des paquets avec `apt-get update`.
     - Installation de `squid`.
     - Copie du fichier de configuration `squid.conf` vers `/etc/squid/squid.conf`.
     - Redémarrage du service `squid`.
