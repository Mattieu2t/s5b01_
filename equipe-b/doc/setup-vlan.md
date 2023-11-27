## Potentielle procédure pour setup les VLAN : 
(Fonctionnement à vérifier)

```
minicom
enable
configure terminal
interface Fa0
switchport mode access
switchport access vlan 10
interface Vlan10
name prod
ip address 10.14.0.1 255.255.255.224
no shutdown
end
write memory
```