# Serveur Mail


## Introduction 

Mise en place d'un service de mail avec Postfix et RainLoop et DoveCot sur un raspberry sous raspbian. 
Postfix sera configuré en tant que serveur SMTP, Dovecot pour la sauvegarde des mails et RainLoop sera utilisé comme client webmail.

## Pré-requis  
- Apache2 
- MariaDB
- PHP 8.2
- Postfix & dovecot & Rainloop
- Sous domaine ``mail.capsule.iut`` configuré

## Source
Tutoriel : https://neptunet.fr/messagerie-debian/

## Aperçu
### Site Web (Apache2)
![image](https://media.discordapp.net/attachments/687337171434078244/1184872900692557874/Capture_du_2023-12-14_11-20-41.png)

### Mail - Panel de gestion (postfixadmin)
![image](https://media.discordapp.net/attachments/687337171434078244/1184872899765616660/Capture_du_2023-12-14_11-35-26.png)
![image](https://media.discordapp.net/attachments/687337171434078244/1184872899509768302/Capture_du_2023-12-14_11-35-46.png)

### Mail - Gestion utilisateur (rainloop)

![image](https://media.discordapp.net/attachments/687337171434078244/1184872900268937296/Capture_du_2023-12-14_11-34-34.png)
![image](https://media.discordapp.net/attachments/687337171434078244/1184872900025659523/Capture_du_2023-12-14_11-35-01.png)



## 1. Installation des paquets et préparation du système

Commencez par mettre à jour le système et installer les services de base de la pile LAMP (Linux Apache Mysql PHP), ainsi que d'autres dépendances et utilitaires nécessaires :

```sh
apt-get update && apt-get upgrade -y
apt-get install apache2 mariadb-server php8.2 -y
apt-get install php8.2-mysql php8.2-mbstring php8.2-imap php8.2-xml php8.2-curl -y
service apache2 restart
apt-get install tree mailutils -y
apt-get install postfix postfix-mysql -y
apt-get install dovecot-mysql dovecot-pop3d dovecot-imapd dovecot-managesieved -y
```

## 2. Configuration de la base de données

Sécurisez MySQL en définissant un mot de passe pour le compte root :

```sh
mysql_secure_installation
```

Créez une base de données, des utilisateurs et définissez les privilèges nécessaires :

```sql
mariadb -u root -p
CREATE DATABASE postfix;
CREATE USER 'postfix'@'localhost' IDENTIFIED BY 'toto123';
GRANT ALL PRIVILEGES ON `postfix`.* TO 'postfix'@'localhost';
CREATE USER 'mailuser'@'localhost' IDENTIFIED BY 'toto123';
GRANT SELECT ON `postfix`.* TO 'mailuser'@'localhost';
FLUSH PRIVILEGES;
QUIT;
```

## 3. Installation et configuration de Postfixadmin

Installez Postfixadmin, configurez la base de données, et préparez le dossier nécessaire :

```sh
cd /srv/
wget -O postfixadmin.tgz https://github.com/postfixadmin/postfixadmin/archive/postfixadmin-3.3.13.tar.gz
tar -zxvf postfixadmin.tgz
mv postfixadmin-postfixadmin-3.2 postfixadmin
ln -s /srv/postfixadmin/public /var/www/html/postfixadmin
```

Configurez Postfixadmin en éditant le fichier `config.local.php` :

```sh
nano /srv/postfixadmin/config.local.php
```

Ajoutez le contenu suivant, en remplaçant les valeurs appropriées :

```php
<?php
$CONF['database_type'] = 'mysqli';
$CONF['database_host'] = 'localhost';
$CONF['database_name'] = 'postfix';
$CONF['database_user'] = 'postfix';
$CONF['database_password'] = 'toto123';
$CONF['configured'] = true;
?>
```

Créez un dossier nécessaire pour Postfixadmin :

```sh
mkdir -p /srv/postfixadmin/templates_c
chown -R www-data /srv/postfixadmin/templates_c
```

Accédez à l'interface web de Postfixadmin pour terminer la configuration : `http://capsule.iut/postfixadmin/login.php`

## 4. Configuration de Postfix

Configurez Postfix en liant la base de données pour la gestion des domaines et des boîtes aux lettres :

```sh
nano /etc/postfix/mysql-virtual-mailbox-domains.cf
```

Ajoutez le contenu suivant :

```conf
user = mailuser
password = toto123
hosts = 127.0.0.1
dbname = postfix
query = SELECT 1 FROM domain where domain='%s'
```

Activez la configuration :

```sh
postconf -e virtual_mailbox_domains=mysql:/etc/postfix/mysql-virtual-mailbox-domains.cf
```

Répétez le processus pour la configuration des boîtes aux lettres :

```sh
nano /etc/postfix/mysql-virtual-mailbox-maps.cf
```

Ajoutez le contenu suivant :

```conf
user = mailuser
password = toto123
hosts = 127.0.0.1
dbname = postfix
query = SELECT 1 FROM mailbox where username='%s'
```

Activez la configuration :

```sh
postconf -e virtual_mailbox_maps=mysql:/etc/postfix/mysql-virtual-mailbox-maps.cf
```

Redémarrez Postfix :

```sh
service postfix restart
```

## 5. Configuration de Dovecot

Configurez Dovecot en éditant les fichiers de configuration appropriés :

```sh
nano /etc/dovecot/conf.d/10-auth.conf
nano /etc/dovecot/conf.d/auth-sql.conf.ext
nano /etc/dovecot/conf.d/10-mail.conf
nano /etc/dovecot/conf.d/10-master.conf
nano /etc/dovecot/dovecot-sql.conf.ext
```

Suivez les instructions pour chaque fichier dans la procédure originale.

Redémarrez Dovecot :

```sh
service dovecot restart
```

## 6. Mise en place de la liaison Postfix <-> Dovecot

Ajoutez les lignes suivantes à la fin du fichier `/etc/postfix/master.cf` :

```conf
dovecot unix - n n - - pipe
  flags=DRhu user=vmail:vmail argv=/usr/lib/dovecot/dovecot-lda -f ${sender} -d ${recipient}
```

Redémarrez Postfix :

```sh
service postfix restart
```

Appliquez les modifications :

```sh
postconf -e virtual_transport=dovecot
postconf -e dovecot_destination_recipient_limit=1
```

## 7. Installation et configuration de Rainloop

Installez Rainloop dans le répertoire web approprié :

```sh
mkdir /var/www/html/rainloop
cd /var/www/html/rainloop
wget -qO- https://repository.rainloop.net/installer.php | php
```

Appliquez les droits nécessaires :

```sh
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
chown -R www-data:www-data .
```

Créez un fichier de configuration Apache pour Rainloop :

```sh
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/rainloop.conf
```

Éditez `rainloop.conf` pour définir le bon `DocumentRoot` :

```sh
nano /etc/apache2/sites-available/rainloop.conf
```

Activez le site et redémarrez Apache :

```sh
a2ensite rainloop.conf
service apache2 restart
```

Accédez à l'interface d'administration Rainloop et configurez le domaine :

```sh
http://capsule.iut/rainloop
```