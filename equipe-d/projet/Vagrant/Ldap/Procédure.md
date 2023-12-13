@augustin Beeuwsaert

### Serveur LDAP

Voici la procédure complète pour l'installation du serveur LDAP ainsi que la configuration du poste client. Suivez attentivement ces étapes pour garantir une mise en place efficace.


# 1 Mise en place des machines 

Accédez au répertoire /Ldap et exécutez la commande suivante :

```
vagrant up 
```
Une fois les machines mises en place, connectez-vous au serveur : 

```
vagrant ssh ldap
```
Vous êtes désormais connecté à la machine LDAP, qui abritera notre serveur ! 

# 2 Instalation du serveur ldap  
Dirigez-vous vers le dossier /conf et lancez le script **conf.sh** avec la commande suivante :

```
sh conf.sh
```
Suivez attentivement les étapes du script. Au début, on vous demandera un mot de passe root. Laissez les champs vides.

Au début on nous demande un mot de passe root. Laissez les camps vide. 

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/1.png "wizard ldap")

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/2.png "wizard ldap")

Indiquez le nom de domaine de votre organisation, par exemple, **techtonic.iut**.

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/3.png "wizard ldap")

Spécifiez le nom de votre organisation, ici **techtonic**.

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/4.png "wizard ldap")

 Entrez le mot de passe root pour le serveur LDAP.
 
![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/5.png "wizard ldap")

Suivez ensuite les étapes comme illustré ci-dessous :

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/6.png "wizard ldap")

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/7.png "wizard ldap")

Ajoutez les utilisateurs : 

![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/8.png "wizard ldap")

Vous avez maintenant installé le serveur LDAP avec succès !

# 3 Installation du poste client ldap  

Connectez-vous à votre machine cliente :

```
vagrant ssh client
```
Ensuite, installez les clients LDAP :

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

# 4 Connexion à un utilisateur depuis un poste client 

Pour vous connecter à un utilisateur depuis un poste client, exécutez la commande suivante :

```
su - {nom de l'utilisateur}
```
![Texte alternatif](/equipe-d/projet/Vagrant/Ldap/img/13.png "wizard ldap")

Vous êtes maintenant connecté à votre utilisateur présent sur le serveur LDAP ! Vous pouvez constater que l'utilisateur possède bien un répertoire **/home/user** lors de la création de la session.
