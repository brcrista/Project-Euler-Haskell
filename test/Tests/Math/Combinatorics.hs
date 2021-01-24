module Tests.Math.Combinatorics where

import Math.Combinatorics
import Test.HUnit

lucasNumbers = binaryRecurrence (+) 2 1

testBinaryRecurrence = TestList $ map TestCase
  [
    assertEqual "First 5 Lucas numbers" [2, 1, 3, 4, 7] (take 5 lucasNumbers),
    assertEqual "Applies the function in the correct order" [0, 1, 1, 0, -1, -1, 0, 1]   (take 8 $ binaryRecurrence (-)      0 1),
    assertEqual "Applies the function in the correct order" [0, 1, -1, 2, -3, 5, -8, 13] (take 8 $ binaryRecurrence subtract 0 1)
  ]

testFibonacci = TestList $ map TestCase
  [
    assertEqual "First 7 Fibonacci numbers" [0, 1, 1, 2, 3, 5, 8] (take 7 fibonacci)
  ]

tests = TestList [testBinaryRecurrence, testFibonacci]