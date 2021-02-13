module Tests.Page01.Problem04 where

import Page01.Problem04
import Test.Tasty.HUnit

unit_largestPalindromeProduct = largestPalindromeProduct 2 @?= 9009

unit_problem_4 = solution @?= 906609