module Page01.Problem01
  (
    solution
  )
where

import Math

divides :: Integral a => a -> a -> Bool
divides a b = b `mod` a == 0

sumMultiplesOf step n = sumRange 0 n step
sumMultiplesOf3 = sumMultiplesOf 3
sumMultiplesOf5 = sumMultiplesOf 5

-- Multiples of both 3 and 5 have been double-counted.
sumMultiplesOf3And5 = sumMultiplesOf (3 * 5)

sumMultiplesOf3Or5LessThan n = sumMultiplesOf3 lessThan + sumMultiplesOf5 lessThan - sumMultiplesOf3And5 lessThan
  where lessThan = n - 1

solution = sumMultiplesOf3Or5LessThan 1000