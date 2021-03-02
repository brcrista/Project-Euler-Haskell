module Tests.Page01.Problem10 where

import Page01.Problem10
import Test.Tasty.HUnit

unit_sumOfPrimesBelow = sumOfPrimesBelow 10 @?= 17

-- unit_problem_10 = solution @?= 142913828922