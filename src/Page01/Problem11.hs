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

import Core (indices, slice)
import Data.Grid (Grid, columns, leftDiagonal, parseGrid, rightDiagonal, rows)
import Paths_Project_Euler_Haskell (getDataFileName)

consecutives :: Int -> [a] -> [[a]]
consecutives n xs = (\ i -> slice i (i + n - 1)) <$> indices (drop n xs) <*> [xs]

-- TODO
rightDiagonals :: Grid -> [[Int]]
rightDiagonals grid = [rightDiagonal grid]

-- TODO
leftDiagnonals :: Grid -> [[Int]]
leftDiagnonals grid = [leftDiagonal grid]

allDirections :: Grid -> [[Int]]
allDirections grid = [rows, columns, rightDiagonals, leftDiagnonals] >>= ($ grid)

consecutive4AllDirections :: Grid -> [[Int]]
consecutive4AllDirections grid = allDirections grid >>= consecutives 4

largestProductInGrid :: Grid -> Int
largestProductInGrid grid = maximum . map product $ consecutive4AllDirections grid

solution :: IO Int
solution = do
  dataFile <- getDataFileName "problem_0011.txt"
  contents <- readFile dataFile
  let grid = parseGrid contents
  return $ largestProductInGrid grid
