
##### -------------------------- IMPORTATION -----------------------------######


library('readr')
library('tibble')
library('purrr')
library('stringr')
library('dplyr')


## Importation du fichier
rm(list = ls())

library('readr')
wta2021 <- read_csv(file = "C:/DOCUMENT/WTA/tennis_wta/wta_matches_2021.csv")
wta2016 <- read_csv(file = "C:/DOCUMENT/WTA/tennis_wta/wta_matches_2016.csv")
View(wta2016)

## Liste des fichiers du dossier et filtrage pour ne conserver que les fichier atp_matches_xxxx.csv
# Liste des noms des fichiers du dossier
lst <- list.files(path = "C:/DOCUMENT/WTA/tennis_wta")

# On filtre pour ne garder que les noms des fichiers de la forme atp_matches_xxxx.csv
lst_data <- grep(pattern = "^wta_matches_[[:digit:]]{4}.csv$", x = lst, value = TRUE)



## Liste des fichiers du dossier et filtrage pour ne conserver que les fichier atp_matches_xxxx.csv
# Liste des noms des fichiers du dossier
lst <- list.files(path = "C:/DOCUMENT/WTA/tennis_wta")
# On filtre pour ne garder que les noms des fichiers de la forme atp_matches_xxxx.csv
lst_data <- grep(pattern = "^wta_matches_[[:digit:]]{4}.csv$", x = lst, value = TRUE)
lst_names <- paste('wta', str_extract(string = lst_data, pattern = "[[:digit:]]{4}"), sep = "")
lst_tib <- map(.x = lst_data, 
               .f = function (x) read_csv(paste("C:/DOCUMENT/WTA/tennis_wta/", 
                                                x, sep = "")))

# On renomme les composantes de la liste des tibbles
#names(lst_tib) <- lst_names
names(lst_tib) <- lst_names[72:82]
lst_tib = lst_tib[72:82]

# On réuni tous pour l'année 2000 à 2010
library("dplyr")
wta <- reduce(.x = lst_tib, .f = bind_rows)
wta

colnames(wta)
class(wta)
view(wta)

##### -------------------------- STAT DESCRIP -----------------------------######

library('dplyr')
library('tidyr')
library('ggplot2')

class(wta$winner_age)
class(wta$loser_age)

wta %>%
  summarize(across(.cols = c( wta$winner_age, wta$loser_age), .fns = function(x) mean(x, na.rm = TRUE)))

X11()
ggplot(data = wta) + geom_boxplot(mapping = aes(y = wta$winner_age))
ggplot(data = wta) + geom_boxplot(mapping = aes(y = wta$loser_age))


##### ------------------------- PAGE SAISONS ----------------------------######
View(wtagraph)

wtagraph <- wta2010[, c(1,2,3,11, 19)]

library('ggplot2')
library('dplyr')

n <- wtagraph %>%
  mutate(.data = wtagraph, nbwinner = case_when(
                                      winner_name == "Justine Henin" ~ 1,
                                       TRUE ~ 0))
n
b <- wtagraph %>%
  mutate(.data = wtagraph, nbloser = case_when(
    loser_name == "Justine Henin" ~ 1,
    TRUE ~ 0))


p <- ggplot(wtagraph, aes(x = surface, y = winner_name == "Justine Henin" )) +
  geom_col(aes(fill = winner_name == "Justine Henin", width = 0.7))

p













