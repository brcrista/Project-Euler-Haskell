module Tests.Page01.Problem11 where

import Data.Grid
import Page01.Problem11
import Test.Tasty
import Test.Tasty.HUnit

grid1 =
  [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]

unit_rightDiagonals = rightDiagonals grid1 @?= [[0, 4, 8], [3, 7], [6], [1, 5], [2]]
unit_leftDiagonals  = leftDiagonals  grid1 @?= [[2, 4, 6], [1, 3], [0], [5, 7], [8]]

grid2 = replicate 4 [0 .. 4]

grid3 =
  [
    [2, 0, 0, 0],
    [0, 2, 0, 0],
    [0, 0, 2, 0],
    [0, 0, 0, 2]
  ]

test_largestProductInGrid = testGroup "largestProductInGrid"
  [
    testCase "Row"            $ largestProductInGrid grid1 @?= 6 * 7 * 8,
    testCase "Column"         $ largestProductInGrid grid2 @?= 4^4,
    testCase "Right diagonal" $ largestProductInGrid grid3 @?= 2^4
  ]

test_problem_11 :: IO TestTree
test_problem_11 = do
  actual <- solution
  return $ testCase "problem 11" $ actual @?= 70600674