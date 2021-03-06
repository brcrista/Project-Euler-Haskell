module Core
  (
    consecutives,
    indices,
    range,
    slice
  )
where

-- | The list of all sublists of size `n` in a list.
-- | Cf. `Data.List.subsequences` and `isSubsequenceOf`, which ignore whether elements are consecutive.
consecutives :: Int -> [a] -> [[a]]
consecutives n xs
  | n <= 0 = []
  | otherwise = (\ i -> slice i (i + n - 1)) <$> indices (drop (n - 1) xs) <*> [xs]

-- | The list of indices into a list.
indices :: [a] -> [Int]
indices = zipWith const [0 ..]

-- | A function that performs the language-primitive range operation.
-- | This is useful for pointfree definitions.
range :: Enum a => a -> a -> [a]
range a b = [a .. b]

-- | The sublist of a list from positions `i` to `j`, inclusive.
slice :: Int -> Int -> [a] -> [a]
slice i j
  | i < 0     = slice 0 j
  | otherwise = take (j - i + 1) . drop i