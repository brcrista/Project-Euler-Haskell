module Tests.Math.Combinatorics where

import Math.Combinatorics
import Test.Tasty
import Test.Tasty.HUnit

lucasNumbers = binaryRecurrence (+) 2 1

testBinaryRecurrence = testGroup "binaryRecurrence"
  [
    testCase "First 5 Lucas numbers" $ (take 5 lucasNumbers) @?= [2, 1, 3, 4, 7],
    testCase "Applies the function in the correct order" $ (take 8 $ binaryRecurrence (-) 0 1) @?= [0, 1, 1, 0, -1, -1, 0, 1],
    testCase "Applies the function in the correct order" $ (take 8 $ binaryRecurrence subtract 0 1) @?= [0, 1, -1, 2, -3, 5, -8, 13]
  ]

testFibonacci = testGroup "fibonacci"
  [
    testCase "First 7 Fibonacci numbers" $ (take 7 fibonacci) @?= [0, 1, 1, 2, 3, 5, 8]
  ]

tests = testGroup "Math.Combinatorics" [testBinaryRecurrence, testFibonacci]