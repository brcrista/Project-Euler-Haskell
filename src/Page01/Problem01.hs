module Page01.Problem01
  ( solution,
  )
where

divides a b = b `mod` a == 0

sumMultiplesOf3And5 n = sum [k | k <- [1 .. n - 1], 3 `divides` k || 5 `divides` k]

solution = sumMultiplesOf3And5 1000