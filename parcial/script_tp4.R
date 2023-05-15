rm(list=ls())

############################################################################################
#############################           Clase            ##################################
#############################             TP 4             ##################################
#############################   Distribución muestral   ##################################
############################################################################################

# Vamos a retomar el problema 1 del TP1. Recordemos de qué se trataba: 

# Los talares bonaerenses constituyen el principal bosque nativo de la provincia de Buenos Aires. Sin embargo, se encuentran en continua reducción. Su superficie actual es mucho menor que la original, que se extendía desde el norte de la provincia de Buenos Aires, en una estrecha franja costera que llegaba hasta Mar del Plata. Esta es la zona más poblada de Argentina y, donde las ciudades crecieron, los talares desaparecieron casi totalmente. 

# Para poder tomar medidas adecuadas de manejo a fin de evitar su desaparición total, es necesario tener una estimación del estado actual de los remanentes de talar que todavía perduran.

# A continuación vamos a simular la extracción de muestras aleatorias de tamaño n a partir de una población de 500 talas (Celtis ehrenbergiana) de la reserva "El Destino" (partido de Magdalena).


#################################   ACTIVIDAD A  ###############################

# Carguen la base de datos BD_poblacion_talas.txt y observen qué información contiene. 
# NOTA: al cargar los datos, nombrenla como "poblacion_talas" para poder correr el resto del script. 


#Esta base de datos simula una población compuesta por 500 árboles, en un área donde se extrajo gran parte de los individuos de mayor tamaño.


#Trabajaremos con la variable altura.
#¿Cómo es la simetría de la distribución de esta variable? Justificar gráficamente.

#¿Cuál es la altura media de los talas de esta población y su dispersión? 
#En R, la función var(x) calcula la varianza de una muestra. Para calcular la varianza poblacional, se puede definir la función: 

varp<-function(x) mean((x-mean(x))^2)

#y luego aplicarla a la variable de interés.


#¿Qué nombre reciben estos valores en la población?


######################  ACTIVIDAD B  #####################

# 1) Vamos a tomar muestras aleatorias con reposición de la variable altura que sean de distinto tamaño (n=5, n=20y n=50), para lo cual usaremos el comando "sample" del paquete "base". 

# Tomen muestras de cada uno de los tamaños y guárdenlas como objetos diferentes. Por ejemplo:
muestra_n5<-sample(poblacion_talas$altura, 5, replace=TRUE)
muestra_n5

# 2) Calculen la media y la varianza de cada una de las muestras. Piensen si corresponde usar los mostrados en la actividad A o los que aprendieron en el TP1

media_muestra_n5<-
  var_muestra_n5<-
  
# 3) Comparen sus resultados con los obtenidos por sus compañeros y discutan la siguiente frase: "Las medias y las varianzas son variables aleatorias". ¿Están de acuerdo? ¿Por qué?
  
  
#####################   ACTIVIDAD C   ##########################

# 1)Automatización de la extracción de muestras.

# Le pediremos a R que extraiga muchas muestras de tamaño n al mismo tiempo. Esto les permitirá poder hacer la simulación individualmente, pudiendo cambiar las condiciones iniciales fácilmente. Lo haremos en dos pasos:

# Paso 1) Crearemos un data frame que tenga tantas filas como muestras queramos extraer. Lo llamaremos "muestreo_500_nx" porque vamos a extraer 500 muestras al azar de un determinado tamaño (n). Este data frame tendrá tres columnas, la primera indicará el numero de la muestra extraída; la segunda, la media de esa muestra; y la tercera, su varianza. 

# Ejemplo para n = 5

cant_muestras<- 500
muestreo_500_n5 <- data.frame(muestra=1:cant_muestras,media=NA, var=NA)
head(muestreo_500_n5)

# Paso 2) Mediante el comando "for" le pedimos a R que repita una misma acción tantas veces como el número de muestras que sacamos ("cant_muestras"). A esto se llama "bucle" o "loop". Esta acción llena las columnas "media" y "var" del data frame. 

#Nota: Las siguientes líneas de comando se proporcionan sólo a los fines didácticos. Saber cómo hacer un loop excede los objetivos del TP y no será evaluado.

for(i in 1:cant_muestras) {
  muestra_n5 <-(sample(poblacion_talas$altura,5, replace=TRUE))
  muestreo_500_n5$media[i] <-mean(muestra_n5)
  muestreo_500_n5$var[i] <-var(muestra_n5)
}
head(muestreo_500_n5)

#Repitan esta operación con muestras de tamaño 20 y 50.


# 1.a) Grafiquen en una misma ventana (comando "par()") la distribución de frecuencias de la variable media para la población y para las 3 muestras:

