module Tests.Page01.Problem12 where

import Page01.Problem12
import Test.Tasty.HUnit

unit_triangleNumbers = take 11 triangleNumbers @?= [0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55]

unit_firstTriangleNumberWithMoreDivisorsThan = firstTriangleNumberWithMoreDivisorsThan 5 @?= 28

unit_problem_12 = solution @?= 76576500