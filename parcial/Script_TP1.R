rm(list=ls())
setwd("C:\\...\\TP_1")
################################################################ #
###################            TP1             ################# #
###################   Estadística descriptiva  ################# #
################################################################ #

# Lean la siguiente introducción acerca de los talares bonaerenses: 

# Los talares bonaerenses constituyen el principal bosque nativo de la provincia de Buenos Aires. Sin embargo, se encuentran en continua reducción. Su superficie actual es mucho menor que la original, que se extendía desde el norte de la provincia de Buenos Aires, en una estrecha franja costera que llegaba hasta Mar del Plata. Esta es la zona más poblada de Argentina y... donde las ciudades crecieron, los talares desaparecieron casi totalmente. 

# A fin de poder tomar medidas adecuadas de manejo para evitar su desaparición total, es necesario tener una estimación del estado actual de los remanentes de talar que todavía perduran.

# A continuación vamos a simular la extracción de muestras aleatorias de tamaño n, a partir de una población de 500 talas (Celtis ehrenbergiana) de la reserva "El Destino" (partido de Magdalena).

# El simulador que vamos a utilizar fue diseñado y desarrollado por el Lic. Oscar Lehmann, docente de Biometría durante el año 2018. Para instalarlo sigan los siguientes pasos:

# 1) Descarguen del campus el archivo "Simulador_talas.R" y guárdenlo en el mismo directorio en que guardaron el presente Script (Script_TP1.R). 

# 2) Corran las siguientes líneas y luego minimicen el simulador para seguir leyendo este script:
install.packages("shiny")  
source("Simulador_talas.R")
app_muestreo

# Empecemos a simular los muestreos:

# 1) Tomen muestras de n = 5, n = 25 y n = 50 (en ese orden, ya que guardaremos la última). ¿Se seleccionan siempre las mismas unidades experimentales?

# 2) Cierren la aplicación cuando tengan seleccionada una muestra de tamaño n = 50. Automáticamente se les habrá creado un archivo R llamado "muestra_talas", que quedará guardado en el directorio en el que están trabajando.

# 3) Cárguenlo en RStudio mediante el siguiente comando:
load("muestra_talas.R")

# 4) Asígnenle un nombre más corto, para trabajar más cómodamente:
datos <- muestra_talas

# 5) Observen la base de datos e indiquen de qué clase es.


# 6) ¿Cuántas variables se relevaron? ¿Cómo se llaman?


############################################################################# # ### Un poco de terminología botánica:

# La "fenología" hace referencia al ciclo de vida de los seres vivos. 

# "DAP" es el acrónimo de "diámetro a la altura del pecho". Es una medida que se toma muy frecuentemente en los árboles, y en realidad se toma a 1,3 metros a partir del suelo, sin importar la altura de la persona que registra el dato.

# Los talas suelen desarrollar varios troncos principales a los que suelen llamarse "fustes".
############################################################################# #


# ¿Las variables registradas son aleatorias? ¿Por qué? ¿De qué tipo es cada una (cuali o cuantitativas, continuas o discretas)? Fíjense si R las consideró igual que ustedes.


# Vamos a pedirle a R que nos resuma algunos valores que sirven para describir la muestra (estadísticos):
summary(datos)


# 1) ¿Cuáles son los límites superiores e inferiores de las variables cuantitativas?


# 2) ¿Qué significan "1st Qu.", "Median", "Mean" y "3rd Qu."? Comparen estos valores con los obtenidos por sus compañeros. ¿Corresponden a valores poblacionales o muestrales?

# 3) ¿Qué representan los valores que en la salida del "summary" aparecen asociados a las variables "fenología" y "estado_de_salud"? Recuerden que si R las tomó como “character”, deben pasarlas a “factor”.

# 4) Pídanle a R que les muestre el resumen de estadísticos de una variable en particular.



# También se podría pedir el valor de un estadístico en particular. En el TP 0 vimos algunos ("mean()", "min()" y "max()"). Ahora conozcamos otros:

