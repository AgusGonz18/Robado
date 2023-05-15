sigma<-sqrt(2700)
mu<-2750

pnorm(2700,mu, sigma, lower.tail = F)
n<-16
pnorm(2765, mu, sigma/sqrt(n))-pnorm(2735, mu, sigma/sqrt(n))

curve(dnorm(x, mu, sigma/sqrt(n)), 0, 1, ) 


espinas<-read.table("BD_espinas.txt",header = T)
x.raya <-mean(espinas$diametro.espina)
1.87
var <-var(espinas$diametro.espina)

qt(0.60,mean(espinas$diametro.espina),sqrt(var))

curve(dnorm(x, 1.868, sqrt(var)),0, 4)

summary(espinas$diametro.espina)

hist(espinas$diametro.espina,main = " frecuencia absoluta de diametros en la muestra",xlab = "diametro", ylab = "frecuencia")



quantile(espinas$diametro.espina, 0.6)
quantile(espinas$diametro.espina, 0.75)
quantile(espinas$diametro.espina, 0.25)

n<-35
valor.critico <-qt(0.05/2, n-1)

s<- sd(espinas$diametro.espina)

EE <-s/sqrt(n)


sigma<-sqrt(2700)
mu<-2750
pnorm(2700,mu, sigma, lower.tail=F)


sigma<-sqrt(2700)

mu<-2750

n<-16

pinquillin <- read.table("BD_piquillin.txt", header = T)
x.raya<- mean(pinquillin$peso)
mu<-0.2
sigma<-sqrt(0.02)
n<-34
pnorm(x.raya, mu, sigma/sqrt(n), lower.tail = F)

x.rayacritico<-qnorm(0.05, mu, sigma/sqrt(n))
n.nuevo<-(((qnorm(0.95)+qnorm(0.8))/0.1)*sigma)**2

pnorm(x.rayacritico, mu+0.1, sigma/sqrt(n),lower.tail = T)
pnorm(2765, mu, sigma/sqrt(n))-pnorm(2735, mu, sigma/sqrt(n))
0.34*0.44
0.36*0.44
0.3*0.44
0.23/0.56
35+38
curve(dnorm(x, mu, sigma/sqrt(n)), 0, 0.5)
curve(dnorm(x,mu+0.1,sigma/sqrt(n)),0,0.5)
Error.muestral<- valor.critico*EE

limiteinferior<-x.raya-Error.muestral

limitesuperior<-x.raya+Error.muestral

c(limiteinferior,limitesuperior)



