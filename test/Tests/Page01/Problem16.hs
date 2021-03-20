module Tests.Page01.Problem16 where

import Page01.Problem16
import Test.Tasty.HUnit

unit_digitSum = digitSum 32768 @?= 26

unit_problem_16 = solution @?= 1366