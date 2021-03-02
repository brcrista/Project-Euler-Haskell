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
eratosthenes n = mask naturals $ eratosthenesRecursive 2 maybePrimes
  where
    maybePrimes = [False, False] ++ [True | _ <- [2 .. n - 1]]
    mask xs = map fst . filter snd . zip xs

eratosthenesRecursive :: Int -> [Bool] -> [Bool]
eratosthenesRecursive i maybePrimes
  | i >= length maybePrimes = maybePrimes
  | otherwise = eratosthenesRecursive (i + 1) $
    if maybePrimes !! i
    then zipWith (\ j x -> if j > i && i `divides` j then False else x) [0 ..] maybePrimes
    else maybePrimes