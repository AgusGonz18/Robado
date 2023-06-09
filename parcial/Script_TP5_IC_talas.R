rm(list = ls())

######################################################################### #
######################         	TP 5      	       ###################### #
######################   Intervalos de confianza   ###################### #
######################################################################### #

# Vamos a retomar el problema 1 del TP1. Recordemos de qu� se trataba:

# Los talares bonaerenses constituyen el principal bosque nativo de la provincia de Buenos Aires. Sin embargo, se encuentran en continua reducci�n. Su superficie actual es mucho menor que la original, que se extend�a desde el norte de la provincia de Buenos Aires sobre una estrecha franja costera que llegaba hasta Mar del Plata. Esta es la zona m�s poblada de Argentina y, donde la urbanizaci�n creci�, los talares desaparecieron casi totalmente.

# Para poder tomar medidas adecuadas de manejo para evitar su desaparici�n total, es necesario tener una estimaci�n del estado actual de los remanentes de talar que todav�a perduran.

#############################   ACTIVIDAD A   #############################

# A continuaci�n vamos a simular la extracci�n de muestras aleatorias de tama�o n a partir de una poblaci�n de 500 talas (Celtis ehrenbergiana) de la reserva "El Destino" (partido de Magdalena).

## Carguen la base de datos BD_poblacion_talas.txt, as�gnenla a un objeto llamado "poblacion_talas".



## Trabajaremos con la variable altura. Su varianza poblacional es de 1.57m2 (Ver TP 4)

# 1) Tomen tres muestras aleatorias de tama�o 30 de la variable altura mediante el comando "sample"

# Ejemplo para la muestra 1

muestra_n30_1 <- sample(poblacion_talas$altura, 30, replace = TRUE)
muestra_n30_1

# Generen ustedes las  muestra 2 y 3




## 2) Calculen la media (nombrar objetos como x.raya_1, x.raya_2 y x.raya_3) y el desv�o est�ndar (nombrar objetos como sd_1, sd_2, sd_3) de las muestras.

# ej:
x.raya_1 <- mean(muestra_n30_1)
sd_1 <- sd(muestra_n30_1)

# muestra 2 y 3

x.raya_2 <- 
sd_2 <- 

x.raya_3 <- 
sd_3 <- 


# Conociendo estos estad�sticos, vamos a estimar la media poblacional mediante un INTERVALO DE CONFIANZA (IC). Es decir, vamos a dar dos valores entre los que, con una determinada confianza, esperamos se encuentre el valor de mu. La confianza la vamos a fijar nosotros de antemano en 95% (aproximadamente 2 desv�os alrededor de x_raya). Este nivel de confianza (95%) es el m�s usual en investigaciones biol�gicas y paleontol�gicas.

#### Construcci�n del IC ####

# Un IC se construye sumando y restando el error muestral (EM) al estimador del par�metro (en este caso x.raya).
# El EM se calcula como el producto de un valor cr�tico (VC) por el Error Est�ndar (EE). Esto es:
#      	X_raya +- EM
#      	X_raya +- VC*EE

# El valor cr�tico se calcula a partir de una distribuci�n normal est�ndar (z) cuando se conoce sigma (desv�o poblacional), o la distribuci�n t cuando sigma es desconocido

# El EE es la variabilidad del estimador


## 3) Con las muestras 1, 2 y 3 estimaremos la altura media de la poblaci�n de talas con una confianza del 95 %. Para ello comenzaremos calculando el valor cr�tico y el error muestral.

VC.sup <- qnorm(0.975, 0, 1)
VC.sup
VC.inf <- qnorm(0.025, 0, 1)
VC.inf

# �Por qu� les parece que pedimos esos cuantiles? Si tienen dudas, pueden consultar la te�rica correspondiente al tema "Estimaci�n de par�metros".

curve(dnorm(x, mean= 0,sd= 1), xlim=c(-4, 4),col = 1, lwd = 2)
abline(v=VC.inf)
abline(v=VC.sup, col = 2)


# Calculen el EE usando R como calculadora. As�gnenlo al objeto "EE".

EE<-sqrt(1.57)/sqrt(30)
  
