module Math.Combinatorics
  (
    binaryRecurrence,
    binom,
    factorial,
    factorials,
    fibonacci,
    triangleNumbers
  )
where

import Numeric.Natural (Natural)

-- | Define a recurrence relation using a binary function and two initial values.
-- The recurrence will follow the pattern `a[n] = f a[n - 1] a[n - 2]`.
binaryRecurrence :: (a -> a -> a) -> a -> a -> [a]
binaryRecurrence f x y = x : y : zipWith f (tail self) self
  where self = binaryRecurrence f x y

-- | The infinite sequence of Fibonacci numbers.
fibonacci :: Num a => [a]
fibonacci = binaryRecurrence (+) 0 1

-- | The infinite sequence of triangle numbers, starting with 0 as the 0th triangle number.
triangleNumbers :: Integral a => [a]
triangleNumbers = scanl (+) 0 [1 ..]

-- | The infinite sequence of factorials, starting with 0! = 1.
factorials :: Integral a => [a]
factorials = scanl (*) 1 [1 ..]

-- | The nth factorial.
factorial :: Integral a => Natural -> a
factorial n = factorials !! fromIntegral n

-- | The binomial coefficient "n choose k."
binom :: Integral a => Natural -> Natural -> a
binom n k = factorial n `div` (factorial k * factorial (n - k))