module Tests.Core where

import Core
import Data.Void
import Test.Tasty
import Test.Tasty.HUnit

test_consecutives = testGroup "consecutives"
  [
    testCase "0"          $ consecutives 0 [1 .. 4] @?= [],
    testCase "1"          $ consecutives 1 [1 .. 4] @?= [[1], [2], [3], [4]],
    testCase "2"          $ consecutives 2 [1 .. 4] @?= [[1, 2], [2, 3], [3, 4]],
    testCase "Empty list" $ consecutives 3 []       @?= ([] :: [[Void]])
  ]

test_indices = testGroup "indices"
  [
    testCase "Empty list"    $ indices []        @?= [],
    testCase "Nonempty list" $ indices [4, 5, 6] @?= [0, 1, 2]
  ]

test_slice = testGroup "slice"
  [
    testCase "Empty list"          $ slice 0 100 []         @?= ([] :: [Void]),
    testCase "Start out of bounds" $ slice (-1) 1 [0, 1, 2] @?= [0, 1],
    testCase "End out of bounds"   $ slice 1 10 [0, 1, 2]   @?= [1, 2],
    testCase "Slice beginning"     $ slice 0 2 [1 .. 5]     @?= [1, 2, 3],
    testCase "Slice middle"        $ slice 2 3 [1 .. 5]     @?= [3, 4],
    testCase "Slice end"           $ slice 3 4 [1 .. 5]     @?= [4, 5],
    testCase "Singleton slice"     $ slice 2 2 [1 .. 5]     @?= [3],
    testCase "Empty slice"         $ slice 4 3 [1 .. 5]     @?= []
  ]
