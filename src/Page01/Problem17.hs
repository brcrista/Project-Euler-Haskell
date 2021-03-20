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

import Core ((<&>), (??))
import Data.Char (isSpace)
import Data.Function
import Data.Maybe
import Numeric.Natural (Natural)

ones =
  [
    ("1", "one"),
    ("2", "two"),
    ("3", "three"),
    ("4", "four"),
    ("5", "five"),
    ("6", "six"),
    ("7", "seven"),
    ("8", "eight"),
    ("9", "nine")
  ]

teens =
  [
    ("10", "ten"),
    ("11", "eleven"),
    ("12", "twelve"),
    ("13", "thirteen"),
    ("14", "fourteen"),
    ("15", "fifteen"),
    ("16", "sixteen"),
    ("17", "seventeen"),
    ("18", "eighteen"),
    ("19", "nineteen")
  ]

tens =
  [
    ("2", "twenty"),
    ("3", "thirty"),
    ("4", "forty"),
    ("5", "fifty"),
    ("6", "sixty"),
    ("7", "seventy"),
    ("8", "eighty"),
    ("9", "ninety")
  ]

toEnglish :: Natural -> String
toEnglish n = toEnglishS (show n)
  where
    toEnglishS :: String -> String
    toEnglishS "" = ""
    toEnglishS ('0' : s) = toEnglishS s
    toEnglishS s = fromMaybe (error ("numeral not recognized: " ++ s)) (tryLookup s)

    tryLookup :: String -> Maybe String
    tryLookup s =
      case length s of
        1 -> lookup s ones
        2 -> lookup s teens
          ?? lookup [head s] tens <&> (++ " ") <&> (++ toEnglishS (tail s))
        3 -> lookup [head s] ones <&> (++ " hundred") <&> (++ if all (== '0') (tail s) then "" else " and " ++ toEnglishS (tail s))
        4 -> Just "one thousand"
        _ -> Nothing

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