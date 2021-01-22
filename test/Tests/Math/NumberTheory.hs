module Tests.Math.NumberTheory where

import Math.NumberTheory
import Test.HUnit

testDivides = TestList $ map TestCase
  [
    assertEqual "" True  (1  `divides` 1),
    assertEqual "" True  (5  `divides` 10),
    assertEqual "" False (10 `divides` 5),
    assertEqual "" True  (2  `divides` 0)
  ]

tests = TestList [testDivides]