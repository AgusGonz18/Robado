# TP 2. Azar y probabilidades
# Actividad 1. Lanzar una moneda 20 veces

# 6) Descargar la base de datos con todos los resultados del campus (archivo BD_moneda.csv) y asignarla a un objeto
rm(list = ls())
moneda <- read.table("BD_moneda.csv", sep = ",", header = T)
head(moneda)

# Reordenamos las columnas convenientemente (por si se bajaron "desordenadas" del campus)
moneda <- moneda[, c("variable", "secuencia", "valor")]
head(moneda)


#### Número de caras ####

# Restringiremos la base de datos a la variable de interés, número de caras, con el comando subset
subset(moneda, variable == "Numero de caras")

# Guardamos este subconjunto en un objeto aprovechando a excluir la primera columna que no aporta información relevante. Esto último lo hacemos agregando [, -1] que significa [todas las filas, todas las columnas excluyendo la primera]
caras <- subset(moneda, variable == "Numero de caras")[, -1]
head(caras)


# 7a) ¿En qué se parecen y en qué se diferencian?
## Estadística descriptiva con el comando tapply y la función summary
## tapply(valores, filtro, función)
tapply(caras$valor, caras$secuencia, summary)


# 7b) ¿Tienen la misma moda?
## Tablas para ver modas
table(caras)


# 7c) ¿Tiene el mismo rango de variación de valores?
## Rango
tapply(caras$valor, caras$secuencia, range)


# 7d) ¿Cuál de las dos secuencias (intuitiva y aleatoria) tiene mayor variabilidad?

## Variabilidad, estadísticos de dispersión

### Rango intercuartílico
tapply(caras$valor, caras$secuencia, IQR)

### Varianza
tapply(caras$valor, caras$secuencia, var)

### Desvío estándar
tapply(caras$valor, caras$secuencia, sd)

### Coeficiente de variación
tapply(caras$valor, caras$secuencia, sd) / tapply(caras$valor, caras$secuencia, mean)

# 7e) Construyan un gráfico que permita comparar el número de caras entre las secuencias aleatorias y simuladas intuitivamente.

# Boxplot

# Podemos graficar un boxplot de valores obtenidos para cada secuencia. El símbolo virgulilla (~) indica algo en función de otra cosa. Siempre hay que especificar a qué base de datos pertenecen dichas variables.
boxplot(valor ~ secuencia, caras)

# Sumando etiquetas
boxplot(valor ~ secuencia, caras, xlab = "Secuencia", ylab = "Número de caras")

# Si se quiere agregar el valor medio de cada grupo puede hacerlo con el comando points ()
medias <- tapply(caras$valor, caras$secuencia, mean)
points(x = c(1, 2), y = medias, col = "red")


# Barplot

# Para realizar un gráfico de barras, debemos obtener la tabla de frecuencias con el comando table()
table(caras)

# Ahora ya podemos graficar, poniendo una serie al lado de la otra, parámetro "beside"
barplot(table(caras), beside = TRUE)


# Completando la figura con las etiquetas correspondientes
barplot(table(caras), beside = TRUE, xlab = "Número de caras", ylab = "Frecuencia", legend = TRUE)

# Sin embargo, muy probablemente no estén representados todos los valores posibles de la variable. Esto puede dificultar la interpretación de los resultados. El dominio teórico de esta variable va de cero a 20. Podemos incluir esa información haciendo que la variable sea de tipo factor y definiendo los niveles de la misma.
caras$valor <- factor(caras$valor, levels = 0:20)
str(caras)
table(caras)

# Volvemos a graficar con el dominio completo
barplot(table(caras), beside = TRUE, xlab = "Número de caras", ylab = "Frecuencia", legend = TRUE, cex.names = 0.7)


#### Número de rachas ####
# Resuelvan ustedes mismos en base a lo visto para número de caras

# a) ¿En qué se parecen y en qué se diferencian?
# b) ¿Tienen la misma moda?
# c) ¿Tiene el mismo rango de variación de valores?
# d) ¿Cuál de las dos secuencias (intuitiva y aleatoria) tiene mayor variabilidad?
# e) Realizar un gráfico que permita comparar



#### Longitud de racha ####
# Resuelvan ustedes mismos en base a lo visto para número de caras

# a) ¿En qué se parecen y en qué se diferencian?
# b) ¿Tienen la misma moda?
# c) ¿Tiene el mismo rango de variación de valores?
# d) ¿Cuál de las dos secuencias (intuitiva y aleatoria) tiene mayor variabilidad?
# e) Realizar un gráfico que permita comparar
