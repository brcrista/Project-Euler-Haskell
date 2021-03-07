module Tests.Page01.Problem13 where

import Page01.Problem13
import Test.Tasty
import Test.Tasty.HUnit

test_problem_13 :: IO TestTree
test_problem_13 = do
  actual <- solution
  return $ testCase "problem 13" $ actual @?= "5537376230"