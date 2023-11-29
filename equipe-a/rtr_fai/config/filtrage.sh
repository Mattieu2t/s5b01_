#/bin/bash

ufw allow 22 comment SSH_LOCAL
ufw allow 80 comment HTTP
ufw allow 443 comment HTTPS
ufw route allow in on eth1 out on eth0 to 0.0.0.0/0 port 80 from 10.10.10.0/24 comment HTTP_EXT
ufw route allow in on eth1 out on eth0 to 0.0.0.0/0 port 443 from 10.10.10.0/24 comment HTTPS_EXT
echo y|ufw enable
