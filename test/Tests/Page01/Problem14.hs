module Tests.Page01.Problem14 where

import Page01.Problem14
import Test.Tasty
import Test.Tasty.HUnit

test_collatz = testGroup "collatz"
  [
    testCase "collatz 1"  $ collatz 1  @?= [1],
    testCase "collatz 13" $ collatz 13 @?= [13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
  ]

unit_problem_14 = solution @?= 837799