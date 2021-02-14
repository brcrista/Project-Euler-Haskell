module Tests.Page01.Problem07 where

import Page01.Problem07
import Test.Tasty.HUnit

unit_nthPrime = nthPrime 6 @?= 13

unit_problem_7 = solution @?= 104743