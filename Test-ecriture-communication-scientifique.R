############################# CREATION & TEST D'UNE FONCTION ############################


####On cree le jeu de donnees + les coefficients

#taille du jeu de donnees
n <- 50 #on n'utilise pas le = car on ne sait pas si la fonction "=" est une 
        #fonction d'affectation ou une focntion... alors on met <-

#tirage de X
X <- runif(n) #r(=random) + unif(nom de la fonction : unif ou normale etc)

#coef
a <- 2
b <- 3
sigma <- 1/2



#### Tirage de Y
Y <- a * X + b + rnorm(n, sd=sigma) #rnorm permet de crée des résidus qui suivent une loi normale



### Modele lineaire
(modele <- lm(Y~X)) #entre parathèse car on sous entend "print" qui imprime le résultat dans la console
plot(Y~X)
abline(a=modele$coefficients[1], b=modele$coefficients[2], col="red")
      # /!\ a = l'inetrcept et b = la pente INVERSE 



### Ggplot
#cree par un geographe qui a passer sa vie a expliquer comment faire des graphiques
#un graphique doit etre fait par une succession de couches (SIG)

library("tidyverse") # (pas un packafge mais un appelle à plein de packages
#univers bien rangé = les donnees sot tjrs bien range cad sous forme de tableau

data.frame(X, Y) %>% #%>% = pipe = on fait passer le première argument de la fct au fct suivantes
  ggplot(aes(x=X, y=Y)) + #aes = aesthetic (=esthetique)
  geom_point() +
  geom_smooth(method = lm) #ce ne sont pas des points mais un lissage de point par modele lineaire
