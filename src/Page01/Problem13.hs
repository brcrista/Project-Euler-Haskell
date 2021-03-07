{-|
Work out the first ten digits of the sum of the one hundred 50-digit numbers in problem_0013.txt.
-}

module Page01.Problem13
  (
    solution
  )
where

import Paths_Project_Euler_Haskell (getDataFileName)

firstDigits :: (Integral a, Show a) => Int -> a -> String
firstDigits n = take n . show

firstDigitsOfSum :: Int -> String -> String
firstDigitsOfSum n s = firstDigits n $ sum [read line :: Integer | line <- lines s]

solution :: IO String
solution = do
  dataFile <- getDataFileName "problem_0013.txt"
  contents <- readFile dataFile
  return $ firstDigitsOfSum 10 contents