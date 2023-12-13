@augustin Beeuwsaert

### Serveur LDAP

Voici la procédure complète pour l'installation du serveur WEB. Suivez attentivement ces étapes pour garantir une mise en place efficace.

# 1 Mise en place de la machine 

Accédez au répertoire /Web et exécutez la commande suivante :

Accédez au répertoire /Ldap et exécutez la commande suivante :

```
vagrant up 
```
Une fois les machines mises en place, connectez-vous au serveur : 

```
vagrant ssh web
```
Vous êtes désormais connecté à la machine web, votre serveur web est près a fonctionner.

Pour vérifier rendez vous sur un navigateur web et taper la l'adresse suivante :

```
http://localhost/8086
```

Vous aurez une page sensiblement similaire a celle-ci :

![Serveur Web](/equipe-d/projet/Vagrant/Web/img/1.png "wizard ldap")

Vous êtes maintenant connecté à votre serveur web techtonic !