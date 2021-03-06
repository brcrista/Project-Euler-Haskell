{-|
Each new term in the Fibonacci sequence is generated by adding the previous two terms.
By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
-}

module Page01.Problem02
  (
    solution
  )
where

import Math.Combinatorics (fibonacci)
import Numeric.Natural (Natural)

sumEvenFibonacciNumbers :: Natural -> Natural
sumEvenFibonacciNumbers n = sum [fib | fib <- takeWhile (<= n) fibonacci, even fib]

solution :: Natural
solution = sumEvenFibonacciNumbers 4000000