--------------------ej 1--------------------------
-- 1 --
longitud :: [t] -> Integer
longitud [] = 0
longitud (_ :xs) = 1 + longitud xs
--2 --
ultimo :: [t] -> t
ultimo x    | longitud x == 1 = head x
            | otherwise = ultimo (tail x)

--3 --
principio :: [t] -> [t]
principio x | longitud x == 1 = []
            | otherwise = head x : principio (tail x)

-- 4 --
reverso :: [t] -> [t]
reverso x   | longitud x == 0 = []
            | otherwise = ultimo x : reverso (principio x)

---------------------ej 2-------------------------------

-- 1 --
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e s   | e == head s = True
                | longitud s > 1 && e /= head s = pertenece e (tail s)
                | otherwise = False 

-- 2 --

-- 3 --
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos x    | longitud x == 1 = True
                    | pertenece (head x) (tail x) = False
                    | otherwise = todosDistintos (tail x)

-- 4 --
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos x  | todosDistintos x = False
                | otherwise = True

-----------------------ej 3---------------------------------

-- 3 --
maximo :: [Integer] -> Integer
maximo x    | longitud x == 1 = head x
            | head x >= head (tail x) = maximo (head x : tail (tail x))
            | head x <= head (tail x) = maximo (tail x)

-- 7 --
pares :: [Integer] -> [Integer]
pares x | longitud x == 1 && mod (head x) 2 == 0 = x 
        | longitud x == 1 = []
        | mod (head x) 2 == 0 = head x : pares (tail x)
        | mod (head x) 2 /= 0 = pares (tail x)