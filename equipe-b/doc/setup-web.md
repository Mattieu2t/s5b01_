# Guide d'Installation et Configuration WEB

Ce guide détaille les étapes pour mettre en place une machine virtuelle avec des configurations réseau, services et web spécifiques.

### Configuration de la Machine "peridot"

La configuration de la machine "peridot" comprend les éléments suivants :

1. **Définition de la Machine :** Nom de la machine : "peridot"
2. **Réseau :**
	- Configuration l'interfaces réseau :
     	- Réseau public avec une IP spécifique : `10.10.10.11`, via la carte `enp1s2`.
     	- Utilisation d'un port forwarding pour rediriger le port `80` de la machine virtuelle vers le port `8081` de l'hôte.
3. **Partage de Dossiers :**
   	- Dossier local "conf" synchronisé avec `/home/vagrant/conf` sur la machine virtuelle.
4. **Provisionnement :**
   	- Exécution de commandes shell pour :
     	- Mise à jour des paquets avec `apt-get update` et mise à niveau avec `apt-get -y upgrade`.
     	- Installation de nginx pour le server web.
     	- Copy de la page web du dossier conf pour la metre dans /var/www/html/.

5. **Services Web :**
   - Une page web est installé pour fonctionner sur la machine virtuelle.
