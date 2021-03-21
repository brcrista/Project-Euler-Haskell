module Core
  (
    (<&>),
    (??),
    argmax,
    argmin,
    consecutives,
    indices,
    range,
    slice
  )
where

import Data.Function (on)
import Data.List (maximumBy, minimumBy)

-- | The element in `args` that produces the largest output of `f`.
-- | If two values of `f` are maximal, returns the last set of arguments in `args`
-- | that produces the maximal value of `f`.
argmax :: (Foldable t, Functor t, Ord b) => (a -> b) -> t a -> a
argmax f xs = fst $ maximumBy (compare `on` snd) (fmap ((,) <*> f) xs)

-- | The element in `args` that produces the smallest output of `f`.
-- | If two values of `f` are minimal, returns the last set of arguments in `args`
-- | that produces the minimal value of `f`.
argmin :: (Foldable t, Functor t, Ord b) => (a -> b) -> t a -> a
argmin f xs = fst $ minimumBy (compare `on` snd) (fmap ((,) <*> f) xs)

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

-- This is also defined in the `lens` package.
infixl 4 <&> -- same fixity as <$>
(<&>) :: Functor f => f a -> (a -> b) -> f b
(<&>) = flip (<$>)

-- Cf. C#'s null-coalescing operator `??`.
infixr 2 ?? -- same fixity as ||
(??) :: Maybe a -> Maybe a -> Maybe a
(Just x) ?? _ = Just x
_        ?? y = y