module Math.NumberTheory
  (
    divides,
    factors,
    isPrime,
    naturals,
    primes
  )
where

import Data.List (nub, sort)
import Numeric.Natural (Natural)

-- | The infinite sequence of natural numbers.
naturals :: [Natural ]
naturals = [0 ..]

-- | Whether `b` is a multiple of `a`.
divides :: Integral a => a -> a -> Bool
divides a b = b `mod` a == 0

-- | The pairs of factors of a natural number `n`, computed using trial division.
factorPairs :: Natural -> [(Natural, Natural)]
factorPairs n = [(x, n `div` x) | x <- [1 .. floorSqrt n], x `divides` n]
  where floorSqrt = floor . sqrt . fromIntegral

-- | The factors of a natural number `n`.
factors :: Natural -> [Natural]
factors n = sort . nub $ factorPairs n >>= \ (a, b) -> [a, b]

-- | Whether a natural number `n` is prime.
isPrime :: Natural -> Bool
isPrime n = n > 1 && factors n == [1, n]

-- | The infinite list of prime numbers, computed with a lazy Sieve of Eratosthenes.
-- | From https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf.
primes :: [Natural]
primes = 2 : ([3 ..] `minus` composites)
  where
    composites = foldr merge [] [multiples p | p <- primes]
    multiples n = map (n *) [n ..]

    minus :: Ord a => [a] -> [a] -> [a]
    (x : xs) `minus` (y : ys)
      | x <  y = x : (xs `minus` (y : ys))
      | x == y = xs `minus` ys
      | x >  y = (x : xs) `minus` ys

    merge :: Ord a => [a] -> [a] -> [a]
    merge  (x : xs) ys = x : merge' xs ys
    merge' (x : xs) (y : ys)
      | x <  y = x : merge' xs (y : ys)
      | x == y = x : merge' xs ys
      | x >  y = y : merge' (x : xs) ys