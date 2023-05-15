rm(list = ls())

######################################################################## #
##################  Distribuciones de probabilidades  ################## #
##################            Instructivo             ################## #
######################################################################## #

# En este trabajo práctico vamos a trabajar con un simulador que fue diseñado por el Lic. Oscar Lehmann. Para instalarlo, deben tener el archivo "Distribuciones_sim.R" guardado en la misma carpeta en que tienen este script.

####  SIMULADOR DE DISTRIBUCIONES ####

# Corran las siguientes líneas. Luego minimicen el simulador para poder leer las actividades que tienen que realizar con él:

source("Distribuciones_sim.R")
app_distribuciones

# Si no tuvieran instalado el paquete shiny, deberán hacerlo usando el comando install.packages("shiny") 

############################### ACTIVIDAD 1 ##############################

# La simulación se ha convertido en una herramienta de gran utilidad para entender la dinámica de transmisión de enfermedades infecciosas. Nosotros vamos a usar el simulador desarrollado por Oscar Lehmann para plantearnos posibles escenarios de mortalidad para un tipo de virus hipotético.

# Vamos a trabajar con la variable aleatoria ‘Mortalidad’. Esto es, X: número de muertos del total de infectados.

# Esta variable sigue una distribución BINOMIAL, lo que formalmente se escribe así:
#     X ~ Bi (n, pi)

# Para definirla alcanza con conocer los valores de "n" y "pi", donde "pi" (en realidad se escribe con la letra griega) es la probabilidad de éxito. En este caso, pi es la probabilidad de que un individuo muera y "n" es el total sobre el cual se cuenta; en este ejemplo, el número de infectados.

# Pasemos ahora al simulador:

# 1) Suponiendo que este virus tiene una mortalidad del 2%, simulen la curva de probabilidad del número de muertos (pi = 0,02) en grupos de 10 personas infectadas. Trabajen sobre un eje X con rango entre 0 y 10, y un eje Y entre 0 y 0,9. ¿Qué tipo de gráfico es? ¿Por qué se usa este tipo de gráfico? ¿Cómo es su simetría?

# 2) Calculen la esperanza (E[X] = n * pi) y fíjense dónde estará ubicada en el gráfico. Indiquen su significado estadístico y biológico (en el contexto de la infección que estamos simulando).

# 3) Observen cómo cambia el gráfico con distintos valores de n (sin modificar pi). Anímense a probar valores grandes (hasta 1000, por ejemplo, modificando los rangos de los ejes X e Y para poder apreciar bien el gráfico). Cada tanto calculen la esperanza y ubiquenla en el gráfico. ¿Aproximadamente a partir de qué valor de esperanza la curva se hace simétrica?

# 4) Ahora fijen n = 30, ajusten el eje Y entre 0 y 0,6 y el eje X en un rango de 0 a 30, y prueben distintos valores de pi. Nuevamente calculen E(X) y fíjense a partir de qué valor del mismo la curva se hace simétrica. 

# 5) Supongan un escenario en el que el virus tiene una mortalidad del 10% y hay 15 personas infectadas. Simúlenlo y, sin hacer cuentas, estimen la probabilidad de que no muera ninguna de esas personas.

# Ahora lo vamos a calcular con RStudio. Para eso deben primero cerrar el simulador (pueden cliquear sobre el punto rojo que aparece en la barra de la consola).

# A modo de AYUDA, esta vez les vamos a hacer un resumen del cálculo de probabilidades binomiales con R. Pero para las siguientes distribuciones lo van a tener que calcular solos, así que presten atención:



#### BINOMIAL. Cálculo de probabilidades ####

# Ejemplo para X ~ Bi(n = 15 , pi = 0,1):

# Si queremos calcular la probabilidad de que no muera ninguna persona infectada, o sea, P(X = 0):
dbinom(0, 15, 0.1)

# Calculen ustedes la probabilidad de que mueran 2 personas infectadas:


