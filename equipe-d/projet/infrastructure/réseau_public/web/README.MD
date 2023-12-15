# Serveur Web

Voici la procédure complète pour l'installation du serveur WEB. Suivez attentivement ces étapes pour garantir une mise en place efficace.
Le serveur est un serveur tournant sous apache2. Nous utilisons dans notre cas le dossier d'hébergement fournit par apache se situant dans `/var/www/html/` pour monter notre page à la racine du serveur.

La configuration vagrant est simple, nous lui donnons une IP, l'installation de apache se fait puis nous remplacons la page `index.html` generique de apache2 par notre page d'accueil. Ici le but est de montrer que notre serveur est bien en ligne. Notre page d'accueil ne comporte auncun élements particuliers. 

Vous aurez une page sensiblement similaire a celle-ci :

![Serveur Web](./img/1.png "Page d'accueil")
