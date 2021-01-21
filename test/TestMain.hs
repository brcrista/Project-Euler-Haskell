module Main where

import Test.HUnit
import qualified Tests.Math
import qualified Tests.Math.Combinatorics
import qualified Tests.Page01.Problem01
import qualified Tests.Page01.Problem02

tests = TestList
  [
    Tests.Math.tests,
    Tests.Math.Combinatorics.tests,
    Tests.Page01.Problem01.tests,
    Tests.Page01.Problem02.tests
  ]

main = runTestTT tests