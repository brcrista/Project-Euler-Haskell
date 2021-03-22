{-|
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle in problem_0018.txt
-}

module Page01.Problem18
  (
    longestPath,
    solution
  )
where

import Data.Grid (parseGrid, Grid)
import Paths_Project_Euler_Haskell (getDataFileName)

-- | Find the largest sum along a path through a (possibly jagged) 2-D array of integers.

-- | Allowed paths begin at element `head $ head grid` and proceed to one of the adjacent elements
-- | in the row below. So at coordinate `(i, j)`, the next elements eligible to traverse are
-- | `(i + 1, j)` and `(i + 1, j + 1)` (assuming they are in bounds).
longestPath :: Grid -> Int
longestPath = undefined

solution :: IO Int
solution = do
  dataFile <- getDataFileName "problem_0018.txt"
  contents <- readFile dataFile
  return $ longestPath $ parseGrid contents
