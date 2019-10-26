myWords :: String -> [String]
myWords "" = []
myWords xs = takeWhile (/= ' ') ys
  : myWords (dropWhile (/= ' ') ys)
  where ys = dropWhile (== ' ') xs
