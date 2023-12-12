# Guide d'Installation et Configuration DHCP

Ce guide détaille les étapes pour mettre en place deux machines virtuelles avec des configurations réseau et de service spécifiques.

### Configuration de la Machine "labradorite"

La configuration de la machine "labradorite" comprend les éléments suivants :

1. **Définition de la Machine :** Nom de la machine : "labradorite"
2. **Réseau :**
   - Configuration d'un réseau privé avec l'adresse IP : `192.168.60.2`.
3. **Provisionnement :**
   - Transfert de fichiers :
     - Copie du dossier "config" depuis le répertoire local vers `/home/vagrant/` sur la machine virtuelle.
   - Exécution de commandes shell pour :
     - Mise à jour des paquets avec `apt-get update`.
     - Installation de `isc-dhcp-server`.
     - Copie des fichiers de configuration `dhcpd.conf` et `isc-dhcp-server`.
     - Démarrage du service `isc-dhcp-server`.

### Configuration de la Machine "topaze"

La configuration de la machine "topaze" comprend les éléments suivants :

1. **Définition de la Machine :** Nom de la machine : "topaze"
2. **Réseau :**
   - Configuration d'un réseau public via une carte réseau spécifique (`enp1s2`) en mode pont (bridge).
   - La configuration réseau ne se fait pas automatiquement (`auto_config: false`).
