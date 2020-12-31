module Page01.Problem02
  (
    solution
  )
where

import Math.Combinatorics (fibonacci)

sumEvenFibonacciNumbers n = sum [fib | fib <- takeWhile (<= n) fibonacci, even fib]

solution = sumEvenFibonacciNumbers 4000000