windows()                           #Cambiar por "X11()" en GNU/Linux o por "quartz()" en MAC 
par(mfrow=c(4,1), mar=c(5,4,1,1))
hist(poblacion_talas$altura, xlim=c(0, 10), ylim=c(0,200))
hist(muestreo_500_n5$media, xlim=c(0, 10), ylim=c(0,200))
hist(muestreo_500_n20$media, xlim=c(0, 10), ylim=c(0,200))
hist(muestreo_500_n50$media, xlim=c(0, 10), ylim=c(0,200))
par(mfrow=c(1,1))

# Comparen las cuatro distribuciones ¿Qué conclusiones pueden sacar con respecto a la forma, la media y la varianza? ¿Con qué concepto visto en la teórica de distribuciones muestrales lo pueden relacionar?


# El desvío de la variable media recibe el nombre de ERROR ESTANDAR

# 1-b) ¿Qué sucede con la varianza de la distribución de medias a medida que aumenta el n?


# En base a lo que vieron en la teórica, ¿pueden deducir alguna relación por la cual cambia la varianza de la variable media respecto de la varianza original?


# 2) Ahora compararemos la forma de la distribución de frecuencias obtenida de la variable altura media de talas obtenida para cada tamaño de muestra n (5, 20 y 50) con la forma de la distribución de probabilidades del modelo normal. Tener en cuenta que el eje "y" del gráfico ya no es frecuencia sino una función de densidad de probabilidad f(x).

media_original<-mean(poblacion_talas$altura)
SD_original<-sqrt(varp(poblacion_talas$altura)) 

windows()
par(mfrow=c(4,1), mar=c(5,4,1,1))
hist(poblacion_talas$altura, xlim=c(2, 10), freq=F ,col = 8 , main ="Original",xlab=NULL)
curve(dnorm(x, mean=media_original,sd=SD_original), col = 2, lwd = 2, add = TRUE)
hist(muestreo_500_n5$media, xlim=c(2, 10),  freq=F ,col = 8 , main ="n= 5" ,xlab=NULL)
curve(dnorm(x, mean=media_original,sd=SD_original/sqrt(5)), col = 2, lwd = 2, add = TRUE)
hist(muestreo_500_n20$media, xlim=c(2, 10),freq=F , col = 8, main = "n= 20",xlab=NULL)
curve(dnorm(x, mean=media_original,sd=SD_original/sqrt(20)), col = 2, lwd = 2, add = TRUE)
hist(muestreo_500_n50$media, xlim=c(2, 10),freq=F , col =8, main ="n= 50",xlab=NULL )
curve(dnorm(x, mean=media_original,sd=SD_original/sqrt(50)), col = 2, lwd = 2, add = TRUE)
par(mfrow=c(1,1))


#3) Comparen los gráficos obtenidos y concluyan.


#####################   ACTIVIDAD D ##########################

# Ahora exploraremos si las características de la distribución de la variable media que ustedes han deducido (forma de la distribución, esperanza y varianza), se mantienen para una variable con una distribución normal.

# Para ello, simularemos una población de ligustros (Ligustrum lucidum), un árbol originario de Asia y muy común en la reserva. Se sabe que la altura de esta población en la reserva presenta una media de 10 m y un desvío de 1 m. A partir de esta información generen 1000 datos de la variable "altura" con distribución normal con media de 10 m y desvió de 1 m usando la función rnorm:

?rnorm
altura<- rnorm(1000, 10, 1)
hist(altura)
cant_muestras <- 500
muestreo_l_500_n20 <- data.frame(muestra=1:cant_muestras,media=NA, var=NA)

#Repitan la simulación extrayendo muestras de tamaño n (5, 20 y 50), al igual que en la actividad C, graficando los histogramas correspondientes a la variable altura media.

#Ej. n=20
for(i in 1:cant_muestras) {
  muestra_n20 <-(sample(altura,20, replace=TRUE))
  muestreo_l_500_n20$media[i] <-mean(muestra_n20)
  muestreo_l_500_n20$var[i] <-var(muestra_n20)
}
head(muestreo_l_500_n20)

windows()
par(mfrow = c(3,1), mar = c(5,4,1,1))
hist(altura, xlim=c(6,14))
hist(muestreo_l_500_n20$media, xlim=c(6,14))
hist(muestreo_l_500_n20$var, xlim=c(0, 4))


#Observen la forma de la distribución de la media y la varianza para la población original y para cada tamaño de muestra. ¿Qué conclusiones pueden sacar? 



#Busquen un posible patrón por el cual cambia la varianza.


#########################   TAREA  #############################################
#TAREA: Completar la actividad propuesta en el campus virtual. 


