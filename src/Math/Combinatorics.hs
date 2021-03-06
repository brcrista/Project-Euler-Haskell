module Math.Combinatorics
  (
    binaryRecurrence,
    fibonacci,
    triangleNumbers
  )
where

import Math.NumberTheory (naturals)
import Numeric.Natural (Natural)

-- | Define a recurrence relation using a binary function and two initial values.
-- The recurrence will follow the pattern `a[n] = f a[n - 1] a[n - 2]`.
binaryRecurrence :: (a -> a -> a) -> a -> a -> [a]
binaryRecurrence f x y = x : y : zipWith f (tail self) self
  where self = binaryRecurrence f x y

-- | The infinite sequence of Fibonacci numbers.
fibonacci :: [Natural]
fibonacci = binaryRecurrence (+) 0 1

-- | The infinite sequence of triangle numbers, starting with 0 as the 0th triangle number.
triangleNumbers :: [Natural]
triangleNumbers = scanl1 (+) naturals