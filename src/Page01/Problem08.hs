{-|
The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

(See problem_08_data.txt for the number.)

Find the thirteen adjacent digits in the 1000-digit number that have the greatest product.
What is the value of this product?
-}

module Page01.Problem08
  (
    largestProductInSeries,
    solution
  )
where

import Data.Char (digitToInt)
import Data.List (subsequences)
import Paths_Project_Euler_Haskell (getDataFileName)

joinLines :: String -> String
joinLines = concat . words

-- | All sequences of `subsequenceLength` consecutive elements from `sequence`.
subsequencesOfLength :: Int -> String -> [String]
subsequencesOfLength subsequenceLength s
  | subsequenceLength < 1 = error "`subsequenceLength` must be a positive integer"
  | otherwise = filter ((== subsequenceLength) . length) (subsequences s)

largestProductInSeries :: Int -> String -> Int
largestProductInSeries substringLength number = maximum $ map product consecutiveDigits
  where consecutiveDigits = [map digitToInt s | s <- subsequencesOfLength substringLength number]

solution :: IO Int
solution = do
  dataFile <- getDataFileName "problem_08_data.txt"
  contents <- readFile dataFile
  let bigNumber = joinLines contents
  return $ largestProductInSeries 13 bigNumber
