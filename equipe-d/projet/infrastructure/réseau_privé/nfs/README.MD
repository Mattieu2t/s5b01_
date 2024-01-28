### Serveur NFS

Le serveur NFS nous serviras à stocker les fichiers des utilisateurs. Chaque utilisateur disposera d'un dossier de session qui lui sera propre et qui sera créé la première fois qu'il se connecte au serveur LDAP. 

Nous avons décidé que les dossiers de session seront stockés dans le repertoire `/home/` de la machine. 

Le serveur NFS sera disponible sur la plage d'adresse `192.168.0.0/16`.

Voici la procédure complète pour l'installation du serveur NFS. Suivez attentivement ces étapes pour garantir une mise en place efficace.

# 1 Mise en place de la machine 

Accédez au répertoire /NFS et exécutez la commande suivante :

```
vagrant up 
```
Une fois les machines mises en place, connectez-vous au serveur : 

```
vagrant ssh nfs
```
Vous êtes désormais connecté à la machine nfs, votre serveur web est près a fonctionner.

# 2 Configuration 

Pour partager le répertoire /home avec l'adresse IP range 192.168.0.0/16, ajoutez la règle suivante dans le fichier /etc/exports : 

```
$ echo "/home/ 192.168.0.0/16(rw,sync,subtree_check)" >> /etc/exports
```

Après avoir ajouté la règle d'exportation, utilisez la commande suivante pour appliquer les changements. Cela exporte tous les systèmes de fichiers listés dans /etc/exports.

```
sudo exportfs -a
```

Changez les permissions du répertoire /home pour permettre un accès approprié. Cela donne des droits en lecture, écriture et exécution pour le propriétaire et le groupe, et la permission en lecture et exécution pour les autres. 

```
sudo chmod 757 /home
```

Pour s'assurer que les modifications sont prises en compte, rechargez le service NFS Kernel Server. Cela permet au serveur NFS de reconnaître les nouvelles configurations sans redémarrer le service.

```
sudo service nfs-kernel-server reload
```

# 3 Montage du partage sur la machine cliente 

Assurez-vous que le paquet nfs-common est installé sur la machine cliente. Vous pouvez l'installer avec la commande suivante (si ce n'est pas déjà fait) :

```
sudo apt-get install nfs-common
```

Pour accéder au partage NFS sur la machine cliente, vous devrez monter le partage. Voici comment vous pouvez le faire :

```
sudo mount -t nfs 192.168.12.253:/home /mnt/nfs
```

# 4 Vérification 

Pour vérifier que le partage est fonctionel : 

```
$ exportfs
```