# Si buscamos la probabilidad acumulada hasta 2 inclusive, P(X <= 2), o sea, de que mueran 2, 1 o ninguna persona infectada:
pbinom(2, 15, 0.1)    
# ¿Cuál es la diferencia con la fórmula que escribieron ustedes?      

# La probabilidad de que mueran más de 2 personas infectadas, P(X > 2), es:
pbinom(2, 15, 0.1, lower.tail = FALSE) 
# ¿Por qué les parece que se agrega "lower.tail = FALSE"?

# ATENCIÓN: Observen que FALSE está escrito en mayúscula. Si lo escribieran en minúscula les marcará error. Pero sí podrían escribir solo la F. Comparen:
pbinom(2, 15, 0.1, lower.tail = F)

# Para calcular la probabilidad de que mueran 2 o más personas infectadas, P(X >= 2), hay al menos dos formas. Analícenlas para entenderlas:
pbinom(2, 15, 0.1, lower.tail = FALSE) + dbinom(2, 15, 0.1)
pbinom(1, 15, 0.1, lower.tail = FALSE) 
# ¿Cómo calcularían lo mismo utilizando el complemento?

# Averigüen ustedes cómo calcular la probabilidad de que mueran menos de 2 personas infectadas, P(X < 2). O sea, una o ninguna:

# ¿Cuáles son la media y la varianza de esta distribución? Calcúlenlas con los parámetros n y pi según lo visto en la teórica.


#### BINOMIAL. Tabla ####

# Si bien se pueden realizar los cálculos directamente con dbinom y pbinom, puede resultar útil contar con la tabla completa, es decir, con todos los valores del dominio.

# Generamos un vector que corresponde al dominio de la función.
x <- c(0:15)

# Calculamos las probabilidades para cada uno de los valores de X.
prob <- dbinom(x, 15, 0.1)

# Calculamos las probabilidades acumuladas
acum <- cumsum(prob)

# Calculamos el complemento de las probabilidades acumuladas
comp.acum <- 1 - acum

# Unimos todos los vectores en un data.frame
data.frame(x, prob, acum, comp.acum)

# Redondeamos a 4 dígitos para facilitar la visualización
round(data.frame(x, prob, acum, comp.acum), 4)

# Ubique en la tabla los valores calculados anteriormente: P(X = 0), P(X = 2), P(X <= 2), P(X > 2), P(X >= 2), P(X < 2)


#### BINOMIAL. Gráficos ####

# Ya contamos con los valores de X y sus probabilidades asociadas (objetos x y prob)

# Ahora graficamos. Como la variable es discreta, hacemos un gráfico de barras:
barplot(prob, names.arg = x, main = "Probabilidades para X ~ Bi(15, 0,1)", xlab = "X", ylab = "P(X = k)")

# Señalemos en el gráfico las probabilidades que calculamos arriba.

# P(X = 2):
barplot(prob, names.arg = x, main="Probabilidades para X ~ Bi(15, 0,1)", xlab = "X", ylab = "P(X = k)", col = c("white", "white", "orange", "white", "white", "white", "white", "white", "white", "white", "white", "white", "white", "white", "white", "white"))

# Lo mismo se puede escribir usando la función "rep()". Si tienen dudas, pueden preguntarle a R acerca de esa función:
?rep()
barplot(prob, names.arg = x, main = "Probabilidades para X ~ Bi(15, 0,1)", xlab = "X", ylab = "P(X = k)", col = c(rep("white", 2), "orange", rep("white", 13)))

# P(X > 2):
barplot(prob, names.arg = x, main = "Probabilidades para X ~ Bi(15, 0,1)", xlab = "X", ylab = "P(X = k)", col = c(rep("white", 3), rep("orange", 13)))
# ¿Cuál es la diferencia con la sintaxis anterior? Siempre presten atención a las sintaxis por si tuvieran que editarlas ustedes.

