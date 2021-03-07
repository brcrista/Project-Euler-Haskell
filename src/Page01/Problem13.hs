{-|
Work out the first ten digits of the sum of the one hundred 50-digit numbers in problem_0013.txt.
-}

module Page01.Problem13
  (
    solution
  )
where

import Paths_Project_Euler_Haskell (getDataFileName)

first10Digits :: Int -> String
first10Digits = take 10 . show

solution :: IO String
solution = do
  dataFile <- getDataFileName "problem_0013.txt"
  contents <- readFile dataFile
  return $ first10Digits $ sum [read line | line <- lines contents]