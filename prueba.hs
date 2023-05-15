doubleMe :: Int -> Int
doubleMe x = x + x + x

-- :r   =  reload  ,  :l   = load

ejercicio1a ::  Int -> Int
ejercicio1a 1 = 8
ejercicio1a 4 = 131
ejercicio1a 16 = 16


-- ejercicio1a x | x == 1 =8
--               | x == 4 = 131
--               | x == 16 = 16


ej1b :: Int -> Int
ej1b 8 = 16
ej1b 16 = 4
ej1b 131 = 1


absoluto :: Int -> Int
absoluto x | x >= 0 = x
           | x < 0 = -1 * x



maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y | absoluto x > absoluto y = absoluto x
                   | absoluto y > absoluto x = absoluto y
                   | absoluto y == absoluto x = absoluto x


maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z | x >= y && x >= z = x
              | y >= x && y >= z = y
              | z >= x && z >= y = z


algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y | x == 0  = True
              | y == 0  = True
              | otherwise = False

algunoEs0B :: Float -> Float -> Bool
algunoEs0B 0 _ = True
algunoEs0B _ 0 = True
algunoEs0B _ _ = False
-- en este caso, dado que va de arriba a abajo, cuando llega a _ _ significa que no hay ceros


ambosSon0 :: Float -> Float -> Bool
ambosSon0 0 0 = True
ambosSon0 _ _ = False


mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | x <= 3      &&    y <= 3 = True
                   |x>3 && x<=7  &&    y>3 && y<=7 = True
                   | x > 7       &&    y > 7 = True
                   |otherwise = False


sumaDistintos :: Int -> Int -> Int ->Int
sumaDistintos x y z | x==y && x/=z   = x+z
                    | x==z && x/=y   = x+y
                    | y==z && y/=x   = y+x
                    | z==y && z/=x   = z+x
                    | x == y && y == z    = x
                    | otherwise = x+y+z




esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y | mod x y == 0  = True
                 | otherwise = False





digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10 