# MEDIANA:         
median(datos$altura)
# ¿Qué indica este estadístico?
# AYUDA: ordenen los datos de menor a mayor y observen en qué ubicación se encuentra la mediana. Para ordenar los datos usen el siguiente comando:
sort(datos$altura)

# ¿Qué unidades tendrá la mediana? (Recuerden que siempre hay que indicar la unidad)

# CUANTILES:
# Los cuantiles pueden ser percentiles, cuartiles, etc., según el número de partes en que se dividen los valores de la muestra cuando están ordenados de menor a mayor. Si no aclaramos en cuántas partes queremos dividirla, R nos muestra el mínimo, los cuartiles y el máximo. Observen:
quantile(datos$altura)

# Si queremos calcular un PERCENTIL en particular, hay que aclararlo. Por ejemplo:
quantile(datos$altura, 0.30)
# Interpreten el resultado en términos biológicos. ¿En qué unidades se expresará?

# RANGO o AMPLITUD:
# En el TP_0 lo calcularon a mano, pero también se puede calcular mediante el uso del siguiente comando rápido:
range(datos$altura) 

# VARIANZA y DESVÍO ESTÁNDAR:
var(datos$altura)
sd(datos$altura)
# ¿Qué información dan y en qué unidades se expresan?

# ¿Qué variable posee mayor variabilidad, la altura o el DAP?

# ¿Pueden compararse variables con distintas medias? ¿Qué estadístico se debería  usar en ese caso? 


################################################################ #
################   ACTIVIDAD PARA realizar SOLOS   ###############
################################################################ #

# 1) ¿Cuánto miden como máximo el 25% de los talas más bajos de la muestra? 
# 2) ¿Cuánto miden como mínimo el 30% de los talas más altos?
# 3) ¿Cuánto miden como máximo el 50% de los talas con menor DAP? ¿De qué otra manera puede calcularse este valor?
# 4) ¿Pueden calcularse estos estadísticos para las variables fenología y estado de salud? ¿Por qué?
# 5) ¿Cuál es la variabilidad de alturas en una muestra de 5 talas que miden: 10.7, 7.5, 9.5, 8.6 y 8.0 metros, Resuélvanlo usando R como calculadora. 

######################################################################## #
##########################    GRÁFICOS Y TABLAS   ########################
######################################################################## #

# La información también puede ser resumida y visualizada a partir de gráficos y tablas.

# HISTOGRAMA:

# Es un tipo de gráfico que representa la distribución de frecuencias de una variable cuya escala ha sido dividida en clases o intervalos. Veamos un ejemplo:
histograma1<-hist(datos$altura)

# ¿Qué indica cada eje? ¿Por qué decimos que la variable ha sido dividida en intervalos?

# Comparen este histograma con el obtenido por otros compañeros. Discutan a qué se debe que haya diferencias. 

# ¿Les parece bien el número de intervalos que tiene el histograma que obtuvieron? Si no están de acuerdo, construyan un nuevo histograma siguiendo estos pasos:

# 1) Se buscan los valores extremos que toma la variable.
min <- min(datos$altura)
max <- max(datos$altura)

# 2) Se decide la cantidad de cortes para generar los intervalos que tendrá el histograma: 
cant_cortes <- sqrt(length(datos$altura))
# ¿Qué le están pidiendo a R que haga? Invoquémoslo para verificar si es así:
cant_cortes

# 3) Cómo se obtuvo un número con infinitos decimales, le pedimos que lo redondee hasta las unidades:
cant_cortes_red <- round(cant_cortes)
cant_cortes_red

# 3) Creamos una secuencia de números formada por los límites inferior y superior de cada intervalo, teniendo en cuenta el número de intervalos deseado:
intervalos <- seq(min, max, by = ((max-min)/cant_cortes_red))
intervalos

# $) Construimos el nuevo histograma:
hist(datos$altura, breaks = intervalos, col = "orange", main = "Mi histograma")

# ¿Se logró el número de intervalos deseado? ¿Por qué es de color naranja?

