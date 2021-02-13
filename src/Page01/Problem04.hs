{-|
A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
-}

module Page01.Problem04
  (
    largestPalindromeProduct,
    solution
  )
where

import Control.Applicative (liftA2)
import Control.Monad (join)

isPalindrome :: String -> Bool
isPalindrome = (==) <*> reverse

palindromes :: [Int] -> [Int]
palindromes = map read . filter isPalindrome . map show

largestPalindromeProduct :: Int -> Int
largestPalindromeProduct n = maximum $ palindromes $ join allProductsOf nDigitNumbers
  where
    nDigitNumbers = [10^(n - 1) .. 10^n - 1]
    allProductsOf = liftA2 (*)

solution = largestPalindromeProduct 3
