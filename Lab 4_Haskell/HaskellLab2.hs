import Data.List
import System.IO

{- 1. Implement the greatest common divisor algorithm as
gcdMine :: Integral a => a -> a -> a
by following the definition here. Check that your answer matches the built-in algorithm with this
function (you MUST include gcdCheck below in your code):
gcdCheck x y = (myAnswer, correctAnswer, comment)
where
myAnswer = gcdMine x y
correctAnswer = gcd x y
comment = if myAnswer == correctAnswer then "Matches" else "Does not Match"-}

gcdMine :: Integral a => a -> a -> a
gcdMine x 0 = x
gcdMine x y = gcdMine y (mod x y)

gcdCheck x y = (myAnswer, correctAnswer, comment)
    where
    myAnswer = gcdMine x y
    correctAnswer = gcd x y
    comment = if myAnswer == correctAnswer then "Matches" else "Does not Match"

{-2. Write a function to compute Fibonacci numbers. Follow the description given at the
beginning of the chapter.
fibonacci :: Int -> Int -}

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = (fibonacci (x - 1)) + (fibonacci (x - 2))

{-3. Write a function that counts how many items are found in a list that match the one given:
count :: (Eq a, Num b) => a -> [a] -> b -}

count :: (Eq a, Num b) => a -> [a] -> b
count a (x:[]) = if x == a then 1 else 0
count a (x:xs) = count a xs

main = do
    {- gcdCheck 111 259 == (37,37,"Matches")
    gcdCheck 2945 123042 == (1,1,"Matches"))
    gcdCheck (2*5*7) (7*23) == (7,7,"Matches") -}
    print(gcdCheck 111 259)
    print(gcdCheck 2945 123042)
    print(gcdCheck (2*5*7) (7*23))
    -- 2. When finished check that you get this: [fibonacci n | n <- [0..20]] == [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765]
    print([fibonacci n | n <- [0..20]])
    {- 3. You should be able use it like this:
        count 7 [1,7,6,2,7,7,9] == 3
        count 'w' "western oregon wolves" == 2 -}
    print(count 7 [1,7,6,2,7,7,9])
    print(count 'w' "western oregon wolves")
    -- 5. Multiply every element of a list by 10
    print(map (\x -> x * 10) [1..10])
    -- 6. Increment every element in a list. Write it again so that it can increment things that are not numbers, i.e. turn "Hello" into "Ifmmp"
    print(map (\x -> toEnum (fromEnum x + 1) :: Char ) "Hello")
    -- 7. Tell you True or False whether or not a list contains a value that is divisible by 42
    print(any (\x -> x `mod` 42 == 0) [1..100])
    print(any (\x -> x `mod` 42 == 0) [1..41])
    {- 8. Use zipWith to take a list like this [5,3,8,2,3,6,3] to this
    [100000,1000,100000000,100,1000,1000000,1000] i.e. it raises 10 to the power of the
    element in the list and places it in that list. HINT: You shouldn't have to ask how long the list
    is (use an infinite list!). -}
    print(zipWith (\ x y -> x ** y ) [10,10..][5,3,8,2,3,6,3])
    -- 9. Remove all spaces from the end of a string (often called stripping a string).
    print(reverse (dropWhile (\x -> x == ' ') (reverse "Haskell is fun       ")))
    -- 10. Tell you True or False if a list contains nothing but even numbers.
    print(all (even) [2,4..100])
    print(all (even) [1,2,3,4])
    -- 11. Put the word "not" on the front of all strings in a list. e.g. ["Funny","cold","slow"] ==> ["not Funny","not cold","not slow"]
    print(map ("not "++) ["Funny","cold","slow"])
    -- 12. Reverse all strings contained in a list. e.g. ["This","is","a","sentence"] ==> ["sihT","si","a","ecnetnes"]
    print(map (reverse) ["This","is","a","sentence"])
    -- Rewrite as lambda functions:
    -- 13. plus x y = x + y
    print((\x y -> x + y) 1 2)
    print((\x y -> x + y) 1 50)
    -- 14. (*4)
    print((\x -> x * 4) 4)
    print((\x -> x * 4) (-2.5))
    -- 15. A function that gives you the second element in a list.
    print((\x -> x !! 1) [1..10])
    print((\x -> x !! 1) [5,8..])
    -- 16. A function that takes the square root of a number and then rounds it.
    print((\x -> round(sqrt(fromIntegral x))) 15)
    print((\x -> round(sqrt(fromIntegral x))) 256)
    -- 17. words "This is a sentence written in the usual way." == ["This","is","a","sentence","written","in","the","usual","way."]
    print(takeWhile (\x -> x /= ' ') "This is a sentence written in the usual way.")
    {- 18. 18. Use a Lambda expression and map to take a list of tuples and produce a list of values. The
    list contains the lengths of two sides of right triangles, a and b. You want to produce a list
    that contains the lengths of all three sides, where the third side, c, is found with
    the Pythagorean theorem. 
    [(3,4),(5,16),(9.4,2)]
        == [(3.0,4.0,5.0),(5.0,16.0,16.76305461424021),(9.4,2.0,9.610411021387172)]-}
    print(map (\(a,b) -> (a , b, sqrt(a**2 + b**2))) [(3,4),(5,16),(9.4,2)])
-- Higher-order Functions II & Modules
-- 1. Trace out the execution of each expression, as was done in class, and show how they are different.
-- foldl (*) 6 [5,3,8]
--  6*([5,3,8])
--  6*(5*([3,8]))
--  6*(5*(3([8])))
--  6*(5*(3*(8)))
-- foldr (*) 6 [5,3,8]
--  6*([5,3,8])
--  6*(([5,3])*8)
--  6*(([5]*3)*8)
--  6*(((5)*3)*8)