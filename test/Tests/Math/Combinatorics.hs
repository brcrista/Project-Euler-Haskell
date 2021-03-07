module Tests.Math.Combinatorics where

import Math.Combinatorics
import Test.Tasty
import Test.Tasty.HUnit

lucasNumbers = binaryRecurrence (+) 2 1

test_binaryRecurrence = testGroup "binaryRecurrence"
  [
    testCase "First 5 Lucas numbers" $ take 5 lucasNumbers @?= [2, 1, 3, 4, 7],
    testCase "Applies the function in the correct order" $ take 8 (binaryRecurrence (-) 0 1) @?= [0, 1, 1, 0, -1, -1, 0, 1],
    testCase "Applies the function in the correct order" $ take 8 (binaryRecurrence subtract 0 1) @?= [0, 1, -1, 2, -3, 5, -8, 13]
  ]

test_fibonacci = testGroup "fibonacci"
  [
    testCase "First 7 Fibonacci numbers" $ take 7 fibonacci @?= [0, 1, 1, 2, 3, 5, 8]
  ]

unit_triangleNumbers = take 11 triangleNumbers @?= [0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55]

unit_factorials = take 7 factorials @?= [1, 1, 2, 6, 24, 120, 720]

test_binom = testGroup "binom"
  [
    testCase "1" $ binom 1 0 @?= 1,
    testCase "2" $ binom 1 1 @?= 1,
    testCase "3" $ binom 10 10 @?= 1,
    testCase "4" $ binom 10 1 @?= 10,
    testCase "5" $ binom 4 2 @?= 6,
    testCase ""  $ binom 4 3 @?= 4,
    testCase ""  $ binom 10 6 @?= 210,
    testCase "" $ binom 6 0 @?= 1,
    testCase "" $ binom 6 1 @?= 6,
    testCase "" $ binom 6 2 @?= 15,
    testCase "" $ binom 6 3 @?= 20,
    testCase "" $ binom 6 4 @?= 15,
    testCase "" $ binom 6 5 @?= 6,
    testCase "" $ binom 6 6 @?= 1
  ]