# P(X >= 2):
barplot(prob, names.arg = x, main = "Probabilidades para X ~ Bi(15, 0,1)", xlab = "X", ylab = "P(X = k)", col = c(rep("white", 2), rep("orange", 14)))

# P(X <= 2):
barplot(prob, names.arg = x, main = "Probabilidades para X ~ Bi(15, 0,1)", xlab = "X", ylab = "P(X = k)", col = c(rep("orange", 3), rep("white", 13)))


############################## ACTIVIDAD 2 ###############################

# A los hospitales de CABA asisten diariamente numerosas personas consultando por sus dolencias. Nosotros vamos a simular el número de personas que diariamente son diagnosticadas con este virus en los hospitales de esta ciudad. Es decir, la variable aleatoria: 
#         X: Número de personas diagnosticadas con este virus / día 

# Si las consultas se producen aleatoriamente a lo largo del día, entonces esa variable sigue una distribución de POISSON. Lo cual se escribe formalmente así:
#         X ~ P(lambda)
# donde lambda es un parámetro que representa el número promedio de personas que diariamente es diagnosticado con este virus en los hospitales de CABA. 

# Abramos nuevamente el simulador: 
source("Distribuciones_sim.R")
app_distribuciones

# 1) Simulen la variable X mencionada arriba, para distintos valores de lambda. Usen un rango de 0 a 20 para el eje X y de 0 a 1 para el eje Y. ¿A partir de qué valor de lambda la curva se hace más o menos simétrica? 

# 2) Si el promedio de diagnosticados con este virus en los hospitales de CABA fuera de 1,2 personas por día, calculen mirando el gráfico (aproximadamente), la probabilidad de que un día cualquiera se diagnostiquen menos de dos infectados con este virus. Pueden ajustar los rangos de valores de los ejes para ayudarse.

# 3) Cierren el simulador y corroboren el cálculo corriendo la función de RStudio adecuada. AYUDA: En la distribución de Poisson, las funciones que se usan para el cálculo de probabilidades son "dpois()" y "ppois()"
?dpois()

# 4) Considerando el mismo escenario, calculen la probabilidad de que ese mismo día no se diagnostique ningún infectado con este virus.

# 5) ¿Cuáles son la media y la varianza de esta distribución?.


#### POISSON. Tabla ####

# Generamos un vector que corresponde al dominio de la función. El dominio de la distribución de Poisson va de cero a infinito. Sin embargo, tendremos que elegir un valor máximo para poder graficar el eje. Elegimos 8 porque nos permitirá apreciar la forma de la distribución.
x <- c(0:8)

# Calculamos las probabilidades para cada uno de los valores de X.
prob <- dpois(x, 1.2)

# Calculamos las probabilidades acumuladas
acum <- cumsum(prob)

# Calculamos el complemento de las probabilidades acumuladas
comp.acum <- 1 - acum

# Unimos todos los vectores en un data.frame
data.frame(x, prob, acum, comp.acum)

# Redondeamos a 4 dígitos para facilitar la visualización
round(data.frame(x, prob, acum, comp.acum), 4)

# Ubiquen en la tabla los valores calculados anteriormente: P(X < 2), P(X = 0)


# Ahora vamos a graficar la distribución:

#### POISSON. Gráficos ####

# Ya contamos con los valores de X y sus probabilidades asociadas (objetos ‘x’ y ‘prob’)

barplot(prob, names.arg = x, main = "Probabilidades para X ~ P(1,2)", xlab = "X", ylab = "P(X = k)")

# Ahora vamos a graficar la probabilidad calculada arriba (que se diagnostiquen menos de dos infectados en un escenario con lambda = 1,2):
barplot(prob, names.arg = x, main = "Probabilidades para X ~ P(1,2)", xlab = "X", ylab = "P(X = k)", col = c(rep("orange", 2), rep("white", 7)))

