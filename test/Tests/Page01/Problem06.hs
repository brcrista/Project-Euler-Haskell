module Tests.Page01.Problem06 where

import Page01.Problem06
import Test.Tasty.HUnit

unit_sumSquareDifference = sumSquareDifference 10 @?= 2640

unit_problem_6 = solution @?= 25164150