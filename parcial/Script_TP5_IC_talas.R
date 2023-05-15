rm(list = ls())

######################################################################### #
######################         	TP 5      	       ###################### #
######################   Intervalos de confianza   ###################### #
######################################################################### #

# Vamos a retomar el problema 1 del TP1. Recordemos de qué se trataba:

# Los talares bonaerenses constituyen el principal bosque nativo de la provincia de Buenos Aires. Sin embargo, se encuentran en continua reducción. Su superficie actual es mucho menor que la original, que se extendía desde el norte de la provincia de Buenos Aires sobre una estrecha franja costera que llegaba hasta Mar del Plata. Esta es la zona más poblada de Argentina y, donde la urbanización creció, los talares desaparecieron casi totalmente.

# Para poder tomar medidas adecuadas de manejo para evitar su desaparición total, es necesario tener una estimación del estado actual de los remanentes de talar que todavía perduran.

#############################   ACTIVIDAD A   #############################

# A continuación vamos a simular la extracción de muestras aleatorias de tamaño n a partir de una población de 500 talas (Celtis ehrenbergiana) de la reserva "El Destino" (partido de Magdalena).

## Carguen la base de datos BD_poblacion_talas.txt, asígnenla a un objeto llamado "poblacion_talas".



## Trabajaremos con la variable altura. Su varianza poblacional es de 1.57m2 (Ver TP 4)

# 1) Tomen tres muestras aleatorias de tamaño 30 de la variable altura mediante el comando "sample"

# Ejemplo para la muestra 1

muestra_n30_1 <- sample(poblacion_talas$altura, 30, replace = TRUE)
muestra_n30_1

# Generen ustedes las  muestra 2 y 3




## 2) Calculen la media (nombrar objetos como x.raya_1, x.raya_2 y x.raya_3) y el desvío estándar (nombrar objetos como sd_1, sd_2, sd_3) de las muestras.

# ej:
x.raya_1 <- mean(muestra_n30_1)
sd_1 <- sd(muestra_n30_1)

# muestra 2 y 3

x.raya_2 <- 
sd_2 <- 

x.raya_3 <- 
sd_3 <- 


# Conociendo estos estadísticos, vamos a estimar la media poblacional mediante un INTERVALO DE CONFIANZA (IC). Es decir, vamos a dar dos valores entre los que, con una determinada confianza, esperamos se encuentre el valor de mu. La confianza la vamos a fijar nosotros de antemano en 95% (aproximadamente 2 desvíos alrededor de x_raya). Este nivel de confianza (95%) es el más usual en investigaciones biológicas y paleontológicas.

#### Construcción del IC ####

# Un IC se construye sumando y restando el error muestral (EM) al estimador del parámetro (en este caso x.raya).
# El EM se calcula como el producto de un valor crítico (VC) por el Error Estándar (EE). Esto es:
#      	X_raya +- EM
#      	X_raya +- VC*EE

# El valor crítico se calcula a partir de una distribución normal estándar (z) cuando se conoce sigma (desvío poblacional), o la distribución t cuando sigma es desconocido

# El EE es la variabilidad del estimador


## 3) Con las muestras 1, 2 y 3 estimaremos la altura media de la población de talas con una confianza del 95 %. Para ello comenzaremos calculando el valor crítico y el error muestral.

VC.sup <- qnorm(0.975, 0, 1)
VC.sup
VC.inf <- qnorm(0.025, 0, 1)
VC.inf

# ¿Por qué les parece que pedimos esos cuantiles? Si tienen dudas, pueden consultar la teórica correspondiente al tema "Estimación de parámetros".

curve(dnorm(x, mean= 0,sd= 1), xlim=c(-4, 4),col = 1, lwd = 2)
abline(v=VC.inf)
abline(v=VC.sup, col = 2)


# Calculen el EE usando R como calculadora. Asígnenlo al objeto "EE".

EE<-sqrt(1.57)/sqrt(30)
  
# ¿Tiene unidades?

# Ahora que conocen el VC y el EE, pueden calcular el EM. Calculen un EM con cada uno de los VC calculados arriba (VC.sup y VC.inf)

EM.sup <-VC.sup*EE
EM.inf <-VC.inf*EE
  
  
# Ahora solo falta sumar y restar, respectivamente, estos EM a las tres X.raya que se obtuvieron antes para obtener los límites superior e inferior de los IC.
  
# Ejemplo para la muestra 1
LS_1 <- x.raya_1 + EM.sup
LI_1 <- x.raya_1 + EM.inf

# ¿Por qué les parece que sumamos en ambos casos?

# Finalmente:
c(LI_1, LS_1)

# ¿Cuál es la conclusión biológica de este resultado?


###


# 4) Repitan ustedes el procedimiento para las muestras 2 y 3:

