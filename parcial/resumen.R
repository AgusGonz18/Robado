#####primero setear working directory#### 
  

#intalar libreria library(BSDA)

###distribucion de probabilidades###

NUNCA HAY PROBABILIDADES CONDICIONADAS EN LAS TABLAS.
son todas p(algo y algo)
marginales p(algo)

read.table #lee base de datos, header true.

dpois probabilidad puntual en poisson, (conteo en continuo, parametro lambda=esperanza y a la dispersion dominio de 0 a +inf)

ppois probabilidad acumulada en poisson

qpois quantil en una poisson

""binom """" para binomiales (conteo en un n, paramatros son n y pi, n numero de observaciones, pi esperanza, dominio de 0 a n)

curve(dnorm(x, mu, dispersion), min. maximo, xlab, ylab)

esperanza es la media 

histograma para continuas comando hist(basededatos)

barplot para discretas comando barplot(basededatos)

boxplot cuartiles, valores extemos, media y mediana

sd() desvio estandar muestral

varp<-function(x) mean((x-mean(x))^2) #para varianza poblacional

varp(objeto$variable)

errorestandar <- sigma/sqrt(n)


mu, sigma, poblacionales.

x.raya, s, muestrales.

qqnorm() linea de distribucion que deberia seguir en dist normal, puntos los valores que tengo

teorema central del limite = cuando n<30 o dist normal, con obs aleatorias e independientes la distribucion de x.raya se aproxima a normal, muestreo con repocision o tamaño de muestra/tamaño de poblacion <0.05



######intervalos de confianza######
n= numero de observaciones

confianza= 1-alfa

si conozco sigma defino valor critico 

valor.critico <-qnorm(alfa/2, media, desvio.estandar)

errorestandar sigma/sqrt(n) =EE

error.muestral<-valor.critico*EE

#con error muestral armo limites

limite inferior<-x.raya-errormuestral

limite superior<-x.raya+errormuestral

c(limite.inferior, limite.superior) #con esto veo 
intervalo de confianza

#cuando no conozco desvio estandar aproximo con s

valor critico <-qt(alfa/2, n-1)

s<- sd(muestra)

EE <-s/sqrt(n)

Error.muestral<- valor.critico*EE

limiteinferior<-x.raya-Error.muestral

limitesuperior<-x.raya+Error.muestral

c(limiteinferior,limitesuperior)

#cuando quiero disminuir el error muestral utilizo  
((qt(1-alfa/2, n-1)*s)nuevoerrormuestral)**2
#para sacar el n nuevo
###prueba de hipotesis###
#siempre planteo h0 como la hipotesis nula, lleva el igual, cuando rechazo puedo cometer error tipo 1 (alfa), cuando no rechazo cometo error tipo 2 (relacionado con la potencia)  


cuando conozco sigma uso z.test.

z.test(basedeatos, alternative , mu, sigma.x = sigma, conf.level = 1-alfa)

ztest da pvalor, comparo con alfa, si pvalor>alfa no rechazo h0

cuando no conozco sigma uso t.test

x.rayacritico<- qnorm(alfa, mu, sigma/sqrt(n))

t.test(basededatos$variable, alternative, mu , nivel de confianza)
t.test da pvalor, si pvalor>alfa no rechazo h0




#para sacar n estandarizo.

z=(x.raya-mu)/(sigma/sqrt(n))

#cuando piden n para cierta probabilidad calculo qnorm(probabilidad) y lo uso para despejar
n.nuevo<-((z*sigma)/(x.raya-mu))**2

###potencia###
potencia es la certeza que tengo al no rechazar h0 
1-beta= p(no rechazar h0/ha es verdadera)

potencia = pnorm(x.rayacritico, nuevomu, sigma/sqrt(n))

cuando quiero ver n para una potencia significativa uso
d<- magnitud de efecto = mu-munuevo
n.nuevo <- 
  (((qnorm(1-alfa)+qnorm(1-beta))/d)*sigma)**2




