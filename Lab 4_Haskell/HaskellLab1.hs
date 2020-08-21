import Data.List
import System.IO

-- generate list like [[1],[1,2],[1..3],[1..4],...,[1..x]] based on size x
makeList x = [[x | x <- [1..x]] | x <- [1..x]]

{-sanitize :: String -> String
sanitize str = foldl (+) [zipWith (== " ") str "%20"] -}

-- associates four suits with integer 0 thru 3
getSuit :: Int -> String
getSuit 0 = "Heart"
getSuit 1 = "Diamond"
getSuit 2 = "Spade"
getSuit 3 = "Club"
getSuit _ = "error"

-- dotProduct of two 3d tuples
dotProduct :: (Double,Double,Double) -> (Double,Double,Double) -> Double
dotProduct (a,b,c)(e,f,g) = a * e + b * f + c * g

-- reverse only the first three valyes
reverseFirstThree :: [Int] -> [Int]
reverseFirstThree [] = []
reverseFirstThree [x] = [x]
reverseFirstThree [x,y] = [y,x]
reverseFirstThree (x:xs) =  reverse(take 3 (x:xs)) ++ drop 3(x:xs)

-- replace space with "%20"
replace " " = "%20"
replace str = str

-- four ranges and return different strings of feeling
feelsLike :: Double -> String
feelsLike temperature
    | temperature < 0 = "frostbite central"
    | temperature >= 0 && temperature < 30 = "Turn on the heater"
    | temperature >= 30 && temperature < 60 = "Cool"
    | temperature >= 60 && temperature < 90 = "Awesome"
    | otherwise = "Roasted Chicken"

-- using the same four ranges to determine the feeling but with celsius to fahrenheit conversion
feelsLike2 :: Double -> (Double,String)
feelsLike2 celsius
    | fahrenheit < 0 = (fahrenheit, "frostbite central")
    | fahrenheit >= 0 && fahrenheit < 30 = (fahrenheit, "Turn on the heater")
    | fahrenheit >= 30 && fahrenheit < 60 = (fahrenheit, "Cool")
    | fahrenheit >= 60 && fahrenheit < 90 = (fahrenheit, "Awesome")
    | otherwise = (fahrenheit, "Roasted Chicken")
    where fahrenheit = (celsius * (9 / 5)) + 32
    
cylinderToVolume :: [(Double,Double)] -> [Double]
cylinderToVolume [] = []
cylinderToVolume (x:xs) = [(pi * (fst x ** 2)) * snd x] ++ cylinderToVolume xs

main = do
-- 1. What is the square root of 818281336460929553769504384519009121840452831049?
        print(sqrt(818281336460929553769504384519009121840452831049))
-- 2. What is the ASCII character that comes before uppercase A?
        print(toEnum (fromEnum 'A' - 1) :: Char)
{- 3. What is a function that evaluates to True or False, that tells you 
whether or not three times a number plus one is even? Try it out on a couple numbers.-}
        print(even (3 * 2 + 1))
        print(even (3 * 9 + 1))
        print(even (3 * 8 + 1))
