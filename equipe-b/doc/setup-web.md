# Guide d'Installation et Configuration WEB

Ce guide détaille les étapes pour mettre en place une machine virtuelle avec des configurations réseau, services et web spécifiques.

### Configuration de la Machine "topaze"

La configuration de la machine "topaze" comprend les éléments suivants :

1. **Définition de la Machine :** Nom de la machine : "topaze"
2. **Réseau :**
   - Configuration de deux interfaces réseau :
     - **Interface 1 :** Réseau public avec une IP spécifique : `10.14.0.3`, via la carte `enp1s2`.
     - **Interface 2 :** Utilisation d'un port forwarding pour rediriger le port `80` de la machine virtuelle vers le port `8081` de l'hôte.
3. **Partage de Dossiers :**
   - Dossier local "conf" synchronisé avec `/home/vagrant/conf` sur la machine virtuelle.
4. **Provisionnement :**
   - Exécution de commandes shell pour :
     - Mise à jour des paquets avec `apt-get update` et mise à niveau avec `apt-get -y upgrade`.
     - Installation de divers outils comme `curl`, `net-tools`, `bash-completion`, `wget`, `lsof`.
     - Configuration du fichier `/etc/host.conf`.
     - Configuration du nom d'hôte et des entrées dans `/etc/hosts`.
     - Installation et configuration de `postfix` pour le courrier électronique.
     - Installation et configuration de `dovecot` pour les services IMAP.
     - Installation d'Apache, PHP, et RainLoop pour la messagerie web.
     - Redémarrage de la machine après l'installation des composants.

5. **Services Web :**
   - RainLoop, une interface web pour la messagerie, est installé et configuré pour fonctionner sur la machine virtuelle.
