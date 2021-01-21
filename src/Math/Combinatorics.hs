module Math.Combinatorics
  (
    binaryRecurrence,
    fibonacci
  )
where

-- | Define a recurrence relation using a binary function and two initial values.
-- The recurrence will follow the pattern `a[n] = f a[n - 1] a[n - 2]`.
binaryRecurrence :: (a -> a -> a) -> a -> a -> [a]
binaryRecurrence f x y = x : y : zipWith f (tail self) self
  where self = binaryRecurrence f x y

-- | The infinite sequence of Fibonacci numbers.
-- >>> take 7 fibonacci
-- [0,1,1,2,3,5,8]
fibonacci :: Num a => [a]
fibonacci = binaryRecurrence (+) 0 1