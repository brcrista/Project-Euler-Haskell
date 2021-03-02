module Tests.Page01.Problem09 where

import Page01.Problem09
import Test.Tasty.HUnit

unit_isPythagorean = isPythagorean 3 4 5 @?= True

unit_problem_9 = solution @?= 31875000