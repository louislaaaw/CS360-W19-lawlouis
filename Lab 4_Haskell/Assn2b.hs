module Assn2b
(lengthMine
, convertIntToStringLeft
, convertIntToStringRight 
) where

import Data.List
import System.IO
import Data.Char
{-2. Write your own version of length
length :: [a] -> Int
using a fold. Export this function from your module-}
lengthMine :: [a] -> Int
lengthMine xs = foldl (\x -> x + 1) 0 xs
{-3. Write two functions, one that uses a left fold and one that uses a right fold, to imitate the
behavior of this map
map intToDigit [5,2,8,3,4] == "52834"-}

convertIntToStringLeft :: [Int] -> [Char]
convertIntToStringRight :: [Int] -> [Char]
    
convertIntToStringLeft [] = ""
convertIntToStringLeft xs = foldl (\x -> show x) [] xs

convertIntToStringRight [] = ""
convertIntToStringRight xs = foldr (\x -> show x) [] xs

{-4. Rewrite two of the following expressions with as few parentheses as possible using the
function application operator, $, and/or function composition.-}
-- length (filter (<20) [1..100])
-- length $ filter $ <20 [1..100]

-- take 10 (cycle (filter (>5) (map (*2) [1..10])))
-- take 10 $ cycle $ filter $ >5 $ map $ *2  [1..10]

