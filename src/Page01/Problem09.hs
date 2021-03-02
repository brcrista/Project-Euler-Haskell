{-|
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which a^2 + b^2 = c^2

For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product a * b * c.
-}

module Page01.Problem09
  (
    solution
  )
where

import Numeric.Natural (Natural)

pythagoreanTriples :: [(Natural, Natural, Natural)]
pythagoreanTriples =
  [
    (a, b, c) | c <- [3 ..], b <- [2 .. c], a <- [1 .. b], a^2 + b^2 == c^2
  ]

sum3Equals :: (Eq a, Num a) => a -> (a, a, a) -> Bool
sum3Equals n (a, b, c) = a + b + c == n

-- | The product of the Pythagorean triple whose sum equals 1000.
specialPythagoreanTriple :: (Natural, Natural, Natural)
specialPythagoreanTriple = head $ filter (sum3Equals 1000) pythagoreanTriples

solution :: Natural
solution = a * b * c
  where (a, b, c) = specialPythagoreanTriple