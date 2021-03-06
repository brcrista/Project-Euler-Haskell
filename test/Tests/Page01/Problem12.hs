module Tests.Page01.Problem12 where

import Page01.Problem12
import Test.Tasty.HUnit

unit_firstTriangleNumberWithMoreDivisorsThan = firstTriangleNumberWithMoreDivisorsThan 5 @?= 28

unit_problem_12 = solution @?= 76576500