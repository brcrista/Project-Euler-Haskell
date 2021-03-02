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

import Core (slice)
import Data.Char (digitToInt, isDigit)
import Data.List (subsequences)
import Numeric.Natural (Natural)
import Paths_Project_Euler_Haskell (getDataFileName)

-- | All sequences of `subsequenceLength` consecutive elements from `sequence`.
-- | `Data.List.subsequences` is `O(2^n)`; we need something faster for long lists.
subsequencesOfLength :: Natural -> [a] -> [[a]]
subsequencesOfLength 0 _ = [[]]
subsequencesOfLength subsequenceLength s =
  let
    starts = [0 .. length s - fromIntegral subsequenceLength]
    end start = start + fromIntegral subsequenceLength - 1
  in
    map (\ x -> slice x (end x) s) starts

readDigits :: String -> [Natural]
readDigits = map (fromIntegral . digitToInt) . filter isDigit

largestProductInSequence :: Natural -> [Natural] -> Natural
largestProductInSequence subsequenceLength = maximum . map product . subsequencesOfLength subsequenceLength

largestProductInDataFile :: Natural -> IO Natural
largestProductInDataFile subsequenceLength = do
  dataFile <- getDataFileName "problem_0008.txt"
  contents <- readFile dataFile
  let bigNumber = readDigits contents
  return $ largestProductInSequence subsequenceLength bigNumber

solution :: IO Natural
solution = largestProductInDataFile 13
