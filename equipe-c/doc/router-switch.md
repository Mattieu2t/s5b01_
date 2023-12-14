# Router/Switch


## Introduction 

Sur notre infrastructure nous avons deux routeur.   
Le routeur 1 est relié au routeur 2 et au reseau privé.  
Le routeur 2 est relié a la FAI, au reseau public et au routeur 1.  
Pour pouvoir intéragir avec le routeur il faut un minimum de connaisance des commandes. 

## Connection

Pour pouvoir accedé au routeur il faut ce connecté un l'un de nos ordinateur qui dispose d'un cable 'console', ce cable permet la liaison entre l'ordinateur (douglas) et le routeur ou le switch.

Ce sont les ordinateur douglas13 et 15 qui dispose de cable console.  
Donc branché l'un des deux cables sur le routeur et le switch de votre choix et connecté vous sur douglas 13 ou 15 avec cette commande : **`ssh cisco@douglasXX`**. (user et mdp -> cisco)

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
Maintenant que vous avez acces au routeu ou switch voici les commandes a connaitre.
## Les commandes

**enable** : Permet de passer en root sur le router et faire des commande tel que :
- copy running-config startup-config  
**(copie la configuration actuelle sur la configuration de lancement)**
- show running-config   
**(montre la configuration qui est lancé sur le routeur ou switch)**
- ping gnu.org  
**(ping une ip machine)**   

Ces commandes peu ce realisé seullemnt en tant que root juste après avoir lancé la commande **`enable`**


**configure terminal** : Permet de passé en mode configuration sur le routeur ou le switch.  

Les commandes vu precédement lors du lancement de **`enable`** ne peu pas s'executé dans **`configure terminal`**.   
Pour executer des commandes dans **`configure terminal`** tel que "**show running-config**" ou "**ip address**" il faut rajouter au debut de la commande "**`do`**".  
Exemple :  
- **do show running-config**  
- **do ip address**


**interface NOM-DE-L'INTERFACE** : Permet de creer/modifier une interface.  