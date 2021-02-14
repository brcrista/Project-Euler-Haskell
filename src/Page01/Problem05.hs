{-|
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
-}

module Page01.Problem05
  (
    smallestMultiple,
    solution
  )
where

import Numeric.Natural

-- | The smallest positive number divisible by all integers in [1, `n`].
smallestMultiple :: Natural -> Natural
smallestMultiple n = foldl1 lcm [1 .. n]

solution = smallestMultiple 20