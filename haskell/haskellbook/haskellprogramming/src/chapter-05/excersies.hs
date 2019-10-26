co :: (b -> c) -> (a -> b) -> a -> c
-- co = undefined
co f g x = f (g x)


a :: (a -> c) -> a -> a
-- a = undefined
a _ x = x

a' :: (a -> b) -> a -> b
-- a' = undefined
a' f = f
