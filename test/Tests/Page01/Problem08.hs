module Tests.Page01.Problem08 where

import Page01.Problem08
import Test.Tasty (TestTree)
import Test.Tasty.HUnit (testCase, (@?=))

unit_largestProductInSeries = largestProductInSeries 13 (replicate 13 '1') @?= 1

test_problem_8 :: IO TestTree
test_problem_8 = do
  actual <- solution
  return $ testCase "Problem 8" $ actual @?= 23514624000