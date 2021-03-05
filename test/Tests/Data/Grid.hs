module Tests.Data.Grid where

import Data.Grid
import Test.Tasty
import Test.Tasty.HUnit

triangle = "\
\3\
\7 4\
\2 4 6"

test_parseGrid = testGroup "parseGrid"
  [
    testCase "Number of rows" $ length gridRows @?= 3,
    testCase "First row"  $ gridRows !! 0 @?= [3],
    testCase "Second row" $ gridRows !! 1 @?= [7, 4],
    testCase "Third row"  $ gridRows !! 2 @?= [2, 4, 6]
  ]
  where
    grid = parseGrid triangle
    gridRows = rows grid