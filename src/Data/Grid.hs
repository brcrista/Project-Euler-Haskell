module Data.Grid
  (
    Grid(..),
    parseGrid
  ) where

newtype Grid = Grid { rows :: [[Int]] }

-- | Read a string representing a (possibly jagged) 2-D array of integers into a `Grid`.
-- | Rows in the grid should be separated by newlines and elements should be separated by spaces.
parseGrid :: String -> Grid
parseGrid = undefined
