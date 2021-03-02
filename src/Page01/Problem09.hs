{-|
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product a * b * c.
-}

module Page01.Problem09
  (
    isPythagorean,
    solution
  )
where

import Numeric.Natural (Natural)

isPythagorean :: Natural -> Natural -> Natural -> Bool
-- ^2 is just as fast as * in Haskell
isPythagorean a b c = a^2 + b^2 == c^2

pythagoreanTriples :: [(Natural, Natural, Natural)]
pythagoreanTriples =
  [
    (a, b, c) | c <- [3 ..], b <- [2 .. c], a <- [1 .. b], isPythagorean a b c
  ]

sum3Equals :: (Eq a, Num a) => a -> (a, a, a) -> Bool
sum3Equals n (a, b, c) = a + b + c == n

-- | The Pythagorean triples whose sum equals `n`.
pythagoreanSumEquals :: Natural -> [(Natural, Natural, Natural)]
pythagoreanSumEquals n = filter (sum3Equals n) pythagoreanTriples

solution :: Natural
solution = a * b * c
  where (a, b, c) = head $ pythagoreanSumEquals 1000