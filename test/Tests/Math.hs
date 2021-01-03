module Tests.Math where

import Math
import Test.HUnit

testEmptyRange = TestList
  [
    TestCase (assertEqual "Sum of an empty range" 0 (sumRange 0 (-1) 1)),
    TestCase (assertEqual "Sum of an empty range" 0 (sumRange 1 0 1)),
    TestCase (assertEqual "Sum of an empty range" 0 (sumRange 1 10 (-1)))
  ]

testSingletonRange = TestList
  [
    TestCase (assertEqual "Sum of a singleton range" 0 (sumRange 0 0 1)),
    TestCase (assertEqual "Sum of a singleton range" 1 (sumRange 1 1 1)),
    TestCase (assertEqual "Sum of a singleton range" 2 (sumRange 2 2 1))
  ]

testNaturals = TestList
  [
    TestCase (assertEqual "Sum of a range of natural numbers" 55 (sumRange 0 10 1)),
    TestCase (assertEqual "Sum of a range of natural numbers" 165 (sumRange 0 30 3)),
    TestCase (assertEqual "Sum of a range of natural numbers" 165 (sumRange 10 20 1)),
    TestCase (assertEqual "Sum of a range of natural numbers" 156 (sumRange 9 30 3))
  ]

testNegative = TestList
  [
    TestCase (assertEqual "Sum of a range with negative numbers" (-55) (sumRange (-1) (-10) (-1))),
    TestCase (assertEqual "Sum of a range with negative numbers" (-156) (sumRange (-9) (-30) (-3))),
    TestCase (assertEqual "Sum of a range with negative numbers" 0 (sumRange (-5) 5 1)),
    TestCase (assertEqual "Sum of a range with negative numbers" 6 (sumRange (-5) 6 1))
  ]

tests = TestList [testEmptyRange, testSingletonRange, testNaturals, testNegative]