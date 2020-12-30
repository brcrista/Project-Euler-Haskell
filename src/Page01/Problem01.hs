module Page01.Problem01(
  solution
) where

divides a b = b `mod` a == 0

sum_multiples_of_3_and_5 n = sum [k | k <- [1 .. n], 3 `divides` k, 5 `divides` k]

solution = sum_multiples_of_3_and_5 1000