# Grafiquen ustedes la probabilidad de que no se diagnostique ningún infectado, considerando el mismo escenario.



############################## ACTIVIDAD 3 ###############################

# La mortalidad que produce el virus considerado es particularmente alta en las personas hipertensas. Así que vamos a detenernos en analizar la variable ‘presión arterial’. 

# Se sabe que la presión arterial normal en los adultos sigue una distribución normal con media de 12 cmHg cuando el corazón late (tensión sistólica) y de 8 cmHg cuando se relaja (tensión diastólica). Valores superiores a 13 y 9 cmHg, respectivamente, son considerados altos y requieren tratamiento. 

# Para esta actividad vamos entonces a considerar dos variables:
#  X: tensión arterial sistólica (TAS) [conocida popularmente como "la alta"]
#  Y: tensión arterial diastólica (TAD) [conocida como "la baja"]

# Ambas siguen una distribución normal, lo que formalmente se escribe así:
#  X ~ N(mu, sigma)
# donde mu y sigma son los parámetros y representan, respectivamente, la media y el desvío estándar poblacionales.

# En nuestra actividad vamos a considerar que:
#  X ~ N(12, 1.2)
#  Y ~ N(8, 0.8)

# 1) Clasifiquen estas variables e indiquen qué tipo de gráfico corresponde hacer si construimos un gráfico de frecuencias.

# Ahora abran el simulador
source("Distribuciones_sim.R")
app_distribuciones

# 2) Simulen la variable X ajustando el eje X entre 6 y 18. ¿Es el tipo gráfico que esperaban obtener?
# Este gráfico representa la función de densidad de probabilidades de la  distribución normal. Describan la curva en cuanto a su simetría. ¿Dónde debería estar ubicada la media? Fíjense si coincide con el valor de mu.

# 3) Simulen la variable Y, ajustando el eje X entre 3 y 13. Nuevamente observen la simetría y fíjense si el valor de mu se encuentra donde esperaban que estuviera.

# 4) Comparen ambos gráficos y saquen conclusiones con respecto a la simetría, dominio y valor central de la distribución normal.


#### NORMAL. Gráficos ####

# Para calcular las probabilidades de la distribución normal se usa la función "dnorm()". Como se trata de una variable continua, para graficar puede utilizarse el comando curve() en el que deben especificarse la expresión a graficar y el rango de valores de x deseado. Si usamos como ejemplo la variable TAS:

curve(dnorm(x, 12, 1.2), from = 6, to = 18)

# 5) Grafiquen la distribución de probabilidades de la variable TAD. Denle al eje X la escala que sugerimos en el ítem 3).


# Veamos ahora cómo se calculan probabilidades bajo esta distribución:

# Antes que nada es importante señalar que no tiene sentido hablar de probabilidades de valores exactos cuando se trabaja con una distribución continua, ya que el área bajo un punto de la curva es cero. Por lo tanto, solo vamos a calcular las probabilidades mayores o menores de un dado valor y no su probabilidad puntual (=), mayor o igual (>=) ni menor o igual (<=). 

# 6) Calculen la probabilidad de que una persona elegida al azar tenga TAS mayor que 13.
?pnorm()


# 7) Vamos a graficarla para ver si calcularon la probabilidad correcta:

# Para colorear el área bajo la curva correspondiente a las P(X > k), primero construimos y rotulamos la curva
curve(dnorm(x, 12, 1.2), from = 6, to = 18, main = "P(X > 13)")

# Después le agregamos el área pintada

# Construimos la secuencia de lo que queremos pintar.
x <- seq(from = 13, to = 18, by = .01)

# Calculamos la función de densidad de esa secuencia.
y <- dnorm(x, 12, 1.2)

# Construimos un polígono que vaya de 13 a 18 (máximo arbitrario que le pusimos al eje X), con la forma de la distribución normal definida en x e y.
polygon(c(13, x, 18), c(0, y, 0), col = "red")


