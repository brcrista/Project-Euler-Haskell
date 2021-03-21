{-|
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens.
For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.
-}

module Page01.Problem17
  (
    letterCountForNumbers,
    solution,
    toEnglish
  )
where

import Data.Char (isSpace)
import Numeric.Natural (Natural)

englishWordForNumber n = case n of
  0    -> "zero"
  1    -> "one"
  2    -> "two"
  3    -> "three"
  4    -> "four"
  5    -> "five"
  6    -> "six"
  7    -> "seven"
  8    -> "eight"
  9    -> "nine"
  10   -> "ten"
  11   -> "eleven"
  12   -> "twelve"
  13   -> "thirteen"
  14   -> "fourteen"
  15   -> "fifteen"
  16   -> "sixteen"
  17   -> "seventeen"
  18   -> "eighteen"
  19   -> "nineteen"
  20   -> "twenty"
  30   -> "thirty"
  40   -> "forty"
  50   -> "fifty"
  60   -> "sixty"
  70   -> "seventy"
  80   -> "eighty"
  90   -> "ninety"
  100  -> "hundred"
  1000 -> "thousand"
  _    -> error ("no English word for " ++ show n)

toEnglish :: Natural -> String
toEnglish = toEnglishS . show
  where
    englishNumberS :: String -> String
    englishNumberS = englishWordForNumber . read

    toEnglishS :: String -> String
    toEnglishS s =
      case length s of
        1 -> englishNumberS s
        2 -> if head s == '1' || last s == '0'
          then englishNumberS s
          else unwords [englishNumberS (head s : "0"), toEnglishS (tail s)]
        3 -> unwords $ [englishNumberS [head s], englishWordForNumber 100] ++
          if all (== '0') (tail s)
            then []
            else ["and", toEnglishS (tail s)]
        4 -> unwords $ map englishWordForNumber [1, 1000]
        _ -> error ("numeral not recognized: " ++ s)

-- | The number of letters needed to spell out the English words
-- | for the numbers 1 to `n`.
letterCountForNumbers :: Natural -> Int
letterCountForNumbers n =
  let
    englishNumbers = map toEnglish [1 .. n]
    lettersInWord  = length . filter (not . isSpace)
  in
    sum $ map lettersInWord englishNumbers

solution :: Int
solution = letterCountForNumbers 1000