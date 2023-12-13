@augustin Beeuwsaert

### Serveur LDAP

Voici la procédure pour réaliser l'instalation du serveur LDAP ainsi que le poste client
Suivez bien la procédure étape par étape.


# 1 Mise en place des machines 

Ce rendre dans le dossier /Ldap et tapez la commande suivante :

```
vagrant up 
```
Une fois les machines mise en place, on peut ce connecter au serveur : 

```
vagrant ssh ldap
```
Vous etes maintenant connecter a la machine ldap qui va contenir notre serveur ! 

# 2 Instalation du serveur ldap  
Une fois sur celle ci rendez-vous dans le dossier /conf et lancer le script **conf.sh** avec la commande suivant :

```
sh conf.sh
```
Une fois le script lancer suivez attentivement les étapes qui vont suivre. 

Au début on nous demande un mot de passe root. Laissez les camps vide. 

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/1.png "wizard ldap")

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/2.png "wizard ldap")

Mettez le nom de domaine de votre organisation. Ici c'est **techtonic.iut**

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/3.png "wizard ldap")

Mettez le nom de votre organisation. Ici **techtonic**

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/4.png "wizard ldap")

 Entrez le mot de passe root pour le serveur LDAP
 
![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/5.png "wizard ldap")

Puis ensuite suivez les étapes comme ci dessous :

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/6.png "wizard ldap")

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/7.png "wizard ldap")

Ajouter les utilisateurs : 

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/8.png "wizard ldap")

Voila vous avez installer le serveur ldap !

# 3 Instalation du poste client ldap  

Connectez vous a votre machine cliente 

```
vagrant ssh client
```
Une fois cela fait il va faloir instaler les clients ldap :

```
sudo apt install libnss-ldap libpam-ldap ldap-utils 
```
Configurez l'URI de votre serveur LDAP. Le format du serveur est également affiché dans l'image suivante. Ensuite, appuyez sur la touche Entrée pour passer à la configuration suivante.

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/9.png "wizard ldap")

Vous allez maintenant définir un nom distinct pour la base de recherche LDAP. Un exemple est présenté dans l'image ci-dessous. Ensuite, appuyez sur la touche Entrée pour passer à l'écran suivant.

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/10.png "wizard ldap")

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/11.png "wizard ldap")

Ensuite, configurez votre système Debian 10 pour utiliser LDAP pour l'authentification. Pour ce faire, mettez à jour les configurations PAM en exécutant la commande suivante :
```
sudo pam-auth-update
```

Cette commande affichera une boîte de dialogue sur votre écran à partir de laquelle vous pourrez sélectionner les profils souhaités que vous souhaitez activer.

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/12.png "wizard ldap")

Redémarez le service : 

```
sudo systemctl restart nscd.service
```

# 4 Connection à un utilisatuer depuis un poste client 

Pour vous connecter a un utilisateur depuis un poste client, vous devez réaliser la comande suivante 
: 

```
su - {nom de l'utilisateur}
```
![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/13.png "wizard ldap")

Voila vous etes connecter a votre utilisateur présent sur le serveur ldap ! 
On peut bien voir que l'utilisateur possède bien un **/home/user** a la création de la session. 