-- 4. What is the product of all the odd numbers one to one hundred?
        print(product [1,3..100])
{- 5. Use list operation functions like head, tail, last, etc. to find the greatest number in the 
following list, that is not the first or last number. i.e. if the first and last numbers don't count, then
what is the largest number in the "middle" of the list? [99,23,4,2,67,82,49,-40]-}
        print(maximum (init (tail [99,23,4,2,67,82,49,-40])))
{- 6. Using the list construction operator, :, and the empty list, [], write an expression to construct a
list like this: [6,19,41,-3], i.e. don't just write the list, construct it. -}
        print(6 : 19 : 41 : -3 :[])
-- 7. What are the first 27 even numbers? Use the even function and be Lazy!
        print(take 27 [x | x <- [0..], even x])
-- 8. Provide a list of all odd numbers less than 200 that are divisible by 3 and 7.
        print([x | x <- [0..200], x `mod` 3 == 0, x `mod` 7 == 0])
-- 9. How many odd numbers are there between 100 and 200 and that are divisible by 9?
        print(length [x | x <- [100..200], x `mod` 9 == 0])
-- 10. Count how many negative numbers there are in a list of numbers. Input [-4, 6, 7, 8, -14]
        print(length [x | x <- [-4 , 6 , 7 , 8], x < 0])
{- 11. Use zip, Texas ranges and concatenation, to create a list of Hexadecimal mappings like this:
[(0,'0'),(1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9'),
(10,'A'),(11,'B'),(12,'C'),(13,'D'),(14,'E'),(15,'F')] -}
        print(zip [0..15] (['0'..'9']++['A'..'F']))
{- 12. Write a function that uses list comprehensions to generate a list of lists that works like this:
makeList 3 == [[1],[1,2],[1,2,3]]
makeList 5 == [[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5]]
makeList (-2) == [] -}
        print(makeList 3)
        print(makeList 5)
        print(makeList (-2))
{- 13. URL's are not allowed to contain spaces. Write a Haskell function that takes a string, and replaces
any space characters with the special code %20. 
For example:
sanitize "http://wou.edu/my homepage/I love spaces.html" ==
"http://wou.edu/my%20homepage/I%20love%20spaces.html" -}

        print(concat (map replace [[x] | x <- "http://wou.edu/my%20homepage/I%20love%20spaces.html"]))
        
{- 14. Choose 5 of the following functions, look up their type signature with :t in ghci. Write it down.
Then look at the type class hierarchy found on Moodle and write down a few concrete types that it
will work with. Include this, commented out, in your .hs file.
1. (*) Int Integer Float Double
2. min Int Integer Float Double
3. take Int
4. head [Int] [Double] [Float]
5. (>) Int Double Float Rationsl -}

{- 15. A function that associates the integers 0 through 3 with "Heart", "Diamond", "Spade", and "Club",
respectively. For any other integer values it is an error.
getSuit :: Int -> String -} 

        print(getSuit 0)
        print(getSuit 1)
        print(getSuit 2)
        print(getSuit 3)
        print(getSuit 16)
        
{- 16. A function that computes the dot product of two 3D vectors (tuples). Follow the Algebraic Definition.
dotProduct :: (Double,Double,Double) -> (Double,Double,Double) -> Double
-- e.g. dotProduct (1,2,3.0) (4.0,5,6) == 32.0 -}
        print(dotProduct (1,2,3.0) (4.0,5,6))
        
{- 17. A function that reverses the order of the first three elements in a list. If the list has fewer than 3 items then
reverse the first two, or if it only has one element or is empty, leave it as is. If it has more then 3 elements
then reverse the first 3 as asked and leave the remainder of the list as it is.
reverseFirstThree :: [a] -> [a] -}
        print(reverseFirstThree [])
        print(reverseFirstThree [1])
        print(reverseFirstThree [1,52])
        print(reverseFirstThree [1,52,74])
        print(reverseFirstThree [1,52,74,55,49,88])
        
{-18. Write a function that will tell you how warm or cold it feels like outside given a temperature in Fahrenheit.
You can make up the ranges (at least 4) but if you call it with a temperature of (-45.3) it should tell you it is
"frostbite central!". 
feelsLike :: Double -> String
-- e.g. feelsLike 45 == "Cool" 
-- feelsLike (-45.3) == "Frostbite Central!" -}
        print(feelsLike (-45.3))
        print(feelsLike 45)
        print(feelsLike 70)
        print(feelsLike 150)
        
{- 19. Modify your code for the previous problem to convert from celsius to fahrenheit at the same time you're
telling what it feels like. Have the user pass in values in celsius this time and you return the temperature in
fahrenheit as well as the classification (same as before but after the conversion remember), together in a
tuple. Use a where clause to do the temperature conversion.
feelsLike2 :: Double -> (Double,String)
e.g.
feelsLike2 100 == (212.0,"Oven-like")
feelsLike2 (-1) == (30.2,"Freezing") -}
        print(feelsLike2 100)
        print(feelsLike2 (-1))
        print(feelsLike2 (-35))
        print(feelsLike2 25)
        
{-20. Write a function that uses a let expression and pattern matching of tuples in a list comprehension
to calculate the volume of a list of cylinders. You'll take in a list of tuples (where the first value in
each tuple is the radius and the second is the height) and return a list of volumes as Double's.
Don't use a where clause.
cylinderToVolume :: [(Double,Double)] -> [Double]
-- e.g.
cylinderToVolume [(2,5.3),(4.2,9),(1,1),(100.3,94)] ==
[66.6017642561036,498.7592496839155,3.141592653589793,2970842.2548145014] -}

        print(cylinderToVolume [(2,5.3),(4.2,9),(1,1),(100.3,94)])