# Más cálculos de probabilidades bajo la distribución normal:

# 8) Calculen la probabilidad de que una persona elegida al azar tenga TAS entre 10 y 13 cmHg. AYUDA: Combinen la función "pnorm()" con el uso de R como calculadora.

# Ahora grafiquemos este último cálculo (comparen su sintaxis con la del gráfico anterior, para entender lo que hacen):
curve(dnorm(x, 12, 1.2), from = 6, to = 18, main = "P(8 < X < 13)")
x <- seq(from = 10, to = 13, by = .01)  
y <- dnorm(x, 12, 1.2)
polygon(c(10, x, 13), c(0, y, 0), col = "red")

# 9) El 0,1% de las personas tienen una TAD tal que son consideradas con algún nivel de hipertensión (leve, moderada o severa). ¿Cuál es el valor de TAD que marca ese límite? 
# Fíjense que la pregunta es diferente de las anteriores. Acá se quiere conocer un valor del eje X a partir de una probabilidad. Para contestar la pregunta se usa una función que calcula cuantiles, la función "qnorm()". Explórenla ustedes:
?qnorm()

# 10) Calculen el percentil 25 para TAD e interpreten el resultado.

# 11) Comparemos ahora la probabilidad comprendida entre ambos desvíos estándar para cada una de las variables analizadas (TAD y TAS): 

# Primero calculamos más/menos el desvío estándar (DE) para TAS y TAD:
menos_DE_TAS <- 12 - 1.2
mas_DE_TAS <- 12 + 1.2

menos_DE_TAD <- 8 - 0.8
mas_DE_TAD <- 8 + 0.8

# Después calculamos las probabilidades entre esos valores:
pnorm(mas_DE_TAS, 12, 1.2) - pnorm(menos_DE_TAS, 12, 1.2)
pnorm(mas_DE_TAD, 8, 0.8) - pnorm(menos_DE_TAD, 8, 0.8)

# Comparen los resultados. ¿Qué conclusión se puede sacar? ¿Pasa lo mismo siempre? Prueben comparando con la variable Z ~ N(0, 1).



# 12) Probemos qué pasa con las probabilidades comprendidas entre 2 desvíos estándar, o sea, (2*DE):

menos_2DE_TAS <- 12 - 2 * 1.2
mas_2DE_TAS <- 12 + 2 * 1.2

menos_2DE_TAD <- 8 - 2 * 0.8
mas_2DE_TAD <- 8 + 2 * 0.8

pnorm(mas_2DE_TAS, 12, 1.2) - pnorm(menos_2DE_TAS, 12, 1.2)
pnorm(mas_2DE_TAD, 8, 0.8) - pnorm(menos_2DE_TAD, 8, 0.8)

# 13) Completen la siguiente frase para dar la interpretación del resultado obtenido en el contexto biológico que analizamos: 

#     "El 95% de las personas..."

# 14) Calculen la probabilidad comprendida entre 2 desvíos estándar (2 * DE) para la variable Z ~ N(0, 1) y saquen alguna conclusión que permita generalizar sus observaciones.

# 15) Por último, vuelvan a abrir el simulador:
source("Distribuciones_sim.R")
app_distribuciones

# Comparen las siguientes curvas y discutan la forma de las mismas:
# a) X1 ~ Bi(200, 0,02) [con eje X entre 0 y 20]
# b) X2 ~ P(9)          [con eje X entre 0 y 30]
# c) Z ~ N(0, 1)        [eje X que viene por defecto]

#### APROXIMACIONES #### 
# Cuando n >= 20, n*pi > 5 y n*pi*(1-pi) > 5 => la distribución Binomial se aproxima a una normal.
# Cuando lambda >= 8 => la distribución de Poisson se aproxima a una normal.


############################  Material Extra  ############################

#### BINOMIAL. Cálculo de media y varianza ####

