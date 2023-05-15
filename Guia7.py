#Ejercicio 1
def raizDe2 ():
    return round (2**0.5,4)

# -2

def imprimir_hola():
    print("Hola")

# -3

def imprimir_un_verso():
    print("No soy rico, but i live as a millonarie")

# -4

def factorial_2():
    print(4)

# -5

def factorial_3():
    print(6)

# -6
def factorial_4():
    print(24)

# -7
def factorial_5():
    print(120)

# Ejercicio 2

# -1
def imprimir_saludo(nombre:[str])->[str]:
    return ("Hola "+nombre)

# -2

def raiz_cuadrada_de(numero:int)->float:
    return numero**0.5

# -3
def imprimir_dos_veces(estribillo:[str])->[str]:
    return estribillo

# -4

def es_Multiplo_de (n:int,m:int)->bool:
    if n%m==0 :
        return True
    return False

# -5
def es_par(numero:int)->bool:
    if es_Multiplo_de(numero, 2):
        return True
    return False

# -6
#def cantidad_de_pizzas(comensales:int,min_cant_de_porciones:int)->int:

# Ejercicio 3

# -1
def alguno_es_0(numero1:int,numero2:int)->bool:
    if numero1==0 or numero2==0:
        return True
    return False

# -2
def ambos_son_0(numero1:int,numero2:int)->bool:
    if numero1==0 and numero2==0:
        return True
    return False

# -3

def es_nombre_largo(nombre:str)->bool:
    if len(nombre)<=8 and len(nombre)>=3:
        return True
    return False

# -4
def es_bisiesto(año:int)->bool:
    if año%400==0:
        return True
    elif año%4==0 and año%100!=0:
        return True
    elif año%4!=0 and año%100==0:
        return False
    else:
        return False
       
# Ejercicio 4
# -1
def peso_pino(largoDePino:int)->int:
    acum:int=0
    if largoDePino>3:
        return (largoDePino-3)*100*2+3*100*3
    else:
        return largoDePino*100*3

# -2
def es_peso_util(peso:int)->bool:
    if (peso>=400 and peso<=1000):
        return True
    return False        

# -3
def sirve_pino(alturaDePino:int):
    if (es_peso_util(peso_pino(alturaDePino))):
        return True
    return False

# Ejercicio 5

# -1
def devolver_el_doble_si_es_par(un_numero:int)->int:
    if es_par(un_numero):
        return un_numero*2
    else:
        return un_numero

# -2
def devolver_valor_si_es_par_sino_el_que_sigue(un_numero:int)->int:
    if es_par(un_numero):
        return un_numero
    else:
        return un_numero+1

# -3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(un_numero:int)->int:
    if un_numero %9==0:
        return un_numero*3
    elif un_numero %3==0:
        return un_numero*2
    else:
        return un_numero

# -4
def largoDeNombre(nombre:str)->str:
    if len(nombre)>=5:
        return "Tu nombre tiene muchas letras!"
    else:
        return "Tu nombre tiene menos de 5 caracteres"

# -5
def generoYedad(sexo:str,edad:int)->str:
    if sexo==Masculino and edad<65 and edad>=18:
        return "Te toca trabajar"
    elif sexo==Masculino and edad<65 and edad<18:
        return "Andà de vacaciones"
    elif sexo==Masculino and edad>=65:
        return "Jubilado"
    elif sexo==Femenino and edad<60 and edad>=18:
        return "Te toca trabajar"
    elif sexo==Masculino and edad<60 and edad<18:
        return "Andà de vacaciones"
    elif sexo==Masculino and edad>=60:
        return "Jubilado"









