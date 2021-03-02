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

-- Note: the lift of left elements is kept in reverse
newtype ListZipper a = ListZipper { focus :: ([a], [a]) } deriving Show

start :: [a] -> ListZipper a
start xs = ListZipper ([], xs)

next :: ListZipper a -> ListZipper a
next (ListZipper (_, [])) = error "end of list"
next (ListZipper (xs, y : ys)) = ListZipper (y : xs, ys)

-- | All primes less than a natural number `n`, computed with the Sieve of Eratosthenes.
eratosthenes :: Natural -> [Natural]
-- eratosthenes n = mask naturals $ eratosthenesRecursive $ start maybePrimes
eratosthenes n = mask naturals $ eratosthenesRecursive $ start maybePrimes
  where
    maybePrimes = [False, False] ++ [True | _ <- [2 .. n - 1]]
    mask xs = map fst . filter snd . zip xs

eratosthenesRecursive :: ListZipper Bool -> [Bool]
eratosthenesRecursive (ListZipper (definitelyPrimes, [])) = reverse definitelyPrimes
eratosthenesRecursive zipper@(ListZipper (definitelyPrimes, ys@(stillPrime : maybePrimes))) =
  let
    i = length definitelyPrimes
    -- Re-index; maybePrimes element 0 = i + 1
    newTail = [if i `divides` (j + i + 1) then False else x | (j, x) <- zip [0 ..] maybePrimes]
    replaceTail (ListZipper (xs, ys)) = ListZipper (xs, newTail)
  in
  if stillPrime
  then eratosthenesRecursive $ replaceTail $ next zipper
  else eratosthenesRecursive $ next zipper
  -- unprimeMultiples = [2 * i, 3 * i .. n]