-- 1.

functionH :: [a] -> a
functionH (x:_) = x

-- 2.

functionC :: (Ord a) => a -> a -> Bool
functionC x y =
  if (x > y) then True else False

-- 3.

functionS :: (x, y) -> y
functionS (x, y) = y
