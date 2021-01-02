module Main where

import qualified Tests.Page01.Problem01
import qualified Tests.Page01.Problem02

tests = TestGroup "Solution tests" [Tests.Page01.Problem01.testSolution, Tests.Page01.Problem02.testSolution]