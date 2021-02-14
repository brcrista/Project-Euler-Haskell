module Tests.Page01.Problem05 where

import Page01.Problem05
import Test.Tasty.HUnit

unit_smallestMultiple = smallestMultiple 10 @?= 2520

unit_problem_5 = solution @?= 232792560