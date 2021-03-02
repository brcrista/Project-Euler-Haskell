{-|
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
-}

module Page01.Problem10
  (
    solution,
    sumOfPrimesBelow
  )
where

import Math.NumberTheory (eratosthenes)
import Numeric.Natural (Natural)

-- | The sum of all prime numbers less than a given natural number.
sumOfPrimesBelow :: Natural -> Natural
sumOfPrimesBelow = sum . eratosthenes

solution :: Natural
solution = sumOfPrimesBelow 2000000