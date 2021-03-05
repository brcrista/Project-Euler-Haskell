module Tests.Data.Grid where

import Data.Grid
import Test.Tasty
import Test.Tasty.HUnit ( (@?=), testCase )

grid :: Grid
grid =
  [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]

test_rows = testGroup "rows"
  [
    testCase "Empty grid"     $ rows [] @?= [],
    testCase "Number of rows" $ (length . rows) grid @?= 3,
    testCase "First row"      $ (head   . rows) grid @?= [1, 2, 3]
  ]

test_columns = testGroup "columns"
  [
    testCase "Empty grid"        $ columns [] @?= [],
    testCase "Number of columns" $ (length . columns) grid @?= 3,
    testCase "First column"      $ (head   . columns) grid @?= [1, 4, 7]
  ]

test_rightDiagonal = testGroup "rightDiagonal"
  [
    testCase "Empty grid"  $ rightDiagonal []   @?= [],
    testCase "Square grid" $ rightDiagonal grid @?= [1, 5, 9]
  ]

test_leftDiagonal = testGroup "leftDiagonal"
  [
    testCase "Empty grid"  $ leftDiagonal []   @?= [],
    testCase "Square grid" $ leftDiagonal grid @?= [3, 5, 7]
  ]

-- Writing a multiline string like this strips out the newlines,
-- which we need for parsing.
-- triangle = "\
-- \3\
-- \7 4\
-- \2 4 6"
triangle = "\n3\n7 4\n2 4 6"

test_parseGrid = testGroup "parseGrid"
  [
    testCase "Number of rows" $ length grid @?= 3,
    testCase "First row"      $ grid !! 0   @?= [3],
    testCase "Second row"     $ grid !! 1   @?= [7, 4],
    testCase "Third row"      $ grid !! 2   @?= [2, 4, 6]
  ]
  where
    grid = parseGrid triangle