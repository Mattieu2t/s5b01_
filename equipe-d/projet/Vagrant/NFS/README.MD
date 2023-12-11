# Serveur NFS

Le serveur NFS nous serviras à stocker les fichiers des utilisateurs. Chaque utilisateur disposera d'un dossier de session qui lui sera propre et qui sera créé la première fois qu'il se connecte au serveur LDAP. 

Nous avons décidé que les dossiers de session seront stockés dans le repertoire `/home/` de la machine. 

Le serveur NFS sera disponible sur la plage d'adresse `192.168.0.0/16`.


Vérifier que le partage est fonctionel : 

    $ exportfs

