module Reverse where

rvrs xs = trd ++ " " ++ snd ++ " " ++ fst
  where fst = take 5 xs
        snd = take 2 $ drop 6 xs
        trd = drop 9 xs

main :: IO ()
main =
  print (rvrs "Curry is awesome")