# Se presenta como ejemplo el cálculo de media y varianza para la distribución binomial trabajada (n = 15, pi = 0.1).

# Generamos un vector que corresponde al dominio de la función.
x <- c(0:15)

# Calculamos las probabilidades para cada uno de los valores de X.
prob <- dbinom(x, 15, 0.1)

# Calculamos el producto entre los valores de la variable y sus probabilidades
x.p <- x * prob

# Calculamos el acumulado del producto anterior
acum.x.p <- cumsum(x.p)

# Unimos en un data.frame aprovechando a redondear a 4 dígitos
round(data.frame(x, prob, x.p, acum.x.p), 4)

# La media o esperanza corresponde a la sumatoria del producto antes mencionado (valor de la última fila).

# También se puede obtener en forma más directa con el comando de promedio ponderado de la siguiente forma:
weighted.mean(x, prob)

# Usando R como calculadora comparen este resultado con el valor de la esperanza E(X) = n * pi


# Calculemos la varianza de esta distribución

# Calculamos la diferencia de cada valor respecto a la esperanza o media
xe <- x - (15 * 0.1)

# Elevamos dicha diferencia al cuadrado
xe2 <- xe^2

# Multiplicamos por cada probabilidad
xe2.p <- xe2 * prob

# Calculamos el acumulado
acum.xe2.p <- cumsum(xe2.p)

# Unimos en un data.frame y redondeamos a redondear a 4 dígitos
round(data.frame(x, prob, xe, xe2, xe2.p, acum.xe2.p), 4)

# La varianza corresponde a la sumatoria del producto antes mencionado (valor de la última fila).

# También se puede obtener en forma más directa con el comando de varianza ponderada del paquete ‘ade4’ de la siguiente forma:
library(ade4)
varwt(x, prob)

# Comparen el resultado con el producto [n*pi*(1-pi)]


#### Poisson. Cálculo de media y varianza ####

# Se presenta como ejemplo el cálculo de media y varianza para la distribución Poisson trabajada (lambda = 1.2).

# Generamos un vector que corresponde a parte del dominio de la función (recordar que se extiende hasta infinito y que cuanto mayor sea x, mejor se aproximará).
x <- c(0:20)

# Calculamos las probabilidades para cada uno de los valores de X.
proba <- dpois(x, 1.2)

# Calculamos el producto entre los valores de la variable y sus probabilidades
x.p <- x * proba

# Calculamos el acumulado del producto anterior
acum.x.p <- cumsum(x.p)

# Unimos en un data.frame, y redondeamos a 4 dígitos
round(data.frame(x, proba, x.p, acum.x.p), 4)

# La media o esperanza corresponde a la sumatoria del producto antes mencionado (valor de la última fila).

# También se puede obtener en forma más directa con el comando de promedio ponderado de la siguiente forma:
weighted.mean(x, prob)

# Comparen este resultado con lambda

# Empezamos calculando la varianza de esta distribución

# Calculamos la diferencia de cada valor respecto a la esperanza o media
xe <- x - 1.2

# Elevamos dicha diferencia al cuadrado
xe2 <- xe^2

# Multiplicamos por cada probabilidad
xe2.p <- xe2 * proba

# Calculamos el acumulado
acum.xe2.p <- cumsum(xe2.p)

# Unimos en un data.frame, redondeando a 4 dígitos
round(data.frame(x, proba, xe, xe2, xe2.p, acum.xe2.p), 4)

# La varianza corresponde a la sumatoria del producto antes mencionado (valor de la última fila).

# También se puede obtener en forma más directa con el comando de varianza ponderada del paquete ‘ade4’ de la siguiente forma:
# library(ade4)
varwt(x, proba)

# Comparen el resultado con lambda

# ¿Qué conclusiones pueden sacar observando estos resultados? ¿Será lo mismo para cualquier otra distribución de Poisson? Cambien el valor de lambda y prueben.
