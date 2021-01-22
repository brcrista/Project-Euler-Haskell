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

testIsPrime = TestList $ map TestCase
  [
    assertEqual "" False (isPrime 0),
    assertEqual "" False (isPrime 1),
    assertEqual "" True  (all isPrime primes),
    assertEqual "" False (any isPrime composites)
  ]
  where
    primes     = [2, 3, 5, 7, 11, 13, 41]
    composites = [4, 6, 12, 100, 10000]

testFactors = TestList $ map TestCase
  [
    assertEqual "" [1]          (factors 1),
    assertEqual "" [1, 2]       (factors 2),
    assertEqual "" [1, 2, 4, 8] (factors 8)
  ]

tests = TestList [testDivides, testIsPrime, testFactors]