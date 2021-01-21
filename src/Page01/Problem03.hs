module Page01.Problem03
  (
    solution
  )
where

import Math.NumberTheory (factors, isPrime)

largestPrimeFactor n = maximum $ filter isPrime (factors n)

solution = largestPrimeFactor 600851475143