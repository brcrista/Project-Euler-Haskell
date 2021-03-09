{-|
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
-}

module Page01.Problem01
  (
    solution
  )
where

import Math (sumRange)
import Math.NumberTheory (divides)
import Numeric.Natural (Natural)

sumMultiplesOf :: Integral a => a -> a -> a
sumMultiplesOf step n = sumRange 0 n step

sumMultiplesOf3 :: Natural -> Natural
sumMultiplesOf3 = sumMultiplesOf 3

sumMultiplesOf5 :: Natural -> Natural
sumMultiplesOf5 = sumMultiplesOf 5

-- Multiples of both 3 and 5 have been double-counted.
sumMultiplesOf3And5 :: Natural -> Natural
sumMultiplesOf3And5 = sumMultiplesOf (3 * 5)

sumMultiplesOf3Or5LessThan :: Natural -> Natural
sumMultiplesOf3Or5LessThan n = sumMultiplesOf3 lessThan + sumMultiplesOf5 lessThan - sumMultiplesOf3And5 lessThan
  where lessThan = n - 1

solution :: Natural
solution = sumMultiplesOf3Or5LessThan 1000