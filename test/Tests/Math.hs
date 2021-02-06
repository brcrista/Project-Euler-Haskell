module Tests.Math where

import Math
import Test.Tasty
import Test.Tasty.HUnit

testEmptyRange = testGroup "sumRange empty range"
  [
    testCase "Sum of an empty range" $ (sumRange 0 (-1) 1)  @?= 0,
    testCase "Sum of an empty range" $ (sumRange 1 0 1)     @?= 0,
    testCase "Sum of an empty range" $ (sumRange 1 10 (-1)) @?= 0
  ]

testSingletonRange = testGroup "sumRange singleton range"
  [
    testCase "Sum of a singleton range" $ (sumRange 0 0 1) @?= 0,
    testCase "Sum of a singleton range" $ (sumRange 1 1 1) @?= 1,
    testCase "Sum of a singleton range" $ (sumRange 2 2 1) @?= 2
  ]

testNaturals = testGroup "sumRange natural numbers"
  [
    testCase "Sum of a range of natural numbers" $ (sumRange 0 10 1)  @?= 55,
    testCase "Sum of a range of natural numbers" $ (sumRange 0 30 3)  @?= 165,
    testCase "Sum of a range of natural numbers" $ (sumRange 10 20 1) @?= 165,
    testCase "Sum of a range of natural numbers" $ (sumRange 9 30 3)  @?= 156
  ]

testNegative = testGroup "sumRange negative numbers"
  [
    testCase "Sum of a range with negative numbers" $ (sumRange (-1) (-10) (-1)) @?= (-55),
    testCase "Sum of a range with negative numbers" $ (sumRange (-9) (-30) (-3)) @?= (-156),
    testCase "Sum of a range with negative numbers" $ (sumRange (-5) 5 1) @?= 0,
    testCase "Sum of a range with negative numbers" $ (sumRange (-5) 6 1) @?= 6
  ]

tests = testGroup "Math" [testEmptyRange, testSingletonRange, testNaturals, testNegative]