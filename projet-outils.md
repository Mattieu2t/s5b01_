---
title: Produire et gérer du texte proprement
subtitle: documentation, présentation, gestion
author: Bruno BEAUFILS
---

# Introduction

- Lors des SAÉ (Situations d'Apprentissage et d'Évaluation) du
  parcours B *Déploiement d'applications communicantes et sécurisées*
  (i.e. infrastructures systèmes et réseaux) vous allez devoir
  **documenter** et **gérer** vos travaux, notamment :
    - en rédigeant des **procédures** de mise en place
    - en rédigeant des **comptes-rendus** des séances d'autonomie

- Ce travail devra **obligatoirement** être fait
    - via des fichiers textes au format **Markdown**
    - gérés dans un dépôt **Git**
    
- Lors des premières séances d'autonomie vous devez
    - vous **documenter** sur le fonctionnement de ces outils
    - vous **familiariser** à leur usage

- **La qualité de cette documentation sera une partie importante des évaluations**
  
- Ce document vous donne quelques bases et des liens pour vous aider

- Il est disponible en
  - [HTML](projet-outils.html)
  - [PDF](projet-outils.pdf)
  - Markdown dans [projet-outils.md](projet-outils.md) (pratique pour
    comparer source et résultats)


# Outils

## Les bases

- [**Markdown**](https://daringfireball.net/projects/markdown) est un
  langage de **balisage** *simple* de texte 
    - facile à lire et écrire par les humains et les programmes
    - qui permet de transformer un fichier balisé vers HTML ou PDF
      *automatiquement*
    - dont il existe plusieurs
      [variantes](https://flavoredmarkdown.com/)
    
- [**Pandoc**](https://pandoc.org) est un logiciel de **conversion**
  de documents
    - il permet de convertir des fichiers d'un format de balisage à un
      autre
    - [markup.rocks](https://markup.rocks) permet de manipuler du
      texte directement via Pandoc

- [**Git**](https://git-scm.com/) est un outil de **contrôle de
  version** distribué qui permet
    - de suivre l'historique des modifications d'un ensemble de
      fichiers
    - de gérer des versions différentes en parallèle
    - de travailler à plusieurs sur les mêmes fichiers
    - de mettre en place des modes de collaborations différents

## D'autres outils utiles

- [**Org mode**](https://orgmode.org) est un mode
  [Emacs](https://www.gnu.org/software/emacs/) pour l'édition de
  documents en texte simple pour :
    - prendre des notes,
    - gérer des listes de tâches
    - planifier des projets
    - rédiger des documents ou des calepins de calculs
    - faire de la programmation littéraire
    - publier sous divers formats (HTML, PDF, etc.)

- [**Mdoc**](https://manpages.bsd.lv/mdoc.html) est le language
  utilisé pour l'écriture de pages de manuel UNIX en texte simple
    - [man(7)](https://manpages.debian.org/man.7.html),
    - [mdoc(7)](https://manpages.debian.org/mdoc.7.html),
    - [groff(7)](https://manpages.debian.org/groff.7.html)


# Markdown

## Syntaxe générale

La syntaxe de Markdown permet 

- de donner une **structure** au document
    - **paragraphes** : séparation par des lignes vides
    - **titres de différents niveaux** : lignes débutant par des `#`
    - **listes libres** : indentation de paragraphe avec lignes débutant par des `-` ou des `*`
    - **listes ordonnées** : indentation avec lignes débutant par des `1.`
    - **blocs de citations** : paragraphes préfixés par "`> `"
    - **blocs de codes** : paragraphes indentés par 4 espaces

- d'inclure des éléments de mise en forme **logique**

    *emphase*, **accentuation forte** et `code`

- d'inclure des liens vers des URLs
    - <https://daringfireball.net/projects/markdown>
    - [CommonMark](https://commonmark.org)
    - [Markdown à la sauce Pandoc](https://pandoc.org/MANUAL.html#pandocs-markdown)
    - [Markdown à la sauce GitLab](https://gitlab.com/help/user/markdown.md)
    - [Markdown à la sauce Github](https://guides.github.com/features/mastering-markdown)

    
Elle est décrite en détails ailleurs (cf liens de cette diapo)

## Images

`![Texte alternatif pour HTML](https://www.lifl.fr/~beaufils/logos/logo-markdown.png){ width=50% }`

![Texte alternatif pour HTML](https://www.lifl.fr/~beaufils/logos/logo-markdown.png){ width=50% }

## Tableaux

- Plusieurs supports de tableaux accessibles via le [Markdown de
  pandoc](https://pandoc.org/MANUAL.html#tables)
- Celui utilisé par Gitlab et GitHub est très basique
    - défini par `pipe_tables` dans `pandoc`
    
| **Outil**  | **Utilité**                                                 |
|------------|-------------------------------------------------------------|
| `pandoc`   | conversion de formats                                       |
| `pdflatex` | composition de LaTeX en PDF                                 |
| `beamer`   | jeux de balisage LaTeX pour la composition de présentation  |

## Code source

Le code source peut être coloré en fonction de la syntaxe du language

```c
#include <stdio.h>
int main(int argc, char ** argv) {
    printf("Hello world !\n");
}
```


# pandoc

- [Pandoc](https://pandoc.org) est un logiciel de conversion de
  documents
    - il permet de convertir des fichiers d'un format de balisage à un
      autre
    - il définit une extension de Markdown : [Pandoc's
      Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown)
    - il est extensible via des [filtres lua](https://pandoc.org/lua-filters.html)
- Options importantes
    - `-f` : format du fichier de départ
    - `-t` : format du fichier de sortie
    - `-o` : nom du fichier de sortie
- Plus de détails
    - [`pandoc(1)`](https://manpages.debian.org/pandoc/pandoc.1.en.html)
    - [Documentation de la dernière version de Pandoc](https://pandoc.org/MANUAL.html)


# Aller plus loin

## avec Git 

- [Introduction à Git](https://perso.liris.cnrs.fr/pierre-antoine.champin/enseignement/intro-git/slides/index.html#1) :
  cours et exercices par Pierre-Antoine CHAMPIN (IUT / Université de
  Lyon 1)
- [Learning Git Branching](https://learngitbranching.js.org/?locale=fr_FR) :
  apprendre à gérer des branches
- [Pro Git](https://git-scm.com/book/fr/v2) : le livre de référence
- [Oh Shit, Git !?!](https://ohshitgit.com)
- [A hacker's guide to Git](https://wildlyinaccurate.com/a-hackers-guide-to-git)
- [How to Write a Git Commit Message](https://cbea.ms/git-commit)

## avec Markdown

- [Markdown Tutorial](https://www.markdowntutorial.com/fr) : un tutoriel sur la syntaxe Markdown
- [Markdown guide](https://www.markdownguide.org) : un guide de référence sur Markdown
- [Markdown en 60 secondes](https://commonmark.org/help) et en
  [10 minutes](https://commonmark.org/help/tutorial/)
- [Mastering GitHub Markdown](https://guides.github.com/features/mastering-markdown)

- Éditer du Markdown
    - [sous Emacs](https://jblevins.org/projects/markdown-mode)
    - [sous VSCode](https://code.visualstudio.com/Docs/languages/markdown)


