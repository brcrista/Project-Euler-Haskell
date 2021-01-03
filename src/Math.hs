module Math
  (
    module Math.Combinatorics,
    sumRange
  ) where

import Math.Combinatorics

-- | Sum a range of values [0 .. n] in constant time.
-- Functionally equivalent to `sum [start, step .. stop]`.
sumRange :: Integral a => a -> a -> a -> a
sumRange start stop step = sum [start, step .. stop]