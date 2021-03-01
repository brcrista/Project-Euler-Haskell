{-|
The sum of the squares of the first ten natural numbers is

    1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is

    (1 + 2 + ... + 10)^2 = 55^2 = 385

Hence, the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
-}

module Page01.Problem06
  (
    solution,
    sumSquareDifference
  )
where

import Control.Monad (join)
import Numeric.Natural (Natural)

square :: Num a => a -> a
square = join (*)

sumOfSquares :: Num a => [a] -> a
sumOfSquares = sum . map square

squareOfSums :: Num a => [a] -> a
squareOfSums = square . sum

sumSquareDifference :: Natural -> Natural
sumSquareDifference n = squareOfSums [1 .. n] - sumOfSquares [1 .. n]

solution = sumSquareDifference 100