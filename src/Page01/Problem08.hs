{-|
The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

(See problem_08_data.txt for the number.)

Find the thirteen adjacent digits in the 1000-digit number that have the greatest product.
What is the value of this product?
-}

module Page01.Problem08
  (
    solution
  )
where

joinLines :: String -> String
joinLines = concat . words

largestProductInSeries :: Int -> String -> Int
largestProductInSeries number substringLength = undefined

solution :: IO Int
solution =
  let
    dataFile = "problem_08_data.txt"
    bigNumber = readFile dataFile
  in
    fmap (largestProductInSeries 13) bigNumber