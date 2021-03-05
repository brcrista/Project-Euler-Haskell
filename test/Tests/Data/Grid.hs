module Tests.Data.Grid where

import Data.Grid
import Test.Tasty
import Test.Tasty.HUnit

grid = Grid
  [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]

test_rows = testGroup "rows"
  [
    testCase "Number of rows" $ (length . rows) grid @?= 3,
    testCase "First row"      $ (head   . rows) grid @?= [1, 2, 3]
  ]

test_columns = testGroup "columns"
  [
    testCase "Number of columns" $ (length . columns) grid @?= 3,
    testCase "First column"      $ (head   . columns) grid @?= [1, 4, 7]
  ]

unit_rightDiagonal = rightDiagonal grid @?= [1, 5, 9]
unit_leftDiagonal  = leftDiagonal  grid @?= [3, 5, 7]

-- Writing a multiline string like this strips out the newlines,
-- which we need for parsing.
-- triangle = "\
-- \3\
-- \7 4\
-- \2 4 6"
triangle = "\n3\n7 4\n2 4 6"

test_parseGrid = testGroup "parseGrid"
  [
    testCase "Number of rows" $ length gridRows @?= 3,
    testCase "First row"      $ gridRows !! 0   @?= [3],
    testCase "Second row"     $ gridRows !! 1   @?= [7, 4],
    testCase "Third row"      $ gridRows !! 2   @?= [2, 4, 6]
  ]
  where
    grid = parseGrid triangle
    gridRows = rows grid