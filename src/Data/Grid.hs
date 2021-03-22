module Data.Grid
  (
    Grid(..),
    columns,
    leftDiagonal,
    inBounds,
    parseGrid,
    rightDiagonal
  ) where

import Core (indices)
import Data.List (transpose)

newtype Grid = Grid { rows :: [[Int]] }

columns :: Grid -> [[Int]]
columns = transpose . rows

rightDiagonal :: Grid -> [Int]
rightDiagonal grid = zipWith (!!) (rows grid) (indices . columns $ grid)

leftDiagonal :: Grid -> [Int]
leftDiagonal grid = zipWith (!!) (rows grid) (reverse . indices . columns $ grid)

-- | Read a string representing a (possibly jagged) 2-D array of integers into a `Grid`.
-- | Rows in the grid should be separated by newlines and elements should be separated by spaces.
parseGrid :: String -> Grid
parseGrid s = Grid [[read k :: Int | k <- words row] | row <- lines s, row /= []]

-- | Whether `rowIndex`, `columnIndex` are in bounds for the possibly jagged `grid`.
inBounds :: Grid -> Int -> Int -> Bool
inBounds grid rowIndex columnIndex = and
  [
    0 <= rowIndex,
    rowIndex < length (rows grid),
    0 <= columnIndex,
    columnIndex < length (rows grid !! rowIndex)
  ]