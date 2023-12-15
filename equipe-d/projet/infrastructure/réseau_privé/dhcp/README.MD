# Le serveur DHCP

* __IP du serveur :__ `192.168.12.254`
* __Zone 1 :__ 
    
    Range IP : `192.168.12.20` > `192.168.12.200` 

    IP Routeur Zone 1 : `192.168.12.1` 
* __Zone 2 :__ 

    Range IP : `192.168.13.20` > `192.168.13.200` 
    
    IP Routeur Zone 2 : `192.168.13.1` 
* __Zone 3 :__ 

    Range IP : `192.168.14.20` > `192.168.14.200` 

    IP Routeur Zone 3 : `192.168.14.1` 

----

Le paquet debian du serveur se nomme : `isc-dhcp-server`. Nous devons dans un premier temps lui attribuer une interface réseau sur laquelle il doit communiquer.

Le serveur DHCP possède une IP fixe étant : `192.168.12.254`

Nous avons configuré le serveur DHCP pour qu'il fonctionne sur 3 zones. Ces 3 zones étants les 3 réseaux respectives demandées dans le sujet. 

L'attribution des IPs se fait dans la range `192.168` avec les troisième bit suivants : `.12.0`, `.13.0`, `.14.0` 