# �Tiene unidades?

# Ahora que conocen el VC y el EE, pueden calcular el EM. Calculen un EM con cada uno de los VC calculados arriba (VC.sup y VC.inf)

EM.sup <-VC.sup*EE
EM.inf <-VC.inf*EE
  
  
# Ahora solo falta sumar y restar, respectivamente, estos EM a las tres X.raya que se obtuvieron antes para obtener los l�mites superior e inferior de los IC.
  
# Ejemplo para la muestra 1
LS_1 <- x.raya_1 + EM.sup
LI_1 <- x.raya_1 + EM.inf

# �Por qu� les parece que sumamos en ambos casos?

# Finalmente:
c(LI_1, LS_1)

# �Cu�l es la conclusi�n biol�gica de este resultado?


###


# 4) Repitan ustedes el procedimiento para las muestras 2 y 3:

LS_2 <- 
LI_2 <- 

c(LI_2, LS_2)

LS_3 <- 
LI_3 <- 

c(LI_3, LS_3)


# 5) Estimen la altura media de la poblaci�n de talas, con una confianza
# del 95 %, conociendo solo X_raya y el desv�o est�ndar (s) a partir de cada una de las tres muestras.

# Como no conocemos sigma, no podemos usar la funci�n "qnorm()". Exploren la que vamos a usar:

?qt()

# Ejemplo para la muestra 1:
VC.sup_1 <- qt(0.975, 29)

# �Qu� representa el valor 29 que se incluy� dentro de la funci�n?

VC.sup_1

VC.inf_1 <- qt(0.025, 29)  
VC.inf_1

EE_1 <- sd_1 / sqrt(30)

LI_1.1 <- x.raya_1 + (VC.inf_1 * EE_1)
LS_1.1 <- x.raya_1 + (VC.sup_1 * EE_1)
EM.sup_1 <- VC.sup_1 * EE_1
EM.sup_1
EM.inf_1 <- VC.inf_1 * EE_1
EM.inf_1

c(LI_1.1, LS_1.1)


#  RESPUESTA de la estimaci�n:


# Comparemos los IC calculados con sigma conocido y sigma desconocido para la misma muestra.
c(LI_1, LS_1)

# �Qu� diferencias encuentran? �A qu� creen que se debe?


# Ahora vamos a verificar c�mo fue nuestra estimaci�n del par�metro poblacional. �sto no se podr� hacer habitualmente ya que no realizar�an una estimaci�n de par�metros poblaciones si ya los conocen.

## 6) Calculen la media poblacional y as�gnenla a un objeto llamado "mu"

mu <-
mu


# �Cu�les son los supuestos para realizar la estimaci�n de la media poblacional de la altura en el punto 3 y 4? 

  # 1) 
  # 2) 
  # 3) 
  

  # �Cu�l es la forma de la distribuci�n de la altura? �Ser� confiable la estimaci�n realizada?



### Agregar la altura promedio al gr�fico



#############################   ACTIVIDAD B   #############################

# 1.b. Exploren las simulaciones realizadas sobre la poblaci�n de talas y resuelvan.

# Le pediremos a R que extraiga muchas muestras de tama�o n = 30.
# Esto les permitir� poder hacer la simulaci�n individualmente.
# Lo haremos en dos pasos:

# Paso 1) Como hicimos en el TP4, empezaremos por crear un data.frame que tenga tantas filas como muestras queremos extraer. Lo llamaremos "muestreo_n30" porque ser�n muestras de tama�o 30.

# Consideraremos �nicamente la variable altura (m)
# Este data frame tendr� cuatro columnas:
# 1a columna: n�mero de la muestra
# 2a columna: media de la muestra
# 3a columna: l�mite inferior del IC del 95%
# 4a columna: l�mite superior del IC del 95%.

cant_muestras <- 100
muestreo_n30 <- data.frame(muestra = 1:cant_muestras, media = NA, LI = NA, LS = NA)
head(muestreo_n30)


# Paso 2) Mediante el comando "for" le pedimos a R que repita una misma acci�n tantas veces como el n�mero de muestras que sacamos ("cant_muestras"). A esto se llama "bucle" o "loop". Esta acci�n llena las columnas del data frame.

