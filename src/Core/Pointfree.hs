module Core.Pointfree
  (
    range
  )
where

range :: Enum a => a -> a -> [a]
range a b = [a .. b]