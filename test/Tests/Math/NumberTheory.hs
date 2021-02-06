module Tests.Math.NumberTheory where

import Math.NumberTheory
import Test.Tasty
import Test.Tasty.HUnit

testDivides = testGroup "divides"
  [
    testCase "" $     (1  `divides` 1)  @? "",
    testCase "" $     (5  `divides` 10) @? "",
    testCase "" $ not (10 `divides` 5)  @? "",
    testCase "" $     (2  `divides` 0)  @? ""
  ]

testIsPrime = testGroup "isPrime"
  [
    testCase "" $ not (isPrime 0) @? "",
    testCase "" $ not (isPrime 1) @? "",
    testCase "" $     (all isPrime primes) @? "",
    testCase "" $ not (any isPrime composites) @? ""
  ]
  where
    primes     = [2, 3, 5, 7, 11, 13, 41]
    composites = [4, 6, 12, 100, 10000]

testFactors = testGroup "factors"
  [
    testCase "" $ (factors 1) @?= [1],
    testCase "" $ (factors 2) @?= [1, 2],
    testCase "" $ (factors 8) @?= [1, 2, 4, 8]
  ]

tests = testGroup "Math.NumberTheory" [testDivides, testIsPrime, testFactors]