module Tests.Page01.Problem20 where

import Page01.Problem20
import Test.Tasty.HUnit

unit_factorialDigitSum = factorialDigitSum 10 @?= 27

unit_problem_20 = solution @?= 648