# Nota: Las siguientes l�neas de comando se proporcionan s�lo a los fines did�cticos. Saber c�mo hacer un loop excede los objetivos del TP y no ser� evaluado.

for(i in 1:cant_muestras) {
  muestra_n30 <- sample(poblacion_talas$altura, 30, replace = TRUE)
  muestreo_n30$media[i] <- mean(muestra_n30)
  muestreo_n30$LI[i] <- muestreo_n30$media[i] + (qnorm(0.025, 0, 1) * (sqrt(1.57)) / sqrt(30))
  muestreo_n30$LS[i] <- muestreo_n30$media[i] + (qnorm(0.975, 0, 1) * (sqrt(1.57)) / sqrt(30))
}
head(muestreo_n30)


# Ahora veamos si todos los intervalos que construimos a partir de muestras aleatorias contienen el par�metro mu.
# �Cu�nto fue la cobertura de su simulaci�n (n�mero de IC que contienen a mu)?


# Con el siguiente comando podemos ver, si los hay, aquellos intervalos que no incluyen a mu por arriba
cobertura_S1arr<-subset(muestreo_n30, LI > mu)
cobertura_S1arr

# Con el siguiente comando podemos ver, si los hay, aquellos intervalos que no incluyen a mu por debajo

cobertura_S1deb <-round(subset(muestreo_n30, LS < mu),3)
cobertura_S1deb

## RESPUESTA:


# Representaci�n gr�fica de los intervalos obtenidos (La l�nea horizontal roja representa el valor de la media poblacional, mu = 4.63 m)
# Nota: Las siguientes l�neas de comando se proporcionan s�lo a los fines did�cticos.

plot(x = 1:100, y = muestreo_n30$media, ylim = c(min(muestreo_n30$LI), max(muestreo_n30$LS)), main = "IC 95% | Simulaci�n 1", xlab = "Muestra", ylab = "Altura media (m)", type = "n")
arrows(x0 = 1:100, y0 = muestreo_n30$LI, x1 = 1:100, y1 = muestreo_n30$LS, length = 0, lwd = 1.5)
abline(h = mu, col = 2)
arrows(x0 = cobertura_S1deb$muestra, y0 = cobertura_S1deb$LI, x1 = cobertura_S1deb$muestra, y1 = cobertura_S1deb$LS, col = 4, length = 0, lwd = 2)
arrows(x0 = cobertura_S1arr$muestra, y0 = cobertura_S1arr$LI, x1 = cobertura_S1arr$muestra, y1 = cobertura_S1arr$LS, col = 6, length = 0, lwd = 2)


# Chequ�en en el gr�fico la cobertura de su simulaci�n (n�mero de IC que contienen a mu) solo para verificar que les coincide con el valor de arriba

######################################################################### #

## Repitan nuevamente la simulaci�n, pero agreguen en la tercera columna el c�lculo de la varianza de cada muestra. Analicen la cobertura de la simulaci�n


muestreo_n30.2 <- data.frame(muestra = 1:cant_muestras, media = NA, var = NA, LI = NA, LS = NA)
head(muestreo_n30.2)
for(i in 1:cant_muestras) {
  muestra_n30 <- sample(poblacion_talas$altura,30, replace=TRUE)
  muestreo_n30.2$media[i] <- mean(muestra_n30)
  muestreo_n30.2$var[i] <- var(muestra_n30)
  muestreo_n30.2$LI[i] <- muestreo_n30.2$media[i] + (qt(0.025, 29) * (sqrt(muestreo_n30.2$var[i])) / sqrt(30))
  muestreo_n30.2$LS[i] <- muestreo_n30.2$media[i] + (qt(0.975, 29) * (sqrt(muestreo_n30.2$var[i])) / sqrt(30))
}
head(muestreo_n30.2)


# Cobertura
cobertura_S2arr <- subset(muestreo_n30.2, LI > mu)
cobertura_S2deb <- subset(muestreo_n30.2, LS < mu)

cobertura_S2arr 
cobertura_S2deb 

