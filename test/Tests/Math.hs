module Tests.Math where

import Math
import Test.HUnit

tests = TestCase (assertEqual "Sum of empty range," 0 (sumRange 0 0 1))
