module Tests.Page01.Problem08 where

import Page01.Problem08
import Test.Tasty (TestTree)
import Test.Tasty.HUnit (testCase, (@?=))

test_largestProductInDataFile :: IO TestTree
test_largestProductInDataFile = do
  actual <- largestProductInDataFile 4
  return $ testCase "largestProductInDataFile" $ actual @?= 5832

test_problem_8 :: IO TestTree
test_problem_8 = do
  actual <- solution
  return $ testCase "Problem 8" $ actual @?= 23514624000