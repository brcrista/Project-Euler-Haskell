module Tests.Page01.Problem17 where

import Page01.Problem17
import Test.Tasty.HUnit
import Tests.Helpers

test_toEnglish = caseGroup "toEnglish"
  [
    toEnglish 1    @?= "one",
    toEnglish 15   @?= "fifteen",
    toEnglish 20   @?= "twenty",
    toEnglish 22   @?= "twenty two",
    toEnglish 60   @?= "sixty",
    toEnglish 64   @?= "sixty four",
    toEnglish 100  @?= "one hundred",
    toEnglish 297  @?= "two hundred and ninety seven",
    toEnglish 811  @?= "eight hundred and eleven",
    toEnglish 1000 @?= "one thousand"
  ]

unit_letterCountForNumber = letterCountForNumber 5 @?= 9

unit_problem_17 = solution @?= 21124