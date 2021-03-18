{-|
The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

(See the data file problem_0008.txt for the number.)

Find the thirteen adjacent digits in the 1000-digit number that have the greatest product.
What is the value of this product?
-}

module Page01.Problem08
  (
    largestProductInDataFile,
    solution
  )
where

import Core (consecutives)
import Data.Char (digitToInt, isDigit)
import Data.List (subsequences)
import Paths_Project_Euler_Haskell (getDataFileName)

readDigits :: String -> [Int]
readDigits = map digitToInt . filter isDigit

largestProductInSequence :: Int -> [Int] -> Int
largestProductInSequence subsequenceLength = maximum . map product . consecutives subsequenceLength

largestProductInDataFile :: Int -> IO Int
largestProductInDataFile subsequenceLength = do
  dataFile <- getDataFileName "problem_0008.txt"
  contents <- readFile dataFile
  let bigNumber = readDigits contents
  return $ largestProductInSequence subsequenceLength bigNumber

solution :: IO Int
solution = largestProductInDataFile 13
