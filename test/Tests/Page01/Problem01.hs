module Tests.Page01.Problem01 where

import Page01.Problem01
import Test.HUnit

testSolution = TestCase (assertEqual "Checking the solution:", 233168, solution)