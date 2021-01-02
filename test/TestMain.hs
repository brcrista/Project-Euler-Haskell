module Main where

import Test.HUnit
import qualified Tests.Page01.Problem01
import qualified Tests.Page01.Problem02

tests = TestList [Tests.Page01.Problem01.testSolution, Tests.Page01.Problem02.testSolution]

main = runTestTT tests