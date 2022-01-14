library('readr')
library('tibble')
library("stringr")
library('purrr')
library("dplyr")
library(FactoMineR)
library(xlsx)
library(tibble)
library(questionr)
library(scales)
library(ggplot2)
library(extrafont)
library(plotrix)
library(gapminder)
library(lattice)

rm(list = ls())

## Importation du fichier
wta2003 <- read_csv(file = "C:/Users/hp/Desktop/M2S1/ADD_R/projet/groupe/tennis_wta/wta_matches_2003.csv")
view(wta2003)

summary(wta2003)
table(wta2003$surface)
table(wta2003$tourney_level)
table(wta2003$draw_size)
table(wta2003$match_num)

## Liste des fichiers du dossier et filtrage pour ne conserver que les fichier atp_matches_xxxx.csv
# Liste des noms des fichiers du dossier
lst <- list.files(path = "C:/Users/hp/Desktop/M2S1/ADD_R/projet/groupe/tennis_wta")
# On filtre pour ne garder que les noms des fichiers de la forme atp_matches_xxxx.csv
lst_data <- grep(pattern = "^wta_matches_[[:digit:]]{4}.csv$", x = lst, value = TRUE)
lst_names <- paste('wta', str_extract(string = lst_data, pattern = "[[:digit:]]{4}"), sep = "")
lst_tib <- map(.x = lst_data, 
               .f = function (x) read_csv(paste("C:/Users/hp/Desktop/M2S1/ADD_R/projet/groupe/tennis_wta/", 
                                                x, sep = "")))
lst_tib = lst_tib[72:82]

# On renomme les composantes de la liste des tibbles
names(lst_tib) <- lst_names[72:82]
wta <- reduce(.x = lst_tib, .f = bind_rows)
wta # sur 10 ans 

view(wta)

# analyse univariee 

# surface

table(wta$surface)
sort(table(wta$surface))
sort(table(wta$surface), decreasing = TRUE)
table(wta$surface, useNA = "ifany")
freq(wta$surface)
freq(wta$surface, cum = TRUE, total = TRUE, sort = "inc", digits = 2, exclude = NA)

effectifs_surf<- table(wta$surface)
sum(effectifs_surf)
effectifs_surf
frequence_surf <- effectifs_surf*100/sum(effectifs_surf)
frequence_surf
prop.table(effectifs_surf) # fréquences relatives

plot(table(wta$surface), main = "Nombre de matchs par surface", ylab = "Effectif")
dotchart(as.matrix(table(wta$surface))[, 1], main = "nombre de matchs par surface", pch = 19)

surface=c("Carpet","Clay","Grass","Hard")
pie(effectifs_surf, labels=surface,
    main = "Simple diagramme circulaire")

pourcentages=round(effectifs_surf/sum(effectifs_surf)*100)
pourcentages

surface.2=paste(surface," ",pourcentages,"%",
                sep="")
surface.2

pie(effectifs_surf, labels = surface.2,
    main = "Diagramme circulaire (%)")

pie3D(effectifs_surf,labels= surface.2,
      explode = 0.1, radius = 1, theta =1.3,
      border = "brown",labelcex = 1.3, shade = 0.5,
      col=heat.colors(length(surface.2)),
      main="Diagramme circulaire (3D)")

# diagramme en barre 

surface4<- data.frame(surface4=c("Carpet","Clay","Grass","Hard"),
                      effectifs_surf)


# En dehors des barres
ggplot(data=surface4, aes(x=surface4, y=pourcentages)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=pourcentages), vjust=-0.3, size=3.5)+
  theme_minimal()

# A l'intérieur des barres
p=ggplot(data=surface4, aes(x=surface4, y=pourcentages)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=pourcentages), vjust=1.6, color="white", size=3.5)+
  theme_minimal()
p

# taille titre etc 

p <- p + labs(title = "Repartition des matchs par surface")
p<-p + theme(
  plot.title = element_text(color = "red", size = 18, face = "bold",hjust=0.5))
#p<-p + scale_x_discrete(name ="Ecole Doctorale")
#p<-p + scale_y_discrete(name ="Pourcentage")git commit
p<-p + theme(
  axis.text = element_text(size = 15, color = "black"))
p <- p + xlab('Surface') 
p <- p + ylab('Pourcentage') 
p <- p + theme(axis.title.y = element_text(size = rel(1.8), angle = 90))
p <- p + theme(axis.title.x = element_text(size = rel(1.8), angle = 00))
p
##

# draw size

