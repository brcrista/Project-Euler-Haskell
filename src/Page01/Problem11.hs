{-|
In the 20×20 grid in data/problem_0011.txt, 26, 63, 78, and 14 lie along a diagonal line.
The product of these numbers is 26 × 63 × 78 × 14 = 1788696.

What is the greatest product of any four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?
-}

module Page01.Problem11
  (
    largestProductInGrid,
    solution
  )
where

import Data.Grid (Grid, parseGrid)
import Numeric.Natural (Natural)
import Paths_Project_Euler_Haskell (getDataFileName)

largestProductInGrid :: Grid -> Natural
largestProductInGrid grid = undefined

solution :: IO Natural
solution = do
  dataFile <- getDataFileName "problem_0011.txt"
  contents <- readFile dataFile
  let grid = parseGrid contents
  return $ largestProductInGrid grid
