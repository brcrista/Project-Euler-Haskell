module Data.Grid
  (
    Grid,
    columns,
    leftDiagonal,
    parseGrid,
    rightDiagonal,
    rows
  ) where

import Core (indices)
import Data.List (transpose)

type Grid = [[Int]]

rows :: Grid -> [[Int]]
rows = id

columns :: Grid -> [[Int]]
columns = transpose . rows

rightDiagonal :: Grid -> [Int]
rightDiagonal grid = zipWith (!!) (rows grid) (indices . columns $ grid)

leftDiagonal :: Grid -> [Int]
leftDiagonal grid = zipWith (!!) (rows grid) (reverse . indices . columns $ grid)

-- | Read a string representing a (possibly jagged) 2-D array of integers into a `Grid`.
-- | Rows in the grid should be separated by newlines and elements should be separated by spaces.
parseGrid :: String -> Grid
parseGrid s = [[read k :: Int | k <- words row] | row <- lines s, row /= []]
