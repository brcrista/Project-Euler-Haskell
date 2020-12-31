module Math.Combinatorics
  (
    fibonacci,
    recurrenceBinary
  )
where

recurrenceBinaryRecursive :: (a -> a -> a) -> [a] -> [a]
recurrenceBinaryRecursive f []  = error "empty list"
recurrenceBinaryRecursive f [x] = error "singleton list"
recurrenceBinaryRecursive f xs  = [next] ++ recurrenceBinaryRecursive f [last xs, next]
  where next = f (last xs) (last $ init xs)

-- recurrenceBinary (+) 1 1
-- = [1, 1] recurrenceBinaryRecursive (+) [1, 1]
-- = [1, 1] ++ [2] ++ recurrenceBinaryRecursive (+) [1, 2]
-- = [1, 1] ++ [2] ++ [3] ++ recurrenceBinaryRecursive (+) [2, 3]

-- | Define a recurrence relation using a binary function and two initial values.
-- The recurrence will follow the pattern `a[n] = f a[n - 1] a[n - 2]`.
recurrenceBinary :: (a -> a -> a) -> a -> a -> [a]
recurrenceBinary f x y = [x, y] ++ recurrenceBinaryRecursive f [x, y]

-- | The infinite sequence of Fibonacci numbers.
fibonacci = recurrenceBinary (+) 1 1