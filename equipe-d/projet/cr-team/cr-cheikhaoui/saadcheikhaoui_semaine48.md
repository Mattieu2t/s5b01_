---
title: SAÉ 5B.01 - Saad Cheikhaoui
subtitle: Equipe D - TechTonic
---

# Semaine 48 (27/11 au 01/12)

## Début de la mise en place du DNS avec Bind9.

Au début de la semaine, nous avons entamé le processus de mise en place du DNS en utilisant Bind9. Cette étape a été essentielle pour établir la résolution de noms au sein de notre infrastructure. Cependant, en raison de la non-configuration du DHCP, les tests n'ont pas encore été effectués, et nous avons conscience que le DNS ne sera pleinement opérationnel qu'après la résolution de ce prérequis.

## Configuration DHCP avec Vlans + configuration BIND9 + Tests DHCP.

Un défi majeur est survenu lors de la configuration du DHCP avec Vlans, conjointement à la configuration de BIND9. Nous avons rencontré des difficultés avec le routeur qui refusait les adresses IP dans la plage 172.16. Cela a nécessité une analyse approfondie des paramètres de configuration du routeur et des Vlans. Malgré ces obstacles, nous avons persévéré et entrepris des tests DHCP pour évaluer la fonctionnalité du système, même si les résultats n'étaient pas encore optimaux.

## Configuration du DHCP (fonctionnel).

Suite aux difficultés rencontrées précédemment, nous avons décidé de reconfigurer le DHCP en utilisant des adresses IP dans la plage 192.168. Cette démarche a résolu les problèmes liés au routeur et a permis d'obtenir un DHCP pleinement fonctionnel. Cette étape a démontré notre capacité à surmonter les obstacles et à ajuster la configuration pour assurer la stabilité et la performance de notre infrastructure réseau.

## Configuration et test DNS bind9

Mise en place de la configuration de bind9 avec quelques problèmes.
Pas encore fonctionnel a 100%.
