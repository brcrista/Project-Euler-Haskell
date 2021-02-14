{-|
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10001st prime number?
-}

module Page01.Problem07
  (
    nthPrime,
    solution
  )
where

import Math.NumberTheory
import Numeric.Natural

nthPrime :: Int -> Natural 
nthPrime n = filter isPrime naturals !! (n - 1)

solution = nthPrime 10001