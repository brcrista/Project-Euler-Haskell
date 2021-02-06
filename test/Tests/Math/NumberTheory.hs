module Tests.Math.NumberTheory where

import Math.NumberTheory
import Test.Tasty
import Test.Tasty.HUnit

test_divides = testGroup "divides"
  [
    testCase "1  `divides` 1"  $      1  `divides` 1  @? "",
    testCase "5  `divides` 10" $      5  `divides` 10 @? "",
    testCase "10 `divides` 5"  $ not (10 `divides` 5) @? "",
    testCase "2  `divides` 0"  $      2  `divides` 0  @? ""
  ]

test_isPrime = testGroup "isPrime"
  [
    testCase "not (isPrime 0)"              $ not (isPrime 0)              @? "",
    testCase "not (isPrime 1)"              $ not (isPrime 1)              @? "",
    testCase "all isPrime primes"           $      all isPrime primes      @? "",
    testCase "not (any isPrime composites)" $ not (any isPrime composites) @? ""
  ]
  where
    primes     = [2, 3, 5, 7, 11, 13, 41]
    composites = [4, 6, 12, 100, 10000]

test_factors = testGroup "factors"
  [
    testCase "factors 1" $ factors 1 @?= [1],
    testCase "factors 2" $ factors 2 @?= [1, 2],
    testCase "factors 8" $ factors 8 @?= [1, 2, 4, 8]
  ]