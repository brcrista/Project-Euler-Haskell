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
import Numeric.Natural (Natural)

isPalindrome :: String -> Bool
isPalindrome = (==) <*> reverse

palindromes :: [Natural] -> [Natural]
palindromes = map read . filter isPalindrome . map show

largestPalindromeProduct :: Natural -> Natural
largestPalindromeProduct = maximum . palindromes . join allProductsOf . nDigitNumbers
  where
    nDigitNumbers n = [10^(n - 1) .. 10^n - 1]
    allProductsOf  = liftA2 (*)

solution :: Natural
solution = largestPalindromeProduct 3
