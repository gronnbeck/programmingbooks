-- a) -- Given
-- "Curry is awesome" -- Return
-- "Curry is awesome!"

exclaim xs = xs ++ "!"

-- b) -- Given
-- "Curry is awesome!" -- Return
-- "y"

fourth xs = xs !! 4

-- c) -- Given
-- "Curry is awesome!" -- Return "awesome!"

extract = drop 9


thirdLetter :: String -> Char
thirdLetter xs = xs !! 2


sameString = "Curry is awesome"
letterIndex :: Int -> Char
letterIndex x = sameString !! x


rvrs = trd ++ " " ++ snd ++ " " ++ fst
  where fst = take 5 sameString
        snd = take 2 (drop 6 sameString)
        trd = drop 9 sameString
