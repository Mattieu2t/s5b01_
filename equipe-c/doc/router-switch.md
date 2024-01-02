# Routeur et Commutateur


## Introduction 

Sur notre infrastructure nous avons deux routeur.   
Le routeur 1 est relié au routeur 2 et au reseau privé.  
Le routeur 2 est relié a la FAI, au reseau public et au routeur 1.  
Pour pouvoir intéragir avec le routeur il faut un minimum de connaisance des commandes. 

## Connection

Pour pouvoir accedé au routeur il faut ce connecté un l'un de nos ordinateur qui dispose d'un cable 'console', ce cable permet la liaison entre l'ordinateur (douglas) et le routeur ou le commutateur.

Ce sont les ordinateur douglas13 et 15 qui dispose de cable console.  
Donc branché l'un des deux cables sur le routeur et le commutateur de votre choix et connecté vous sur douglas 13 ou 15 avec cette commande : **`ssh cisco@douglasXX`**. (user et mdp -> cisco)

Une fois connecter vous trouverer ceci :

    cisco@douglasXX:~$

Pour accedé a la console il faut lancé la commande **`minicom`**, après avoir lancé la commande vous trouverez ceci : 

```
Welcome to minicom 2.8

OPTIONS: I18n
Port /dev/ttyS0, 13:45:46

Press CTRL-A Z for help on special keys
```
Une fois sur cette interface appuiez plusieurs fois sur la touche "**ENTRER**" pour avoir ceci :
```
R1>
```
Maintenant que vous avez acces au routeu ou commutateur voici les commandes a connaitre.
## Les commandes

Commandes pour changer de mode d’exécution et de conﬁguration : 
```
Router> enable
Router# configure terminal
Router(config)#
Router(config)# exit
Router# disable
Router>
```

**`enable`** : Permet de passer en root sur le router et faire des commande tel que :

- Router# copy running-config startup-config  
**(copie la configuration actuelle sur la configuration de lancement)**

- Router# show running-config   
**(montre la configuration qui est lancé sur le routeur ou commutateur)**

- Router# ping gnu.org  
**(ping une ip machine)**  

- Router# disable  
**(Permet de retourné en mode d'éxécution qui n'est pas root)**


**`configure terminal`** : Permet de passé en mode configuration sur le routeur ou le commutateur.  

Les commandes vu precédement lors du lancement de **`enable`** ne peu pas s'executé dans **`configure terminal`**.   
Pour executer des commandes dans **`configure terminal`** tel que "**show running-config**" ou "**ip address**" il faut rajouter au debut de la commande "**`do`**".  

Exemple :
- Router(config)# do show running-config

- Router(config)# do ip address

Pour quitter le mode configuration il faut lancer cette commande : **`exit`**  
Exemple : 

```
Router(config)# exit
Router#
```

Visualisation de l'equipenement et de la sauvegarde : 
```
Router# show version
Router# show interfaces
Router# show running-config
Router# show startup-config
Router# copy running-config startup-config
```

**`show`** : cette commande affiche ce qui lui donne en parametre.

Exemple : 
- Router# show interfaces  
Affiche les interfaces utilisé par le routeur/commutateur 

- Router# show version    
Affiche la version actuelle du routeur/commutateur

- Router# show running-config    
Afficher la configaration actuelle du routeur/commutateur

- Router# show startup-config   
Afficher la configaration lors du lancement du routeur/commutateur

**`copy`** : cette commande copie des fichier 

Exemple : 

- Router# copy running-config startup-config      
Copie le fichier de **configuartion actuelle** sur le fichier de **configuration de lancement** du routeur/commutateur  


**interface NOM-DE-L'INTERFACE** : Permet de creer/modifier une interface.

Exemple : 
```
Router(config)# interface FastEthernet0
Router(config-if)#
```
après avoir lancer cette commande :  **"interface FastEthernet0"**, vous avez ceci **"Router(config-if)#"**

Cela signifie que vous avez accès a l'interface "FastEthenet0"

## Configuration des routeur/commutateur
Pour la configuration des different routeur/commutateur vous pouvez les retrouver ici : 

- [Routeur1](../sauvegarde-routeur-commutateur/R1/r1-config-30-11-23)  
- [Routeur2](../sauvegarde-routeur-commutateur/R2/r2-config-30-11-23)  
- [Switch1](../sauvegarde-routeur-commutateur/S1/s1-config-01-12-23)  
- [Switch2](../sauvegarde-routeur-commutateur/S2/s2-config-01-12-23)  
- [Switch3](../sauvegarde-routeur-commutateur/S3/s3-config-01-12-23)  
- [Switch4](../sauvegarde-routeur-commutateur/S4/s4-config-15-12-23)  