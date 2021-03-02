module Math.NumberTheory
  (
    divides,
    eratosthenes,
    factors,
    isPrime,
    naturals
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

-- | The pairs of factors of a natural number `n`.
factorPairs :: Natural -> [(Natural, Natural)]
factorPairs n = [(x, n `div` x) | x <- [1 .. floorSqrt n], x `divides` n]
  where floorSqrt = floor . sqrt . fromIntegral

-- | The factors of a natural number `n`.
factors :: Natural -> [Natural]
factors n = sort . nub $ factorPairs n >>= \ (a, b) -> [a, b]

-- | Whether a natural number `n` is prime.
isPrime :: Natural -> Bool
isPrime n = n > 1 && factors n == [1, n]

-- | All primes less than a natural number `n`, computed with the Sieve of Eratosthenes.
eratosthenes :: Natural -> [Natural]
eratosthenes n = mask (eratosthenesRecursive n 2 maybePrime) naturals
  where
    maybePrime = [False, False] ++ [True | _ <- [2 .. n - 1]]
    mask bools = map snd . filter fst . zip bools

eratosthenesRecursive :: Natural -> Natural -> [Bool] -> [Bool]
eratosthenesRecursive n i maybePrime
  | i >= n = maybePrime
  | otherwise = eratosthenesRecursive n (i + 1) $
    if maybePrime !! idx
    then maybePrime'
    else maybePrime
  where
    idx = fromIntegral i
    maybePrime' = prev ++ next
    prev = take (idx + 1) maybePrime
    next = [not (idx `divides` j) && (maybePrime !! j) | j <- [idx + 1 .. fromIntegral n - 1]]
    -- unprimeMultiples = [2 * i, 3 * i .. n]