LS_2 <- 
LI_2 <- 

c(LI_2, LS_2)

LS_3 <- 
LI_3 <- 

c(LI_3, LS_3)


# 5) Estimen la altura media de la población de talas, con una confianza
# del 95 %, conociendo solo X_raya y el desvío estándar (s) a partir de cada una de las tres muestras.

# Como no conocemos sigma, no podemos usar la función "qnorm()". Exploren la que vamos a usar:

?qt()

# Ejemplo para la muestra 1:
VC.sup_1 <- qt(0.975, 29)

# ¿Qué representa el valor 29 que se incluyó dentro de la función?

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


#  RESPUESTA de la estimación:


# Comparemos los IC calculados con sigma conocido y sigma desconocido para la misma muestra.
c(LI_1, LS_1)

# ¿Qué diferencias encuentran? ¿A qué creen que se debe?


# Ahora vamos a verificar cómo fue nuestra estimación del parámetro poblacional. Ésto no se podrá hacer habitualmente ya que no realizarían una estimación de parámetros poblaciones si ya los conocen.

## 6) Calculen la media poblacional y asígnenla a un objeto llamado "mu"

mu <-
mu


# ¿Cuáles son los supuestos para realizar la estimación de la media poblacional de la altura en el punto 3 y 4? 

  # 1) 
  # 2) 
  # 3) 
  

  # ¿Cuál es la forma de la distribución de la altura? ¿Será confiable la estimación realizada?



### Agregar la altura promedio al gráfico



#############################   ACTIVIDAD B   #############################

# 1.b. Exploren las simulaciones realizadas sobre la población de talas y resuelvan.

# Le pediremos a R que extraiga muchas muestras de tamaño n = 30.
# Esto les permitirá poder hacer la simulación individualmente.
# Lo haremos en dos pasos:

# Paso 1) Como hicimos en el TP4, empezaremos por crear un data.frame que tenga tantas filas como muestras queremos extraer. Lo llamaremos "muestreo_n30" porque serán muestras de tamaño 30.

# Consideraremos únicamente la variable altura (m)
# Este data frame tendrá cuatro columnas:
# 1a columna: número de la muestra
# 2a columna: media de la muestra
# 3a columna: límite inferior del IC del 95%
# 4a columna: límite superior del IC del 95%.

cant_muestras <- 100
muestreo_n30 <- data.frame(muestra = 1:cant_muestras, media = NA, LI = NA, LS = NA)
head(muestreo_n30)


# Paso 2) Mediante el comando "for" le pedimos a R que repita una misma acción tantas veces como el número de muestras que sacamos ("cant_muestras"). A esto se llama "bucle" o "loop". Esta acción llena las columnas del data frame.

# Nota: Las siguientes líneas de comando se proporcionan sólo a los fines didácticos. Saber cómo hacer un loop excede los objetivos del TP y no será evaluado.

for(i in 1:cant_muestras) {
  muestra_n30 <- sample(poblacion_talas$altura, 30, replace = TRUE)
  muestreo_n30$media[i] <- mean(muestra_n30)
  muestreo_n30$LI[i] <- muestreo_n30$media[i] + (qnorm(0.025, 0, 1) * (sqrt(1.57)) / sqrt(30))
  muestreo_n30$LS[i] <- muestreo_n30$media[i] + (qnorm(0.975, 0, 1) * (sqrt(1.57)) / sqrt(30))
}
head(muestreo_n30)


# Ahora veamos si todos los intervalos que construimos a partir de muestras aleatorias contienen el parámetro mu.
# ¿Cuánto fue la cobertura de su simulación (número de IC que contienen a mu)?


# Con el siguiente comando podemos ver, si los hay, aquellos intervalos que no incluyen a mu por arriba
cobertura_S1arr<-subset(muestreo_n30, LI > mu)
cobertura_S1arr

# Con el siguiente comando podemos ver, si los hay, aquellos intervalos que no incluyen a mu por debajo

cobertura_S1deb <-round(subset(muestreo_n30, LS < mu),3)
cobertura_S1deb

## RESPUESTA:


# Representación gráfica de los intervalos obtenidos (La línea horizontal roja representa el valor de la media poblacional, mu = 4.63 m)
# Nota: Las siguientes líneas de comando se proporcionan sólo a los fines didácticos.

