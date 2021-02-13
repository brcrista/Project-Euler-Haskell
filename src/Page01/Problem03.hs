{-|
A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
-}

module Page01.Problem03
  (
    solution
  )
where

import Math.NumberTheory (factors, isPrime)

largestPrimeFactor n = maximum $ filter isPrime (factors n)

solution = largestPrimeFactor 600851475143