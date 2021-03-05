{-|
In the 20×20 grid in data/problem_0011.txt, 26, 63, 78, and 14 lie along a diagonal line.
The product of these numbers is 26 × 63 × 78 × 14 = 1788696.

What is the greatest product of any four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?
-}

module Page01.Problem11
  (
    largestProductInGrid,
    leftDiagonals,
    rightDiagonals,
    solution
  )
where

import Core (consecutives)
import Data.Grid (Grid, columns, leftDiagonal, parseGrid, rightDiagonal, rows)
import Paths_Project_Euler_Haskell (getDataFileName)

subgridUpLeft, subgridDownRight, subgridDownLeft, subgridUpRight :: Grid -> Grid
subgridUpLeft    xss = [init row | row <- init xss]
subgridDownRight xss = [tail row | row <- tail xss]
subgridDownLeft  xss = [init row | row <- tail xss]
subgridUpRight   xss = [tail row | row <- init xss]

rightDiagonals :: Grid -> [[Int]]
rightDiagonals grid =
  drop 1 $ diagonalsRecursiveLeft grid ++ diagonalsRecursiveRight grid
  where
    diagonalsRecursiveLeft [] = []
    diagonalsRecursiveLeft grid =
      rightDiagonal grid
      : diagonalsRecursiveLeft (subgridDownLeft grid)

    diagonalsRecursiveRight [] = []
    diagonalsRecursiveRight grid =
      rightDiagonal grid
      : diagonalsRecursiveRight (subgridUpRight grid)

leftDiagonals :: Grid -> [[Int]]
leftDiagonals grid =
  drop 1 $ diagonalsRecursiveLeft grid ++ diagonalsRecursiveRight grid
  where
    diagonalsRecursiveLeft [] = []
    diagonalsRecursiveLeft grid =
      leftDiagonal grid
      : diagonalsRecursiveLeft (subgridUpLeft grid)

    diagonalsRecursiveRight [] = []
    diagonalsRecursiveRight grid =
      leftDiagonal grid
      : diagonalsRecursiveRight (subgridDownRight grid)

largestProductInGrid :: Int -> Grid -> Int
largestProductInGrid n grid = maximum . map product $ allDirections >>= ($ grid) >>= consecutives n
  where allDirections = [rows, columns, rightDiagonals, leftDiagonals]

solution :: IO Int
solution = do
  dataFile <- getDataFileName "problem_0011.txt"
  contents <- readFile dataFile
  let grid = parseGrid contents
  return $ largestProductInGrid 4 grid
