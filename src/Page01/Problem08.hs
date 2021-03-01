{-|
The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

(See problem_08_data.txt for the number.)

Find the thirteen adjacent digits in the 1000-digit number that have the greatest product.
What is the value of this product?
-}

module Page01.Problem08
  (
    largestProductInSeries,
    solution,
    subsequencesOfLength
  )
where

import Core (slice)
import Data.Char (digitToInt)
import Data.List (subsequences)
import Numeric.Natural (Natural)
import Paths_Project_Euler_Haskell (getDataFileName)

joinLines :: String -> String
joinLines = concat . words

-- | All sequences of `subsequenceLength` consecutive elements from `sequence`.
-- | `Data.List.subsequences` is `O(2^n)`; we need something faster for long lists.
subsequencesOfLength :: Natural -> [a] -> [[a]]
subsequencesOfLength 0 _ = [[]]
subsequencesOfLength subsequenceLength s =
    let
      starts = [0 .. length s - fromIntegral subsequenceLength]
      end start = start + fromIntegral subsequenceLength - 1
    in
      map (\x -> slice x (end x) s) starts

largestProductInSeries :: Natural -> String -> Int
largestProductInSeries substringLength number = maximum $ map product consecutiveDigits
  where consecutiveDigits = [map digitToInt s | s <- subsequencesOfLength substringLength number]

solution :: IO Int
solution = do
  dataFile <- getDataFileName "problem_0008.txt"
  contents <- readFile dataFile
  let bigNumber = joinLines contents
  return $ largestProductInSeries 13 bigNumber