plot(x = 1:100, y = muestreo_n30$media, ylim = c(min(muestreo_n30$LI), max(muestreo_n30$LS)), main = "IC 95% | Simulación 1", xlab = "Muestra", ylab = "Altura media (m)", type = "n")
arrows(x0 = 1:100, y0 = muestreo_n30$LI, x1 = 1:100, y1 = muestreo_n30$LS, length = 0, lwd = 1.5)
abline(h = mu, col = 2)
arrows(x0 = cobertura_S1deb$muestra, y0 = cobertura_S1deb$LI, x1 = cobertura_S1deb$muestra, y1 = cobertura_S1deb$LS, col = 4, length = 0, lwd = 2)
arrows(x0 = cobertura_S1arr$muestra, y0 = cobertura_S1arr$LI, x1 = cobertura_S1arr$muestra, y1 = cobertura_S1arr$LS, col = 6, length = 0, lwd = 2)


# Chequéen en el gráfico la cobertura de su simulación (número de IC que contienen a mu) solo para verificar que les coincide con el valor de arriba

######################################################################### #

## Repitan nuevamente la simulación, pero agreguen en la tercera columna el cálculo de la varianza de cada muestra. Analicen la cobertura de la simulación


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

# Representación gráfica de los intervalos obtenidos (La línea horizontal roja representa el valor de la media poblacional, mu = 4.63 m)

plot(x = 1:100, y = muestreo_n30.2$media, ylim = c(min(muestreo_n30.2$LI), max(muestreo_n30.2$LS)), main = "IC 95% | Simulación 2 (sigma desconocido)", xlab = "Muestra", ylab = "Altura media (m)", type = "n")
arrows(x0 = 1:100, y0 = muestreo_n30.2$LI, x1 = 1:100, y1 = muestreo_n30.2$LS, length = 0, lwd = 1.5)
abline(h = mu, col = 2)
arrows(x0 = cobertura_S2deb$muestra, y0 = cobertura_S2deb$LI, x1 = cobertura_S2deb$muestra, y1 = cobertura_S2deb$LS, col = 4, length = 0, lwd = 2)
arrows(x0 = cobertura_S2arr$muestra, y0 = cobertura_S2arr$LI, x1 = cobertura_S2arr$muestra, y1 = cobertura_S2arr$LS, col = 6, length = 0, lwd = 2)



## Comparen la longitud de los IC. ¿A qué se deben las diferencias?



## RESPUESTA:



#############################   ACTIVIDAD C   #############################

# Repetiremos la simulación de la Actividad B para la variable DAP (cm). Queremos estimar el DAP medio de la población con una confianza  del 90 %, suponiendo que conocemos sigma.
# Adapten el script del ejemplo anterior para cumplir este objetivo. La varianza poblacional deben calcularla con el siguiente comando, utilizado en el TP4:

varp <- function(x) mean((x-mean(x))^2)
Var_DAP<- varp(poblacion_talas$DAP)



################################################################## #
#### Addenda: 1) Comando rápido para estimar  el IC de una muestra ####

# Hasta acá construimos IC a mano (usando R como calculadora) para que pudieran comprender en qué consisten los IC. Pero en R se pueden construir rápidamente mediante un comando sencillo, válido solo en caso de no conocer sigma, que es lo habitual. Para hacerlo deben instalar previamente algunos paquetes y llamar a la librería Rmisc:

install.packages("Rmisc")
install.packages("lattice")
install.packages("plyr")
library(Rmisc)

# Acostúmbrense a pedir ayudas a R cuando tienen dudas sobre alguna función:
?CI()


# Ej para la altura tomando la muestra de n = 30 obtenida en el punto anterior
CI(muestra_n30_1, ci = 0.95)


####### 2) otra forma de graficar IC con ggplot

library(ggplot2)
ggplot(data = muestreo_n30) +
  geom_errorbar(aes(x = muestra, ymin = LI, ymax = LS), lwd = 1.05, col ="darkgreen") +
  geom_hline(yintercept = 4.63, lwd = 1.025, colour = "red") +
  xlab("IC 95% - Simulación  1 (sigma conocido)") +
  ylab("Altura (metros)") +
  scale_x_continuous(breaks = NULL, limits = c(0, 100)) +
  scale_y_continuous(limits = c(3, 7), labels = as.character(seq(0, 10, 2)),
                     breaks = seq(0, 10, 2))

library(ggplot2)
ggplot(data = muestreo_n30.2) +
  geom_errorbar(aes(x = muestra, ymin = LI, ymax = LS), lwd = 1.05, col ="blue") +
  geom_hline(yintercept = 4.63, lwd = 1.025, colour = "red") +
  xlab("IC 95% - Simulación 2 (sigma desconocido)") +
  ylab("Altura (metros)") +
  scale_x_continuous(breaks = NULL, limits = c(0, 100)) +
  scale_y_continuous(limits = c(3, 7), labels = as.character(seq(0, 10, 2)),
                     breaks = seq(0, 10, 2))



### 3) Sugerencia bibliográfica: ver Oddi et al. (2018) Ambigüedades en términos científicos: El uso del "error" y el "sesgo" en estadística. Ecología Austral 28:525-536
