{-|
A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
-}

module Page01.Problem04
  (
    solution
  )
where

isPalindrome :: String -> Bool
isPalindrome s = s == reverse s

largestPalindromeProduct :: Int -> Int
largestPalindromeProduct n = maximum $ map read (filter isPalindrome $ map show productsOfDigitNumbers)
  where
    nDigitNumbers = [10^(n - 1) .. 10^n - 1]
    productsOfDigitNumbers = [x * y | x <- nDigitNumbers, y <- nDigitNumbers]

solution = largestPalindromeProduct 3
