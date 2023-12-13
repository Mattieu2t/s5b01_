@augustin Beeuwsaert

### Serveur DHCP 

# 1 Mise en place de la machine 

Accédez au répertoire /DNS et exécutez la commande suivante :

```
vagrant up 
```
Une fois les machines mises en place, connectez-vous à la machine  : 

```
vagrant ssh srvpub
```
Vous êtes désormais connecté à la machine dhcp, votre dhcp est près a fonctionner.

# 2 Configuration 

La machine virtuelle est nommée "srvpub". Elle est configurée avec une adresse IP statique 10.10.10.18 sur une interface réseau public.