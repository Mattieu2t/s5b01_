# Configuration DNS pour techtonic.iut

Détails sur la configuration DNS pour le domain "techtonic.iut".

## Configuration de la clé d'authentification

La configuration commence par la définition d'une clé d'authentification nommée "ma_cle" utilisant l'algorithme HMAC-MD5. Assurez-vous de conserver en lieu sûr la valeur de la clé secrète.

```bind
key "ma_cle" {
    algorithm hmac-md5;
    secret "T8IPu5PsyOAadgsHF1Vf1Q==";
};
```

## Configuration des zones

Ensuite, plusieurs zones sont définies, chacune avec une configuration spécifique.

### Zone "techtonic.iut"

La zone principale "techtonic.iut" est configurée en tant que zone maître ("master") avec un fichier de zone situé à "/etc/bind/zones/techtonic.iut". Les mises à jour de cette zone sont autorisées uniquement avec la clé "ma_cle".

```bind
zone "techtonic.iut" {
    type master;
    file "/etc/bind/zones/techtonic.iut";
    allow-update { key "ma_cle"; };
};
```

### Zone "10.10.10.in-addr.arpa"

Une zone de renversement d'adresse ("reverse zone") pour le sous-réseau 10.10.10.0 est définie de manière similaire, avec le fichier de zone à "/etc/bind/zones/techtonic.rev.iut".

```bind
zone "10.10.10.in-addr.arpa" {
    type master;
    file "/etc/bind/zones/techtonic.rev.iut";
    allow-update { key "ma_cle"; };
};
```

### Zones "12.168.192.in-addr.arpa", "13.168.192.in-addr.arpa", "14.168.192.in-addr.arpa"

Trois zones de renversement d'adresse supplémentaires sont définies pour les sous-réseaux 192.168.12.0, 192.168.13.0, et 192.168.14.0. Chacune utilise un fichier de zone spécifique et autorise les mises à jour uniquement avec la clé "ma_cle".

```bind
zone "12.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/zones/informatique.techtonic.iut";
    allow-update { key "ma_cle"; };
};

zone "13.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/zones/administration.techtonic.iut";
    allow-update { key "ma_cle"; };
};

zone "14.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/zones/production.techtonic.iut";
    allow-update { key "ma_cle"; };
};
```