######################################################################## #
# ACLARACIÖN: 
# Mediante la función "hist()", R toma el número de cortes (breaks) para armar los intervalos, solo como una sugerencia. Se pueden lograr gráficos tal cual uno los desea, instalando en R librerías específicas y dándole todos los detalles necesarios. Sin embargo, en esta materia no vamos a exigir ese grado de detalle, sino que nos conformaremos con lograr el número de intervalos aproximado que ofrece la función "hist()".
####################################################################### #

# También se pueden hacer histogramas con las frecuencias relativas. Observen:
hist(datos$altura, freq=FALSE, breaks = intervalos, col = "orange",  main = "Mi histograma")
# ¿Qué cambió en la sentencia?

# Construyan un histograma de otra variable relevada para los talas. Dénle color azul (blue) u otro que les guste y pónganle un título adecuado. 
# ACLARACIÓN: pueden dejar el número de intervalos que les propone R.

######################################################################## #

# Ahora vamos a trabajar con datos de una variable discreta:

# A partir de la variable "cantidad_fustes", cuenten cuántos árboles poseen 1, 2, 3, ..., n fustes.
datos$cantidad_fustes
# También podríamos usar la función vista anteriormente "sort()"


# Con esa información, construyan (a mano) una TABLA DE FRECUENCIAS (como la siguiente):

# Variable (X) # Frecuencia absoluta (FA) #
######################################### #
#     1        #                          # 
#     2        #                          #
#     .        #                          #
#     .        #                          #
#     .        #                          #
#     n        #                          #

# R nos muestra la misma información mediante la siguiente función:
frecuencia <- table(datos$cantidad_fustes)
frecuencia
# ¿Qué diferencia encuentran con respecto a la tabla construida a mano?

# ¿Qué valores tomó la variable? ¿Cuál es el máximo valor que tomó? ¿Significa que los talas de esta población tienen como máximo esa cantidad de fustes? 

# ¿Cuánto debería ser la suma de todas las FA? Compruébenlo.
sum(frecuencia)

# La distribución de este tipo de datos se grafica mediante un GRÁFICO DE BARRAS:
barras_FA <- barplot(frecuencia, main="cantidad de fustes", xlab="cantidad de fustes")
# Observen que la función para graficar ya no es "hist()". ¿Cómo se llama en este caso?

# ¿Qué diferencia presenta con respecto a un histograma?

# Vuelvan a graficar, pero esta vez omitiendo el título principal del gráfico.


# El gráfico de barras también puede realizarse con frecuencias relativas (FR). Para eso, se divide el elemento "frecuencia"  (es decir, los valores de FA de la tabla), por la suma de las FA:
frecuencia/sum(frecuencia)

# Prueben la función:
prop.table(frecuencia)
#¿Qué información devuelve? 

# Ahora creamos el elemento "frecuencia_rel" para poder graficarlo:
frecuencia_rel <- prop.table(frecuencia)
barplot(frecuencia_rel, main="cantidad_fustes", xlab="cantidad de fustes")

# ¿Cuánto debería ser la suma de todas las frecuencias relativas? Compruébenlo usando una función de R.


######################################################################## #
# Los gráficos se pueden exportar y guardar en formatos pdf, JPEG, TIFF u otros. Para eso vayan a la solapa "Export" en la ventana donde ven el gráfico. 

# Otra opción con la que se obtienen gráficos de mejor calidad consiste en anteponer "windows()" ("X11()" en el caso de GNU/Linux) a la función del gráfico. Observen:
windows()
barplot(frecuencia_rel, main="cantidad_fustes", xlab="cantidad de fustes")

# En el menú de la nueva ventana se encuentran las opciones para guardar el gráfico creado.
######################################################################## #

# GRÁFICOS DE FRECUENCIAS ACUMULADAS:

# La suma acumulada se puede obtener con el comando cumsum()
cumsum(frecuencia)

# Ahora graficamos la frecuencia acumulada indicando los valores correspondientes del eje x, con el comando names()
plot(cumsum(frecuencia), x = names(frecuencia), type = "s")

