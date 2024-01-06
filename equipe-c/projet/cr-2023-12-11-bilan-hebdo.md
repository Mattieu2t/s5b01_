# Bilan Hebdomadaire

## Bilan semaine 50

Coordinateur : Benoit Dessaint

Cette semaine étant la dernière semaine du projet, nous avons fait tout notre possible afin de terminer l'infrastructure demandée. Nous disposons de tous les services requis à l'exception du Firewall qui n'a pas pu être finalisé. 


Cédric Larsonnier a réalisé des scripts pour automatiser le déploiement de l'infrastructe depuis une seule machine, il a également essayé de mettre en place le pare-feu et a participé à la mise en place des clients.

Jugurtha Saada a mis en place le serveur mail ainsi que le serveur web sur une raspberry. Il a également essayé de mettre en place le pare feu avec Cédric et a mis en place un proxy Nginx, nous avons ensuite décider de changer pour utiliser Squid.

Jugurtha Saada et Cédric Larsonnier ont également réalisés des ajustements sur le réseau afin de convenir aux nouveaux besoins.

Younes Bendhiab a mis en place le serveur LDAP, et a réussi à le faire comminiquer avec des clients distants. Il a également mis en place le serveur NFS. Finalement, il a automatisé la création des clients et des serveurs sur lesquels il a travaillé.


Benoit Dessaint a terminé la mise en place du DNS et du DHCP en rendant celle ci automatique (un simple Vagrant up suffit), il à également aidé Younes à la mise en place du serveur LDAP et du serveur NFS. Etant le coordinateur, il a aidé le groupe FAI sur diverses sujets, nottament la communication entre les DNS afin de permettre à toutes les entreprises d'avoir accès à internet en passant par le serveur DNS du FAI. Il a aussi donné des indications pour mettre en place le serveur LDAP du côté FAI. Finalement il a mis en place le serveur proxy avec Squid ainsi que les machines clientes. 


Points bloquants : 

- Impossibilité de créer des machines Vagrant sur Douglas13 (interruption au milieu du vagrant up)
- Problèmes de droits pour créer le home directory des utilisateurs depuis les machines clientes (il faut donc se connecter une première fois avec l'utilisateur sur le serveur NFS pour que son home directory soit créé).
- Mise en place du pare-feu
- Communication au sein de l'équipe : Nous étions parfois dans des salles différentes et nous réalisions les mêmes tâches sans le savoir.
- Par fois les machines douglas (surtout Douglas14) n'ont plus de configuration DNS.
