module Tests.Page01.Problem18 where

import Page01.Problem18
import Test.Tasty
import Test.Tasty.HUnit
import Tests.Helpers

-- Writing a multiline string like this strips out the newlines,
-- which we need for parsing.
-- testInput = "\
-- \3\
-- \7 4\
-- \2 4 6\
-- \8 5 9 3"

testInput = "\n3\n7 4\n2 4 6\n8 5 9 3"

test_longestPath = caseGroup "longestPath"
  [
    longestPath [[1]] @?= 1,
    longestPath testInput @?= 23
  ]

test_problem_18 :: IO TestTree
test_problem_18 = do
  actual <- solution
  return $ testCase "problem 18" $ actual @?= 1074