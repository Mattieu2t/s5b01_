#/bin/bash

# Autoriser les connections SSH HTTP et HTTPS
ufw allow 22 comment SSH_LOCAL
ufw allow 80 comment HTTP
ufw allow 443 comment HTTPS

# Autorise toutes les connections depuis toutes les baies vers les autres baies
ufw route allow in on eth1 out on eth1 from 10.10.10.0/24 comment PUBLIC

# Autorise toutes les baies à faire des requêtes web vers l'extérieur
ufw route allow in on eth1 out on eth0 to 0.0.0.0/0 port 80 from 10.10.10.0/24 comment HTTP_EXT
ufw route allow in on eth1 out on eth0 to 0.0.0.0/0 port 443 from 10.10.10.0/24 comment HTTPS_EXT

# Autorise notre serveur DNS à faire les requêtes vers un DNS extérieur (ici 9.9.9.9) pour les addresses extérieures
ufw route allow in on eth1 out on eth0 to 9.9.9.9 port 53 from 10.10.10.3 comment DNS_RECURSIF
ufw route allow in on eth1 out on eth0 to 9.9.9.9 port 53 from 10.10.10.2 comment DNS_RECURSIF

echo y|ufw enable
