# Configuration poste client

La configuration du poste client se fait à l'aide de plusieurs scripts. 
En effet, il nous demandé dans un premier d'installer un __client mail__ ainsi qu'un __navigateur web__. 

Une fois ces deux logiciels installé nous configurons en lançant manuellement le script `config_ldap_nfs.sh` afin de configurer la connexion LDAP et la connexion au serveur NFS. 


# Procédures d'Installation - Client NFS

Les procédures d'installation ci-dessous se concentrent uniquement sur les logiciels nécessaires au client NFS. Les étapes sont décrites pour une distribution Debian.

## 1. Installation du Client NFS

### a. Mise à jour du système
```bash
sudo apt-get update -y
sudo apt-get upgrade -y
```

### b. Installation des Packages NFS et Autres
```bash
sudo apt-get install -y nfs-common
```

### c. Configuration du Montage NFS dans /etc/fstab
Ajoutez la configuration du montage NFS dans le fichier `/etc/fstab`.

Exemple de configuration pour monter le répertoire partagé du serveur NFS `192.168.12.253:/home` sur `/home` :
```bash
sudo echo "192.168.12.253:/home/    /home   nfs     rw,hard,intr      0       0" >> /etc/fstab
```

### d. Configuration des Routes Réseau
```bash
# Suppression de la route par défaut via l'interface eth0
sudo ip route del default via 10.0.2.2 dev eth0

# Ajout d'une nouvelle route par défaut via l'interface eth1
sudo ip route add default via 192.168.12.1 dev eth1
```

### e. Copie du Fichier resolv.conf
Copiez le fichier de configuration DNS `resolv.conf` depuis le répertoire approprié.

Exemple :
```bash
sudo cp /vagrant/resolv.conf /etc/
```

# Procédure d'Installation - LDAP

La procédure d'installation ci-dessous se concentre uniquement sur les logiciels nécessaires pour l'intégration LDAP. Les étapes sont décrites pour une distribution Debian.

## 1. Installation des Packages LDAP

### a. Installation des Packages
```bash
sudo apt-get update -y
sudo apt-get install -y libnss-ldapd ldap-utils
```

## 2. Redémarrage des Services

### a. Redémarrage du service nslcd
```bash
sudo systemctl restart nslcd
```

### b. Redémarrage du service nscd
```bash
sudo systemctl restart nscd
```

# Procédure d'Installation - Thunderbird avec Support de la Langue Française


### a. Mise à jour du système (si nécessaire)
```bash
sudo apt-get update -y
sudo apt-get upgrade -y
```

### b. Installation de Thunderbird et du Support de la Langue Française
```bash
sudo apt-get install -y thunderbird thunderbird-l10n-fr
```

Il suffit maintenant de configurer le serveur de mail à partir de la configuration mail `techtonic.iut`