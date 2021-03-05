module Tests.Page01.Problem11 where

import Data.Grid
import Page01.Problem11
import Test.Tasty
import Test.Tasty.HUnit

down = Grid $ replicate 4 [0 .. 4]

rightDiagonal = Grid
  [
    [2, 0, 0, 0],
    [0, 2, 0, 0],
    [0, 0, 2, 0],
    [0, 0, 0, 2]
  ]

test_largestProductInGrid = testGroup "largestProductInGrid"
  [
    testCase "Down" $ largestProductInGrid down @?= 4^4,
    testCase "Right diagonal" $ largestProductInGrid rightDiagonal @?= 2^4
  ]

test_problem_11 :: IO TestTree
test_problem_11 = do
  actual <- solution
  return $ testCase "problem 11" $ actual @?= 70600674