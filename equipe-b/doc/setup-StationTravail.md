# Procédure pour setup les stations de travails :

Pour les station de travails il y a 5 VMs:
	- 2 pour l'Administration ( *fricadelle* et *hochepot* )
	- 2 pour la production ( *carbonadeFlamande* et *moulesFrites* )
	- 1 pour le service informaatique ( *welsh* )

### Configuration des Machines

La configuration des machines comprend les éléments suivants :

	1. *Définition de la Machine :* Nom de la machine 
	
	2. *Provider*
		- Les VM on le l'interface graphique d'activer
		- Il y a 2GB de RAM

	3. *Provisionnement :*
		- Exécution de commandes shell pour :
			- Mise à jour des paquets avec `apt-get update` et mise à niveau avec `apt-get -y upgrade`.
			- installation de l'environement graphique *XFCE* avec `apt install -y task-xfce-desktop`.
			- installation des logiciels *Firefox* et *Thunderbird* avec `apt-get install -y firefox-esr thunderbird`
