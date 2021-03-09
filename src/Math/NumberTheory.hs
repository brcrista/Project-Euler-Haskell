module Math.NumberTheory
  (
    divides,
    factors,
    isPrime,
    primes
  )
where

import Data.List (nub, sort)
import Numeric.Natural (Natural)

-- | Whether `b` is a multiple of `a`.
divides :: Integral a => a -> a -> Bool
divides a b = b `mod` a == 0

-- | The pairs of factors of a natural number `n`, computed using trial division.
factorPairs :: Integral a => Natural -> [(a, a)]
factorPairs 0 = [(0, 0)]
factorPairs n = [(x, n' `div` x) | x <- [1 .. floorSqrt n'], x `divides` n']
  where
    floorSqrt = floor . sqrt . fromIntegral
    n' = fromIntegral n

-- | The factors of an integer `n`.
factors :: Int -> [Int]
factors n
  | n < 0 =
    let
      positiveFactors = factors (-n)
      negativeFactors = map negate positiveFactors
    in
      reverse negativeFactors ++ positiveFactors
  | otherwise = sort . nub $ factorPairs (fromIntegral n) >>= \ (a, b) -> [a, b]

-- | Whether an integer `n` is prime.
isPrime :: Int -> Bool
isPrime n = n > 1 && factors n == [1, n]

-- | The infinite list of prime numbers, computed with a lazy Sieve of Eratosthenes.
-- | From https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf.
primes :: Integral a => [a]
primes = 2 : ([3 ..] `minus` composites)
  where
    -- `foldr merge` forces the multiples of primes to be yielded in order.
    composites = foldr merge [] [multiples p | p <- primes]
    multiples n = map (n *) [n ..]

    -- | Yield elements from `xs` as long as they are less than the next element from `ys`.
    minus :: Ord a => [a] -> [a] -> [a]
    (x : xs) `minus` (y : ys)
      | x <  y = x : (xs `minus` (y : ys))
      | x == y = xs `minus` ys
      | x >  y = (x : xs) `minus` ys

    -- | Order `xs` and `ys` so the smaller elements come first, removing duplicates.
    -- | `merge` is non-strict in its left argument,
    -- | so it can be used with `foldr` on an infinite list.
    merge :: Ord a => [a] -> [a] -> [a]
    merge  (x : xs) ys = x : merge' xs ys
    merge' (x : xs) (y : ys)
      | x <  y = x : merge' xs (y : ys)
      | x == y = x : merge' xs ys
      | x >  y = y : merge' (x : xs) ys