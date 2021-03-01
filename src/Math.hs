module Math
  (
    sumRange
  ) where

-- | The nth partial sum of 1 + 2 + 3 + ...
sumNaturals :: Integral a => a -> a
sumNaturals n = n * (n + 1) `div` 2

-- | Sum a range of values [0 .. n] in constant time.
-- Equivalent to `sum [start, (start + step) .. stop]`
-- (except for when `step == 0`).
sumRange :: Integral a => a -> a -> a -> a
sumRange _ _ 0 = error "Step size must not be 0"
sumRange start stop step
  | is_empty_range start stop = 0
  | step == 1 =
    -- This is equal to 1 + 2 + 3 + ... plus some offset.
    -- Rewrite as 0 + start + 1 + start + 2 + start + ...
    (stop - start + 1) * start + sumNaturals (stop - start)
  | otherwise =
    -- Scale down the series by `step` and compute as the sum of consecutive integers.
    step * sumRange (start `div` step) (stop `div` step) 1
  where
    is_empty_range start stop =
      step > 0 && stop < start ||
      step < 0 && stop > start