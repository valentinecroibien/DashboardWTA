Présentation du Dashboard
===================================

<div style="text-align: justify">  
Auteurs : 

* Margaux ALLOUX 
* Maxime ANGOULVENT 
* Valentine CROIBIEN 
* Ndeye Awa DIEYE 
* Aurore LONDERO 
* Sabirine MONIAK 

Ce Dashboard a pour objectif de présenter une joueuse de tennis inscrite à la WTA. Il est disponible ici :  
https://valentinecroibien.shinyapps.io/dashboard_final/ 

## Table des matières
1. [Présentation des différentes pages](#presenteation_page)
    1. [Accueil](#1.1)
    2. [Page 1](#1.2)
    3. [Page 2](#1.3)
    4. [Page 3](#1.4)
2. [Présentation technique](#presenteation_tech)
    1. [Joueuse](#2.1)
    2. [Thème](#2.2)
    3. [Liste des packages](#2.3)
    4. [Améliorations](#2.4)
3. [Répartition du travail](#repartition)
4. [Source](#source)


##  **Présentation des différentes pages** <a name="presenteation_page"></a>

Description du contenu des différentes pages et justification de nos choix de représentation.

### Accueil <a name="1.1"></a>

On y retrouve : 

* La présentation du Dashboard
* La présentation des différentes pages 

### Page 1 <a name="1.2"></a>

On y retrouve : 

* **La présentation de la joueuse** (nom, prénom, date de naissance, âge, nationalité, taille, main). 
* **L'évolution du classement de la joueuse**. Nous avons choisi une courbe afin de révéler les tendances et les changements dans le temps. 
* **Le nombre de médailles olympiques gagnées** (toutes médailles confondues).
* **Le nombre de titres gagnés**.
* **Les gains en tournoi**.
* **Les pourcentages de victoires par type de terrain**. Nous avons choisi une jauge afin de montrer une partie d'un tout, ici le pourcentage de victoires sur un terrain parmi le nombre total de matchs joués sur ce terrain.
* **Le nombre de victoires et de défaites face aux principales concurrentes.** Nous avons choisi un histogramme horizontal empilé pour comparer le nombre de matchs face aux différentes adversaires et aussi pour comparer le nombre de victoires et de défaite. 

### Page 2 <a name="1.3"></a>

On sélection une année durant laquelle la joueuse était en activité.
On y retrouve : 

* **L'évolution du classement de la joueuse sur la saison**. Nous avons choisi une courbe afin de révéler les tendances et les changements dans le temps. 
* **Les tournois du Grand Chelem de la joueuse pour la saison**. Nous avons choisi un tableau afin de lister les Grands Chelem et présenter les différentes informations de celui-ci.
* **Le nombre de matchs de tournois joués**.
* **Le nombre de matchs de tournois gagnés**.
* **Les pourcentages de victoires par type de terrain**. Nous avons choisi des secteurs afin de montrer les parties d'un tout, ici le pourcentage de victoires et de défaites sur un type de terrain et ainsi pouvoir les comparer. 

### Page 3  <a name="1.3"></a>

On sélection une année durant laquelle la joueuse était en activité et un tournoi auquel elle a participé.
On y retrouve : 

* **Une description du tournoi**.
* **La gagnante du tournoi**.
* **Le tableaux des matchs du tournoi**. Nous avons choisi un tableau afin de montrer l'ensemble des matchs joués et présenter les informations de ces matchs. 
* **Une représentation des joueuses participant au tournoi**. Nous avons choisi un histogramme afin d'avoir une répartition des différentes nationalités présentes au tournoi et pouvoir comparer les différentes fréquences de présence.
* **La place de la joueuse dans le tournoi**
* **Le pourcentage de jeux gagnés et perdus par la joueuse dans le tournoi**. Nous avons choisi un diagramme secteur afin de montrer les parties d'un tout, ici le pourcentage de jeux gagnés et perdus sur l'ensemble du tournoi.
* **Le pourcentage de break points sauvés par la joueuse sur l'ensemble du tournoi**. Nous avons choisi une jauge afin de montrer une partie d'un tout, ici le pourcentage de break points sauvés parmi tous les break points auxquels la joueuse a fait face. 

## **Présentation technique** <a name="presenteation_tech"></a>

### Joueuse <a name="2.1"></a>

La joueuse sélectionnée est Justine Henin. La prochaine étape de ce projet est de pouvoir sélectionner n'importe quelle joueuse sur la page d'accueil. Cependant, en changeant le nom de la joueuse à la ligne 85, tout le Dashboard s'adapte à celle-ci. Attention cela ne fonctionne pas pour : 

* Les joueuses qui n'ont pas joué de 2000 à 2021
* Les joueuses avec leur nom ou prénom dans un alphabet autre que l'alphabet latin moderne
* Les joueuses n'ayant pas de Wikipédia

### Thème <a name="2.2"></a>

Utilisation d'une feuille de style pour le thème et pour modifier certains éléments. Nous avons utilisé le code (fichier.css) d'un thème existant, flatly, que nous avons modifié pour changer certains éléments du thème.

**Important** <br>
Il faut donc télécharger le fichier styles.css et le placer dans le même dossier que le Dashboard.

### Liste des packages <a name="2.3"></a>

digest_0.6.28       
R6_2.5.1          
jsonlite_1.7.2      
evaluate_0.14       
rlang_0.4.12        
rstudioapi_0.13     
jquerylib_0.1.4     
bslib_0.3.1        
xml2_1.3.2          
rmarkdown_2.11      
flexdashboard_0.5.2 
tools_4.1.2         
xfun_0.26           
yaml_2.2.1          
fastmap_1.1.0       
compiler_4.1.2     
htmltools_0.5.2     
knitr_1.36          
sass_0.4.0

### Améliorations <a name="2.4"></a>

Liste des améliorations : 

* Sélection de joueuse
* Afficher un message de "données manquantes" quand on utilise une valeur d'input

## **Répartition du travail** <a name="repartition"></a>

**Margaux :**

* Responsable Gitlab
* Rédaction des comptes rendus de réunion
* Recherche des joueuses entre 2000 et 2010
* Recherche, maquettage, création et conception Page 3 du Dashboard 

**Maxime :**

* Statistiques descriptives des variables
* Recherche, maquettage Page 3 du Dashboard

**Valentine :**

* Dictionnaire des variables
* Importation des BDD
* Recherche, maquettage, création et conception Page 1 du Dashboard 
* Assemblage des différentes pages du Dashboard
* Déploiment d'application pour rendre le Dashboard accessible

**Ndeye Awa :**

* Étude du traitement des valeurs manquantes
* Recherche, maquettage Page 1 du Dashboard

**Aurore :**

* Statistiques descriptives des variables
* Recherche, maquettage Page 2 du Dashboard

**Sabirine :**

* Recherche des valeurs manquantes
* Recherche, maquettage, création et conception Page 3 du Dashboard
* Modification de la feuille de style 
* Présentation du projet 

Maxime, Awa et Aurore se sont concentré sur la partie d’apprentissage automatique du projet. 

## **Source** <a name="source"></a>

Base de données : 
https://github.com/JeffSackmann/tennis_wta

<br>
<br>

</div> 
