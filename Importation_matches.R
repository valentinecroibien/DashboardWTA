library(here)
library("tidyverse")
library("magrittr")
library("stringr")
library('purrr')
library("dplyr")

list_files <- list.files(here("tennis_wta"))

list_matches <- grep(pattern = "^wta_matches_2[[:digit:]]{3}.csv$", x = list_files, value = TRUE)

list_qualifs <- grep(pattern = "^wta_matches_qual_itf_2[[:digit:]]{3}.csv$", x = list_files, value = TRUE)

list_players <- grep(pattern = "^wta_players.csv$", x = list_files, value = TRUE)

list_rankings <- grep(pattern = "^wta_rankings_[[:digit:]]{2}s.csv$", x = list_files, value = TRUE)

list_rankings[4] <- grep(pattern = "^wta_rankings_current.csv$", x = list_files, value = TRUE)


#### Liste des tibbles des matches de 2000 à 2021 ####
# On crée le vecteur de chaines de caractères des nom des tibbles qu'on va créer lors de l'importation
lst_names <- paste('wta_', str_extract(string = list_matches, pattern = "[[:digit:]]{4}"), sep = "")

# On effectue une boucle avec map (ou lapply) pour importer les donnees et stocker les tibbles dans une liste
lst_matchs <- map(.x = list_matches, 
               .f = function (x) read_csv(paste("tennis_wta/", 
                                                x, sep = ""), col_types = 'cccdcddddcccdcdddcccdcdcdcllllllllllllllllllldddd'))
names(lst_matchs) <- lst_names

# Recolloage des bases à l'aide de la fonction reduce
# Résultats des matches de 2000 à 2021
wta_matches <- reduce(.x = lst_matchs, .f = bind_rows)

#### Liste des tibbles des matches de qualification de 2000 à 2021 ####
# On crée le vecteur de chaines de caractères des nom des tibbles qu'on va créer lors de l'importation
lst_names <- paste('wta_qualif', str_extract(string = list_qualifs, pattern = "[[:digit:]]{4}"), sep = "")

# On effectue une boucle avec map (ou lapply) pour importer les donnees et stocker les tibbles dans une liste
lst_qualifs <- map(.x = list_qualifs, 
               .f = function (x) read_csv(paste("tennis_wta/", 
                                                x, sep = ""), col_types = 'cccdddddcccdcdddcccdcdcdcllllllllllllllllllddddd'))
names(lst_qualifs) <- lst_names

# Recolloage des bases à l'aide de la fonction reduce
# Résultats des matches qualifs de 2000 à 2021
wta_qualifs <- reduce(.x = lst_qualifs, .f = bind_rows)



#### Liste des classements de 2000 à 2021 ####
# On crée le vecteur de chaines de caractères des nom des tibbles qu'on va créer lors de l'importation

# On effectue une boucle avec map (ou lapply) pour importer les donnees et stocker les tibbles dans une liste
lst_rankings <- map(.x = list_rankings, 
                   .f = function (x) read_csv(paste("tennis_wta/", 
                                                    x, sep = "")))
names(lst_qualifs) <- list_rankings

# Recolloage des bases à l'aide de la fonction reduce
# Résultats des matches qualifs de 2000 à 2021
wta_rankings <- reduce(.x = lst_rankings, .f = bind_rows)

#### Liste des joueurs ####
wta_players <- read_csv("tennis_wta/wta_players.csv")
wta_players <- wta_players[-c(1:2),]
