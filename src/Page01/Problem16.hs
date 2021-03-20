{-|
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
-}

module Page01.Problem16
  (
    digitSum,
    solution
  )
where

import Data.Char (digitToInt)
import Numeric.Natural (Natural)

digitSum :: Natural -> Int
digitSum = sum . map digitToInt . show

solution :: Int
solution = digitSum (2^1000)