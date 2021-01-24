module Math.NumberTheory
  (
    divides,
    factors,
    isPrime
  )
where

import Data.List (nub, sort)
import Numeric.Natural

-- | Whether `b` is a multiple of `a`.
divides :: Integral a => a -> a -> Bool
divides a b = b `mod` a == 0

-- | The pairs of factors of a natural number `n`.
factorPairs :: Natural -> [(Natural, Natural)]
factorPairs n = [(x, n `div` x) | x <- [1 .. floorSqrt n], x `divides` n]
  where floorSqrt = floor . sqrt . fromIntegral

-- | The factors of a natural number `n`.
factors :: Natural -> [Natural]
factors n = sort . nub $ concat [[a, b] | (a, b) <- factorPairs n]

-- | Whether a natural number `n` is prime.
isPrime :: Natural -> Bool
isPrime n = n > 1 && factors n == [1, n]