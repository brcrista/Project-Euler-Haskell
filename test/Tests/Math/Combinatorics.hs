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