module Tests.Page01.Problem08 where

import Page01.Problem08
import Test.Tasty.HUnit

unit_largestProductInSeries = largestProductInSeries 13 (replicate 13 '1') @?= 1

-- unit_problem_7 = solution @?= 104743