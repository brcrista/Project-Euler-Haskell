module Math.Combinatorics
  (
    fibonacci,
    binaryRecurrence
  )
where

binaryRecurrenceRecursive :: (a -> a -> a) -> [a] -> [a]
binaryRecurrenceRecursive f []  = error "empty list"
binaryRecurrenceRecursive f [x] = error "singleton list"
binaryRecurrenceRecursive f xs  = [next] ++ binaryRecurrenceRecursive f [last xs, next]
  where next = f (last xs) (last $ init xs)

-- binaryRecurrence (+) 1 1
-- = [1, 1] binaryRecurrenceRecursive (+) [1, 1]
-- = [1, 1] ++ [2] ++ binaryRecurrenceRecursive (+) [1, 2]
-- = [1, 1] ++ [2] ++ [3] ++ binaryRecurrenceRecursive (+) [2, 3]

-- | Define a recurrence relation using a binary function and two initial values.
-- The recurrence will follow the pattern `a[n] = f a[n - 1] a[n - 2]`.
binaryRecurrence :: (a -> a -> a) -> a -> a -> [a]
binaryRecurrence f x y = [x, y] ++ binaryRecurrenceRecursive f [x, y]

-- | The infinite sequence of Fibonacci numbers.
fibonacci = binaryRecurrence (+) 1 1