# ¿Cómo se interpreta este gráfico? ¿Por qué creen que tiene forma de escalera?

# ¿Prueben construir el gráfico de frecuencias relativas acumuladas para la misma variable, rotulando adecuadamente el eje Y

######################################################################## #
# OBSERVACIÖN:
# Si miran con atención, verán que el gráfico se corta en el último valor alcanzado por la variable. Sin embargo, las curvas de frecuencias acumuladas se extienden hasta el infinito. Para lograr este efecto, vamos a instalar la librería "ggplot2", que permite construir gráficos personalizados.

library(ggplot2)
ggplot(datos, aes(cantidad_fustes))+stat_ecdf(geom = "step", pad = TRUE)+
  xlab("Cantidad de fustes")+ylab("FRA")

# ACLARACIÓN: Los gráficos con la librería "ggplot2" exceden los conocimientos que pretendemos que se lleven de esta materia. por lo que no nos detendremos en explicar los detalles y no serán evaluados. Pero si desean incursionar más en las posibilidades que brinda esta librería, pueden pedirnos información a través del foro que se encuentra en la pestaña "Material extra" del aula virtual.
######################################################################## #

# Continuemos con nuestra actividad...

# A medida que los árboles crecen en altura, también suele aumentar su DAP. ¿ Sucede con los talas de esta muestra? Realicen algún gráfico para hallar la respuesta.


# ¿Cómo se llama este tipo de gráfico?

# Mejoremos el gráfico agregándole los nombres y unidades a cada eje: 
plot(datos$DAP ~ datos$altura, ylab = "DAP (cm)", xlab = "Altura (m)")

# Aclaración: El símbolo ~ se llama virgulilla y simboliza "en función de"

# ¿Qué pueden decir acerca de la relación DAP vs. altura? ¿Todos obtuvieron el mismo gráfico? ¿Por qué?


# GRÁFICO DE CAJAS:

# Este gráfico permite visualizar la distribución de datos dándonos información sobre ciertos cuantiles. Observen y señalen de qué cuantiles se trata: 
boxplot(datos$altura, ylab = "altura (m)")

# Agréguenle al gráfico un título. Por ejemplo: "Altura de talas"



################################################################ #
######################   Material Extra  #########################
################################################################ #


# En esta sección encontrarán los pasos para construir una tabla de frecuencias completa en R.

# PARA VARIABLES CONTINUAS (AGRUPAR DATOS):

# "Cortamos" la variable en tantas clases como queramos (ej. raíz de n) con el comando cut(). Con este comando estamos discretizando una variable continua y pasándola a formato factor.
cut(datos$altura, sqrt(50))

# Hacemos una tabla de frecuencia con el comando table() y la asignamos a un objeto
tabla <- table(cut(datos$altura, sqrt(50)))

# Extraemos las clases de la tabla y las asignamos a un vector
clase <- names(tabla)

# Extraemos las frecuencias absolutas de la tabla y las asignamos a un vector
fa <- as.vector(tabla)

# Calculamos las frecuencias absolutas acumuladas y las asignamos a un vector
faa <- cumsum(fa)

# Calculamos las frecuencias relativas y las asignamos a un vector
fr <- prop.table(fa)

# Calculamos las frecuencias relativas acumuladas y las asignamos a un vector
fra <- cumsum(fr)

# Unimos todos los vectores en un data frame
data.frame(clase, fa, faa, fr, fra)

# Si lo deseamos, guardamos la tabla completa en un objeto
altura <- data.frame(clase, fa, faa, fr, fra)

# PARA VARIABLES DISCRETAS

# La metodología es la misma salvo que no es necesario discretizar la variable

tabla <- table(datos$cantidad_fustes)
X <- names(tabla)
FA <- as.vector(tabla)
FAA <- cumsum(FA)
FR <- prop.table(FA)
FRA <- cumsum(FR)
data.frame(X, FA, FAA, FR, FRA)
fustes <- data.frame(X, FA, FAA, FR, FRA)

