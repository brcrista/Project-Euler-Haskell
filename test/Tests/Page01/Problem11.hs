module Tests.Page01.Problem11 where

import Data.Grid
import Page01.Problem11
import Test.Tasty
import Test.Tasty.HUnit

grid1 = replicate 4 [0 .. 4]

grid2 =
  [
    [2, 0, 0, 0],
    [0, 2, 0, 0],
    [0, 0, 2, 0],
    [0, 0, 0, 2]
  ]

test_largestProductInGrid = testGroup "largestProductInGrid"
  [
    testCase "Down"           $ largestProductInGrid grid1 @?= 4^4,
    testCase "Right diagonal" $ largestProductInGrid grid2 @?= 2^4
  ]

test_problem_11 :: IO TestTree
test_problem_11 = do
  actual <- solution
  return $ testCase "problem 11" $ actual @?= 70600674