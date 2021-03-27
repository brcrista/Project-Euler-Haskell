{-|
n! means n × (n − 1) × ... × 3 × 2 × 1.

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!.
-}

module Page01.Problem20
  (
    factorialDigitSum,
    solution
  )
where

import Data.Char
import Math.Combinatorics (factorial)
import Numeric.Natural (Natural)

factorialDigitSum :: Natural -> Int
factorialDigitSum = sum . map digitToInt . show . factorial

solution :: Int
solution = factorialDigitSum 100