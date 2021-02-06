module Main where

import Test.Tasty
import qualified Tests.Math
import qualified Tests.Math.Combinatorics
import qualified Tests.Math.NumberTheory
import qualified Tests.Page01.Problem01
import qualified Tests.Page01.Problem02

tests = testGroup "tests"
  [
    Tests.Math.tests,
    Tests.Math.Combinatorics.tests,
    Tests.Math.NumberTheory.tests,
    Tests.Page01.Problem01.tests,
    Tests.Page01.Problem02.tests
  ]

main = defaultMain tests