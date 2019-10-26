foldBool1 :: a -> a -> Bool -> a
foldBool1 a b c = case c of
  False -> a
  True -> b

foldBool2 :: a -> a -> Bool -> a
foldBool2 a b c
        | c == False = a
        | c == True  = b
