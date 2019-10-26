tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

tensDigitDivMod :: Integral a => a -> a
tensDigitDivMod x = fst (x `divMod` 10)

hunsD x = fst (x `divMod` 100)
