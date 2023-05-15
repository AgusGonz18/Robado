f :: Integer ->Integer
f 1 = 8
f 4 =131
f 16 = 16

f2 :: Integer ->Integer
f2 n| n == 1 = 8
    | n == 4 =131
    | n == 16 =16

g :: Integer ->Integer
g 8 = 16
g 16 = 4
g 131 = 1

h :: Integer ->Integer
h n = f(g(n))

k :: Integer ->Integer
k n = g(f(n))

absoluto :: Integer ->Integer
absoluto n | n >= 0 = n
           | n < 0 = -n

maximoabsoluto :: Integer -> Integer -> Integer
maximoabsoluto a b | (absoluto a) >= (absoluto b) = absoluto a
                   | otherwise = absoluto b

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 a b c | a>=b && a>=c = a 
             | b>=c = b
             | otherwise = c

algunoEs0 :: Integer -> Integer -> Bool
algunoEs0 _ 0 = True
algunoEs0 0 _ = True
algunoEs0 _ _ = False 

algunoEs0bis :: Integer -> Integer -> Bool
algunoEs0bis a b | a==0 || b==0 = True
                 | otherwise = False   

ambosSon0 :: Integer -> Integer -> Bool
ambosSon0 0 0 = True
ambosSon0 _ _ = False

ambosSon0bis :: Integer -> Integer -> Bool
ambosSon0bis a b | a==0 && b==0 = True
                 | otherwise = False 


mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo a b | a<=3 && b<=3 = True
                   | a>7 && b>7 = True
                   | (a>3 && a<=7) && (b>3 && b<=7) = True
                   | otherwise = False

sumadistintos :: Integer -> Integer -> Integer -> Integer
sumadistintos a b c | a==b && a==c = a
                    | a==b = a+c
                    | a==c = a+b 
                    | b==c = b+a
                    | otherwise = a+b+c

esMultiplode :: Integer -> Integer -> Bool
esMultiplode 0 _ = False
esMultiplode a b | (mod b a)==0 = True
                 | otherwise = False

digitoUnidades :: Integer -> Integer 
digitoUnidades a = mod a 10

digitosDecenas :: Integer -> Integer
digitosDecenas a = div (mod a 100) 10

estanRelacionados :: Integer ->Integer ->Bool
estanRelacionados a b | (esMultiplode b a) = True
                      | otherwise = False
