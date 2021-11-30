#Definimos multiples hipótesis nulas "$H_0$: existe una relación entre los 
#sujetos que toman una droga $x_i$ con los que toman la droga $x_j$, con $i\neq j$.

## Test de Bonferroni:

#En el test de Bonferroni se redefine la significancia $\alpha$ para $m$ 
#hipótesis nulas $H_0$. alpha' = alpha/m

alprim = 0.05/3
alprim


#Entonces se redefine la regla de decisión: "Para probabilidades p_i menor o 
#igual a \alpha', se rechaza la hipótesis nula"

#Definimos datos de un ensayo en el que se relacionen 3 drogas y cierto 
#contéo de células.


droga = c('A','A','A','A','A','A','A','A','A','A','A','A',
          'B','B','B','B','B','B','B','B','B','B','B','B',
          'C','C','C','C','C','C','C','C','C','C','C','C')
droga = factor(droga)
celulas = c(24.15,24.6,25.1,22.55,22.62,26.85,40.2,63.2,79.6,59.1,64.6,102.45,
            36.3,44.1,39.15,49.9,50.35,50.6,31.7,69.25,138.6,72.95,80.05,90.3,
            19.35,21.9,31.1,15.4,18.3,27.1,22.15,22.15,22.75,66.7,19.35,37.85)
datos = data.frame(droga,celulas)
show(datos)

#Hacemos un test de Bonferroni
pairwise.t.test(celulas,droga,p.adj="bonf")

#Con el test de Bonferroni encontramos que no se rechaza la hipótesis nula para 
#la comparación entre las drogas A-B y A-c, por otra parte, entra en discusión 
#el descartar la hipótesis nula entre B-C.

## Test de Tukey:

#La prueba de Tukey es un procedimiento de comparación múltiple de un solo paso 
#y una prueba estadística. Es un análisis post-hoc, lo que significa que se usa 
#junto con un ANOVA.

#Permite encontrar medias de un factor que son significativamente diferentes 
#entre sí, comparando todos los pares de medias posibles con un método similar 
#a la prueba t.

#Para el test de Tukey, se define la regla de decisión como: "Se rechaza la 
#hipótesis nula si es p menor o igual a alpha

#Hacemos el test de Tukey.

model <- aov(celulas~droga, data=datos)
TukeyHSD(model, conf.level=.95)

#Encontramos valores similares pero un poco menores del valor de p que en el 
#test de Bonferroni. Las relaciones entre las drogas A-B y A-C no se rechaza la 
#hipótesis nula, mientras que para B-C se rechaza ya que p < 0.05 = \alpha

plot(datos)
