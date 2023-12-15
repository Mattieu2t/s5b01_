#/bin/bash

ufw allow 22 comment SSH_LOCAL
ufw allow 80 comment HTTP
ufw allow 443 comment HTTPS
ufw route allow in on eth1 out on eth1 from 10.10.10.0/24 comment PUBLIC
ufw route allow in on eth1 out on eth0 to 0.0.0.0/0 port 80 from 10.10.10.0/24 comment HTTP_EXT
ufw route allow in on eth1 out on eth0 to 0.0.0.0/0 port 443 from 10.10.10.0/24 comment HTTPS_EXT
ufw route allow in on eth1 out on eth0 to 9.9.9.9 port 53 from 10.10.10.3 comment DNS_RECURSIF
ufw route allow in on eth1 out on eth0 to 9.9.9.9 port 53 from 10.10.10.2 comment DNS_RECURSIF
#ufw route allow in on eth1 out on eth1 to 10.10.10.2/32 port 53 from 10.10.10.0/24 comment NS2
echo y|ufw enable
