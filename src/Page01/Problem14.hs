{-|
The following iterative sequence is defined for the set of positive integers:

n → n / 2     (n is even)
n → 3 × n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
Although it has not been proved yet (the Collatz conjecture), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
-}

module Page01.Problem14
  (
    collatz,
    solution
  )
where

import Core (argmax)
import Numeric.Natural (Natural)

-- | The function defining the recurrence for the Collatz sequence.
halfOrTriplePlusOne :: Natural -> Natural
halfOrTriplePlusOne n
  | even n = n `div` 2
  | otherwise = 3 * n + 1

-- | The Collatz sequence beginning with `n`.
collatz :: Natural -> [Natural]
collatz 0 = undefined
collatz 1 = [1]
collatz n = n : collatz (halfOrTriplePlusOne n)

-- | The seed value between `1` and `n` that produces longest Collatz sequence.
longestCollatzSequence :: Natural -> Natural
longestCollatzSequence n = argmax (length . collatz) [1 .. n]

solution :: Natural
solution = longestCollatzSequence 1000000