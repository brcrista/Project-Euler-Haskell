{-|
You are given the following information, but you may prefer to do some research for yourself.

  1 Jan 1900 was a Monday.
  Thirty days has September,
  April, June and November.
  All the rest have thirty-one,
  Saving February alone,
  Which has twenty-eight, rain or shine.
  And on leap years, twenty-nine.
  A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
-}

module Page01.Problem19
  (
    solution
  )
where

import Data.Bool (bool)
import Data.Function ((&))
import Math.NumberTheory (divides)

data Day =
  Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday
  deriving (Show, Enum, Eq)

data Month =
  January
  | February
  | March
  | April
  | May
  | June
  | July
  | August
  | September
  | October
  | November
  | December
  deriving (Show, Enum, Eq)

type Year = Int

isLeapYear :: Year -> Bool
isLeapYear year = 4 `divides` year && (400 `divides` year || not (100 `divides` year))

daysInMonth :: Integral a => Month -> Year -> a
daysInMonth January   _    = 31
daysInMonth February  year = if isLeapYear year then 29 else 28
daysInMonth March     _    = 31
daysInMonth April     _    = 30
daysInMonth May       _    = 31
daysInMonth June      _    = 30
daysInMonth July      _    = 31
daysInMonth August    _    = 31
daysInMonth September _    = 30
daysInMonth October   _    = 31
daysInMonth November  _    = 30
daysInMonth December  _    = 31

daysInYear :: Integral a => Year -> a
daysInYear = bool 365 366 . isLeapYear

-- | The day of the week `daysElapsed` after `day`.
dayMod :: Day -> Int -> Day
dayMod day daysElapsed = toEnum $ (fromEnum day + daysElapsed) `mod` 7

firstDaysOfMonths :: [Day]
firstDaysOfMonths = (,) <$> [January .. December] <*> [1901 .. 2000] & map (uncurry daysInMonth) & scanl dayMod firstDayOf1901
  where
    firstDayOf1901 = dayMod Monday $ daysInYear 1900 -- 1 Jan 1900 was a Monday

countSundaysOnFirstOfMonth :: Int
countSundaysOnFirstOfMonth = length . filter (== Sunday) $ firstDaysOfMonths

solution :: Int
solution = countSundaysOnFirstOfMonth