# Representaci�n gr�fica de los intervalos obtenidos (La l�nea horizontal roja representa el valor de la media poblacional, mu = 4.63 m)

plot(x = 1:100, y = muestreo_n30.2$media, ylim = c(min(muestreo_n30.2$LI), max(muestreo_n30.2$LS)), main = "IC 95% | Simulaci�n 2 (sigma desconocido)", xlab = "Muestra", ylab = "Altura media (m)", type = "n")
arrows(x0 = 1:100, y0 = muestreo_n30.2$LI, x1 = 1:100, y1 = muestreo_n30.2$LS, length = 0, lwd = 1.5)
abline(h = mu, col = 2)
arrows(x0 = cobertura_S2deb$muestra, y0 = cobertura_S2deb$LI, x1 = cobertura_S2deb$muestra, y1 = cobertura_S2deb$LS, col = 4, length = 0, lwd = 2)
arrows(x0 = cobertura_S2arr$muestra, y0 = cobertura_S2arr$LI, x1 = cobertura_S2arr$muestra, y1 = cobertura_S2arr$LS, col = 6, length = 0, lwd = 2)



## Comparen la longitud de los IC. �A qu� se deben las diferencias?



## RESPUESTA:



#############################   ACTIVIDAD C   #############################

# Repetiremos la simulaci�n de la Actividad B para la variable DAP (cm). Queremos estimar el DAP medio de la poblaci�n con una confianza  del 90 %, suponiendo que conocemos sigma.
# Adapten el script del ejemplo anterior para cumplir este objetivo. La varianza poblacional deben calcularla con el siguiente comando, utilizado en el TP4:

varp <- function(x) mean((x-mean(x))^2)
Var_DAP<- varp(poblacion_talas$DAP)



################################################################## #
#### Addenda: 1) Comando r�pido para estimar  el IC de una muestra ####

# Hasta ac� construimos IC a mano (usando R como calculadora) para que pudieran comprender en qu� consisten los IC. Pero en R se pueden construir r�pidamente mediante un comando sencillo, v�lido solo en caso de no conocer sigma, que es lo habitual. Para hacerlo deben instalar previamente algunos paquetes y llamar a la librer�a Rmisc:

install.packages("Rmisc")
install.packages("lattice")
install.packages("plyr")
library(Rmisc)

# Acost�mbrense a pedir ayudas a R cuando tienen dudas sobre alguna funci�n:
?CI()


# Ej para la altura tomando la muestra de n = 30 obtenida en el punto anterior
CI(muestra_n30_1, ci = 0.95)


####### 2) otra forma de graficar IC con ggplot

library(ggplot2)
ggplot(data = muestreo_n30) +
  geom_errorbar(aes(x = muestra, ymin = LI, ymax = LS), lwd = 1.05, col ="darkgreen") +
  geom_hline(yintercept = 4.63, lwd = 1.025, colour = "red") +
  xlab("IC 95% - Simulaci�n  1 (sigma conocido)") +
  ylab("Altura (metros)") +
  scale_x_continuous(breaks = NULL, limits = c(0, 100)) +
  scale_y_continuous(limits = c(3, 7), labels = as.character(seq(0, 10, 2)),
                     breaks = seq(0, 10, 2))

library(ggplot2)
ggplot(data = muestreo_n30.2) +
  geom_errorbar(aes(x = muestra, ymin = LI, ymax = LS), lwd = 1.05, col ="blue") +
  geom_hline(yintercept = 4.63, lwd = 1.025, colour = "red") +
  xlab("IC 95% - Simulaci�n 2 (sigma desconocido)") +
  ylab("Altura (metros)") +
  scale_x_continuous(breaks = NULL, limits = c(0, 100)) +
  scale_y_continuous(limits = c(3, 7), labels = as.character(seq(0, 10, 2)),
                     breaks = seq(0, 10, 2))



### 3) Sugerencia bibliogr�fica: ver Oddi et al. (2018) Ambig�edades en t�rminos cient�ficos: El uso del "error" y el "sesgo" en estad�stica. Ecolog�a Austral 28:525-536
