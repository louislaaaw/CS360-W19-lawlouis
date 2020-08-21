{- Lab 4: YunHo(Louis) Law -}

import System.IO
import Data.List

{-1. As a good scientist should, I use SI units in everyday life. For example my thermometers
are set to Celsius and I record my fuel efficiency in liters per 100km. Some misguided
individuals persist in using archaic units. To help them when traveling to sensible countries,
write functions necessary to answer the following questions. How many US gallons are
there in a certain number of liters? How much have you spent in USD if you spent $x
CAD? Now, use these two functions to answer this question: you filled up your gas tank in
Canada.-}

gallon :: Float -> Float
gallon x = x * 0.2641720524

usd :: Float -> Float
usd x = x * 0.75

{-2. Write a function called flightDistance to compute the approximate distance between two
locations on the Earth (in nautical miles) given the latitude and longitude of each coordinate
as Double values. The needed function is 
d = a cos^-1(cos(δ1)cos(δ2)cos(λ1 − λ2) + sin(δ1)sin(δ2))
where d is the flight distance^2 in miles between two points on a sphere of radius a (in miles),
roughly 3963 miles for the Earth. Point one has latitude δ1 and longitude λ1 while point 2
has latitude δ2 and longitude λ2. The latitude and longitude need to be in decimal form,
i.e. +45.58 latitude and -122.6 longitude is basically 45 degrees North latitude and 122.6
West longitude. Note that these values are in degrees and that trigonometry functions
usually assume values in radians. Also, in case you are unfamiliar with the notation, cos −1
means an inverse, or arc cosine. Important: Please write your function using tuples to
Also you must use a where clause. -}
degreesToradians :: (Float , Char) -> Float
degreesToradians (deg , dir)
    | dir == 'N' = deg * 0.0175
    | dir == 'S' = deg * 0.0175 * (-1)
    | dir == 'E' = deg * 0.0175
    | dir == 'W' = deg * 0.0175 * (-1)
    
flightDistance :: ((Float , Char), (Float , Char)) -> ((Float , Char), (Float , Char)) -> Float
flightDistance ((a1 , x1) , (b1 , y1)) ((a2 , x2) , (b2 , y2)) = 3963 *(acos $ (cos(n1) * cos(n2) * cos(m1 - m2)) + (sin(n1) * sin(n2)))
    where 
        n1 = degreesToradians(a1 , x1)
        n2 = degreesToradians(a2 , x2)
        m1 = degreesToradians(b1 , y1)
        m2 = degreesToradians(b2 , y2)
        
{-5. Write a function called isPrime that determines if an Integer is a prime number
(evenly divisible only by itself and one). For reference, here’s a list of the primes less
than 100: [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]-}
isPrime :: Integer -> Bool
isPrime x = [p | p <- [1..x], x `mod` p == 0] == [1 , x]

{-6. Write a function called factor that will take an Integer and determine its prime factors (called prime factorization). 
The function should take an Integer and return a list of Integers. This list should be the prime factors of the number, 
not including multiplicity. For example, the prime factors of 65 are 2 and 7 (even though the full multiplication is
56 = 2^3 · 7 = 2 · 2 · 2 · 7).-}
factor :: Integer -> [Integer]
factor n = [x | x <- take 1000 [y | y <- [2..n], isPrime y], n `mod` x == 0]

main = do
    {-1. You bought 62.3 liters of fuel and paid 78.4 Canadian dollars. What price was that
    in US dollars per gallon? To get you started on this one, call your first function gallons,
    the second one usd and the last price.-}
    print $ (usd 78.4) / (gallon 62.3)
    {-2. What is the flight distance between the point at 45◦N,122◦W to the point 21◦N,158◦W? -}
    print $ flightDistance ((45.0 , 'N'),(122.0, 'W')) ((21.0 , 'N'),(158.0 , 'W'))
    {-3. Use a list comprehension and the sum function to determine the sum of the cubes of all the odd numbers between 1000 and 2000?-}
    print $ sum [x ^ 3| x <- [1000..2000], x `mod` 3 == 0]
    {-4. Write expressions using map, filter, any, or all to
    • remove all spaces from a string
    • filter out all even numbers from a list (use the even function)
    • double every value in a list
    • tell you True or False if a list contains the number 55
    • tell you True or False if all the values in a list are odd (use the odd function)-}
    print $ filter (/= ' ') "Remove all spaces from any string"
    print $ filter (even) [0..50]
    print $ map (* 2)[0..10]
    print $ any (== 55) [1..100]
    print $ all (odd) [1,3..100]
    {-5. What are the 1000th through 1020th prime numbers? (starting at 2)-}
    print $ drop 1000 $ take 1020 [x|x <- [2..], isPrime x]
    {-6. What are the prime factors of 175561 and 62451532000?-}
    print $ factor 175561
    print $ factor 62451532000