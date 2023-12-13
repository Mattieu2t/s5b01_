# Guide d'Installation et Configuration MAIL

Ce guide détaille les étapes pour mettre en place une machine virtuelle avec des configurations réseau, services et mail spécifiques.

### Configuration de la Machine "topaze"

La configuration de la machine "topaze" comprend les éléments suivants :

1. **Définition de la Machine : Nom de la machine : "topaze"**

2. **Réseau :**
	- Configuration de l'interface réseau :
		- Réseau public avec une IP spécifique : `10.10.10.10`, via la carte `enp1s2`.
		- Utilisation d'un port forwarding pour rediriger le port `80` de la machine virtuelle vers le port `8081` de l'hôte.

3. **Partage de Dossiers :**
	- Dossier local "conf" synchronisé avec `/home/vagrant/conf` sur la machine virtuelle.

4. **Provisionnement :**
	- Exécution de commandes shell pour :
		- Mise à jour des paquets avec `apt-get update` et mise à niveau avec `apt-get -y upgrade`.
		- Installation de divers outils comme `curl`, `net-tools`, `bash-completion`, `wget`, `lsof`, `mailutils`, `php`, `php-curl`, `php-xml`.
		- Configuration du fichier `/etc/host.conf`.
		- Configuration du nom d'hôte et des entrées dans `/etc/hosts`.
		- Installation et configuration de `postfix` pour le courrier électronique.
		- Installation et configuration de `dovecot` pour les services IMAP.
		- Installation d'Apache pour la messagerie web.
		- Redémarrage de la machine après l'installation des composants.

5. **Configuration services Web :**
   	- RainLoop, une interface web pour la messagerie, est installé.
	- Connecter vous en admin (user "admin", mdp "12345" par default) sur la page web (http://IP_Address:8081/?admin) 
   		- Allez dans Domaine puis "add Domain".
   			- On ajoute le domaines (ici syssko.iut)
   			- Dans la zone IMAP on met l'ip du server (10.10.10.10) et on coche la case "Utiliser l'identifiant court"
   			- Dans la zone SMTP on fait la meme chose que dans IMAP
   			![config du domaine](equipe-b/doc/images/conf-mail.png)