table(wta$draw_size)
effectifs_draw_size<- table(wta$draw_size)
effectifs_draw_size
sum(effectifs_draw_size)
frequence_draw_size <- effectifs_draw_size*100/sum(effectifs_draw_size)
frequence_draw_size
prop.table(effectifs_draw_size) # fréquences relatives
pourcentages=round(effectifs_draw_size/sum(effectifs_draw_size)*100)
pourcentages


draw_size<- data.frame(draw_size=c("4","8","15","16","27","28","30","32","48","56","60","64","80","96","128"),
                       effectifs_draw_size)
head(draw_size)

ggplot(data=draw_size, aes(x=draw_size, y=pourcentages)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=pourcentages), vjust=-0.3, size=3.5)+
  theme_minimal()

p=ggplot(data=draw_size, aes(x=draw_size, y=pourcentages)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=pourcentages), vjust=1.6, color="white", size=3.5)+
  theme_minimal()
p

# tourney_level

table(wta$tourney_level)
effectifs_tourney_level<- table(wta$tourney_level)
effectifs_tourney_level
sum(effectifs_tourney_level)
pourcentages=round(effectifs_tourney_level/sum(effectifs_tourney_level)*100)
pourcentages

tourney_level<- data.frame(tourney_level=c("CC","D","F","G","I","O","P","PM","T1","T2","T3","T4","T5"),
                           effectifs_tourney_level)

ggplot(data=tourney_level, aes(x=tourney_level, y=pourcentages)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=pourcentages), vjust=-0.3, size=3.5)+
  theme_minimal()

ggplot(data=tourney_level, aes(x=tourney_level, y=effectifs_tourney_level)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=effectifs_tourney_level), vjust=-0.3, size=3.5)+
  theme_minimal()

#winner_ioc
table(wta$winner_ioc)
effectifs_winner_ioc<- table(wta$winner_ioc)
effectifs_winner_ioc
sum(effectifs_winner_ioc)
pourcentages=round(effectifs_winner_ioc/sum(effectifs_winner_ioc)*100)
pourcentages

winner_ioc2<- data.frame(winner_ioc2=c("ARG","AUS","AUT","BEL","BLR","CHN","CRO","CZE","ESP","FRA","GER","ISR","ITA","JPN","RUS","SLO","SRB","SUI","SVK","UKR","USA"),
                         effectifs_winner_ioc2=c(603,1137,510,1102,406,635,436,1191,1571,2326,866,516,1661,735,4117,452,615,960,925,504,3429))
winner_ioc2

ggplot(data=winner_ioc2, aes(x=winner_ioc2, y=effectifs_winner_ioc2)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=effectifs_winner_ioc2), vjust=-0.3, size=3.5)+
  theme_minimal()

winner_ioc3<- data.frame(winner_ioc3=c("ARG","AUS","AUT","BEL","BLR","CHN","CRO","CZE","ESP","FRA","GER","ISR","ITA","JPN","RUS","SLO","SRB","SUI","SVK","UKR","USA"),
                         pourcentage_winner_ioc3=c(2,4,2,3,1,2,1,4,5,7,3,2,5,2,13,1,2,3,3,2,11))
winner_ioc3

ggplot(data=winner_ioc3, aes(x=winner_ioc3, y=pourcentage_winner_ioc3)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=pourcentage_winner_ioc3), vjust=-0.3, size=3.5)+
  theme_minimal()

# winner_age
class(wta$winner_age)
summary(wta$winner_age) # descriptions des variables

hist(wta$winner_age, main = "victoires par age", xlab = "age ", ylab = "Effectif")

