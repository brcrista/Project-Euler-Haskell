{-|
In the 20×20 grid in data/problem_0011.txt, 26, 63, 78, and 14 lie along a diagonal line.
The product of these numbers is 26 × 63 × 78 × 14 = 1788696.

What is the greatest product of any four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?
-}

module Page01.Problem11
  (
    largestProductInGrid,
    -- leftDiagonals,
    rightDiagonals,
    solution
  )
where

import Core (consecutives)
import Data.Grid (Grid(..), columns, leftDiagonal, parseGrid, rightDiagonal, rows)
import Paths_Project_Euler_Haskell (getDataFileName)

rightDiagonals :: Grid -> [[Int]]
rightDiagonals grid = [rightDiagonal grid]
  ++ rightDiagonalsRecursiveLeft leftSubgrid
  ++ rightDiagonalsRecursiveRight rightSubgrid
  where
    leftSubgrid  = [init row | row <- tail $ rows grid]
    rightSubgrid = [tail row | row <- init $ rows grid]

rightDiagonalsRecursiveLeft :: [[Int]] -> [[Int]]
rightDiagonalsRecursiveLeft []    = []
rightDiagonalsRecursiveLeft [[]]  = [[]]
rightDiagonalsRecursiveLeft [[x]] = [[x]]
rightDiagonalsRecursiveLeft grid =
  rightDiagonal (Grid grid)
  : rightDiagonalsRecursiveLeft leftSubgrid
  where
    leftSubgrid = [init row | row <- tail grid]

rightDiagonalsRecursiveRight :: [[Int]] -> [[Int]]
rightDiagonalsRecursiveRight []    = []
rightDiagonalsRecursiveRight [[]]  = [[]]
rightDiagonalsRecursiveRight [[x]] = [[x]]
rightDiagonalsRecursiveRight grid =
  rightDiagonal (Grid grid)
  : rightDiagonalsRecursiveRight rightSubgrid
  where
    rightSubgrid = [tail row | row <- init grid]

-- TODO
leftDiagnonals :: Grid -> [[Int]]
leftDiagnonals grid = [leftDiagonal grid]

largestProductInGrid :: Grid -> Int
largestProductInGrid grid = maximum . map product $ allDirections >>= ($ grid) >>= consecutives 4
  where allDirections = [rows, columns, rightDiagonals, leftDiagnonals]

solution :: IO Int
solution = do
  dataFile <- getDataFileName "problem_0011.txt"
  contents <- readFile dataFile
  let grid = parseGrid contents
  return $ largestProductInGrid grid
