module Core
  (
    indices,
    range,
    slice
  )
where

-- | The list of indices into a list.
indices :: [a] -> [Int]
indices = zipWith const [0 ..]

-- | A function that performs the language-primitive range operation.
-- | This is useful for pointfree definitions.
range :: Enum a => a -> a -> [a]
range a b = [a .. b]

-- | The sublist of a list from positions `i` to `j`, inclusive.
slice :: Int -> Int -> [a] -> [a]
slice i j = take (j - i + 1) . drop i