boxplot(wta$winner_age, col = grey(0.8), main = "Boite à moustache des Notes de Droit", ylab = "Notes de Droit")
rug(wta$winner_age, side = 4)
abline(h = median(wta$winner_age, na.rm = TRUE), col = "navy", lty = 2)
abline(h = mean(wta$winner_age, na.rm = TRUE), col = "Red", lty = 2)
text(1.35, median(wta$winner_age, na.rm = TRUE) + 0.15, "Médiane", col = "navy")
text(1.35, mean(wta$winner_age, na.rm = TRUE) + 0.15, "Moyenne", col = "Red")
Q1 <- quantile(wta$winner_age, probs = 0.25, na.rm = TRUE)
abline(h = Q1, col = "darkred")
text(1.35, Q1 + 0.15, "Q1 : premier quartile", col = "darkred", lty = 2)
Q3 <- quantile(wta$winner_age, probs = 0.75, na.rm = TRUE)
abline(h = Q3, col = "darkred")
text(1.35, Q3 + 0.15, "Q3 : troisième quartile", col = "darkred", lty = 2)
arrows(x0 = 0.7, y0 = quantile(wta$winner_age, probs = 0.75, na.rm = TRUE), x1 = 0.7, y1 = quantile(wta$winner_age, probs = 0.25, na.rm = TRUE), length = 0.1, code = 3)
text(0.7, Q1 + (Q3 - Q1) / 2 + 0.15, "h", pos = 2)
mtext("L'écart inter-quartile h contient 50 % des individus", side = 1)
abline(h = Q1 - 1.5 * (Q3 - Q1), col = "darkgreen")
text(1.35, Q1 - 1.5 * (Q3 - Q1) + 0.15, "Q1 -1.5 h", col = "darkgreen", lty = 2)
abline(h = Q3 + 1.5 * (Q3 - Q1), col = "darkgreen")
text(1.35, Q3 + 1.5 * (Q3 - Q1) + 0.15, "Q3 +1.5 h", col = "darkgreen", lty = 2)

# ANALYSE BIVARIEE (surface draw-size tourney-level winner ioc winner-age)

# surface / winner-age
means <- aggregate(winner_age ~  surface, wta, mean)
means
ggplot(wta,aes(x=surface,y=winner_age)) +
  geom_boxplot(fill="lightsteelblue") +
  xlab("Surface") +
  ylab("Age du vainqueur") +
  stat_summary(fun=mean, colour="darkred", geom="point", shape=20, size=3,show.legend = FALSE)+
  geom_text(data = means, aes(label = round(winner_age,1), x = c(1,2,3,4), y = c(8.75,7.65,7.65,8.3)) 
  )

# tourney_level / winner-age
means <- aggregate(winner_age ~  tourney_level, wta, mean)
means
ggplot(wta,aes(x=tourney_level,y=winner_age)) +
  geom_boxplot(fill="lightsteelblue") +
  xlab("Surface") +
  ylab("Age du vainqueur") +
  stat_summary(fun=mean, colour="darkred", geom="point", shape=20, size=3,show.legend = FALSE)+
  geom_text(data = means, aes(label = round(winner_age,1), x = c(1,2,3,4,5,6,7,8,9,10,11,12,13), y = c(10,10,10,10,10,10,10,10,10,10,10,10,10)) 
  )

#draw_size/ winner-age
plot(
  x = wta$winner_age, y = wta$draw_size,
  xlab = "Age du vainqueur", 
  ylab = "Draw Size"
)

# surface / winner_ioc

table(wta[,3] , wta[,14])->tableaucontingence
tableaucontingence

table(wta$surface,wta$winner_ioc)->tableaucontingence2
tableaucontingence2

effectif<-table(wta$surface,wta$winner_ioc,deparse.level = 2)
effectif
effectif<-cbind(effectif,c(0,0,0,0))
effectif<-rbind(effectif,c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                           0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                           0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0))
effectif
for(i in 1 : nrow (effectif)){effectif [i, 113]<-sum(effectif[i,])}
for(i in 1 : ncol (effectif)){effectif [5,i]<-sum(effectif[,i])}
effectif
row.names(effectif)=c("CARPET","CLAY","GRASS","HARD","TOTAL")
colnames(effectif)[113] <- "TOTAL"
effectif
effectif_freq_relatif=effectif/effectif[5,113]
effectif_freq_relatif


# tableau de contingence profil ligne 

effectif_profil_ligne_pourcentage<-matrix(nrow=5,ncol=113)
for(i in 1 : nrow (effectif)) effectif_profil_ligne_pourcentage[i,]<-round((effectif[i,]/effectif[i,113])*100,2)
effectif_profil_ligne_pourcentage
rownames(effectif_profil_ligne_pourcentage)=row.names(effectif)
colnames(effectif_profil_ligne_pourcentage)=colnames(effectif)
effectif_profil_ligne_pourcentage

# tableau de contingence profil colonne 
effectif_profil_colonne_pourcentage<-matrix(nrow=5,ncol=113)
for(i in 1 : ncol (effectif)) effectif_profil_colonne_pourcentage[,i]<-round((effectif[,i]/effectif[5,i])*100,2)
effectif_profil_colonne_pourcentage
rownames(effectif_profil_colonne_pourcentage)=row.names(effectif)
colnames(effectif_profil_colonne_pourcentage)=colnames(effectif)
effectif_profil_colonne_pourcentage


  
