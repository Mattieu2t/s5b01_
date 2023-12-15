#!/bin/sh
	# Mount les fichiers du fstab
#	sudo mount -t nfs 192.168.12.253:/home/ /home
	sudo mount /home
	sudo systemctl daemon-reload

	#### INSTALLATION DE LDAP ####
	sudo apt install -y libnss-ldapd ldap-utils
	sudo systemctl restart nslcd
	sudo systemctl restart nscd
