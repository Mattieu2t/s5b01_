# Configuration des routeurs :

## Configuration du routeur R1 :

1. **`R1>enable`** : Active le mode privilégié.

2. **`R1#configure terminal`** : Accède au mode de configuration globale du routeur R1.

3. **`R1(conf)#interface vlan10`** : Configuration des paramètres pour l'interface virtuelle (VLAN) 10.

4. **`R1(conf-if)#ip address 10.10.10.25 255.255.255.248`** : Attribue manuellement une adresse IP statique (10.10.10.25 avec un masque de sous-réseau de 255.255.255.248) à l'interface VLAN 10.

5. **`R1(conf-if)#exit`** : Quitte le mode de configuration de l'interface spécifique (VLAN 10) pour revenir au mode de configuration globale.

6. **`R1(conf)#interface vlan40`** : Configuration de l'interface virtuelle (VLAN) 40.

7. **`R1(conf-if)#ip address dhcp`** : Obtient dynamiquement une adresse IP pour l'interface VLAN 40 via le protocole DHCP.

8. **`R1(conf)#interface Fastinternet0`** : Configuration des paramètres pour l'interface FastEthernet0.

9. **`R1(conf-if)#switchport access vlan 10`** : Configure l'interface FastEthernet0 pour utiliser le VLAN 10 en mode d'accès.

10. **`R1(conf)#interface Fastinternet1`** : Configuration des paramètres pour l'interface FastEthernet1.

11. **`R1(conf-if)#switchport access vlan 40`** : Configure l'interface FastEthernet1 pour utiliser le VLAN 40 en mode d'accès.

12. **`R1(conf-if)#exit`** : Quitte le mode de configuration de l'interface spécifique pour revenir au mode de configuration globale.

13. **`R1(conf)#interface Fasteternet4`** : Configuration des paramètres pour l'interface FastEthernet4

14. **`R1(conf-if)#ip address dhcp`** : Obtient dynamiquement une adresse IP pour l'interface FastEthernet4 via le protocole DHCP.

## Configuration du routeur R2 :

1. **`R2>enable`** : Active le mode privilégié.

2. **`R2#configure terminal`** : Accède au mode de configuration globale du routeur R1.

3. **`R2(conf)#interface vlan10`** : Configuration des paramètres pour l'interface virtuelle (VLAN) 10.

4. **`R2(conf-if)#ip address 10.10.10.25 255.255.255.248`** : Attribue manuellement une adresse IP statique (10.10.10.25 avec un masque de sous-réseau de 255.255.255.248) à l'interface VLAN 10.

5. **`R2(conf-if)#exit`** : Quitte le mode de configuration de l'interface spécifique (VLAN 10) pour revenir au mode de configuration globale.

6. **`R2(conf)#interface vlan40`** : Configuration de l'interface virtuelle (VLAN) 40.

7. **`R2(conf-if)#ip address dhcp`** : Obtient dynamiquement une adresse IP pour l'interface VLAN 40 via le protocole DHCP.

8. **`R2(conf)#interface Fastinternet0`** : Configuration des paramètres pour l'interface FastEthernet0.

9. **`R2(conf-if)#switchport access vlan 10`** : Configure l'interface FastEthernet0 pour utiliser le VLAN 10 en mode d'accès.

10. **`R2(conf)#interface Fastinternet1`** : Configuration des paramètres pour l'interface FastEthernet1.

11. **`R2(conf-if)#switchport access vlan 40`** : Configure l'interface FastEthernet1 pour utiliser le VLAN 40 en mode d'accès.

12. **`R2(conf-if)#exit`** : Quitte le mode de configuration de l'interface spécifique pour revenir au mode de configuration globale.

13. **`R2(conf)#interface Fasteternet4`** : Configuration des paramètres pour l'interface FastEthernet4

14. **`R2(conf-if)#ip address dhcp`** : Obtient dynamiquement une adresse IP pour l'interface FastEthernet4 via le protocole DHCP.