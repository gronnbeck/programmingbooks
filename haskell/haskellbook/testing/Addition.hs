module Addition where

import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "Addition" $ do
        it "1 + 1 is greater than 1" $ do
            (1 + 1) > 1 `shouldBe` True
        it "2 + 2 is equal to 4" $ do
            2 + 2 `shouldBe` 4
        it "15 divided by 3 is 5" $ do
            dividedBy 15 3 `shouldBe` (5, 0)
        it "22 divided by 5 is 4 remainder 2" $ do
            dividedBy 22 5 `shouldBe` (4, 2)
        it "2 mulitplied by 2 is 4" $ do
            multiply 2 2 `shouldBe` 4
        it "5 multipled by 3 is 15" $ do
            multiply 5 3 `shouldBe` 15

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where go n d count
            | n < d     = (count, n)
            | otherwise =
                go (n - d) d (count + 1)

multiply :: (Eq a, Num a) => a -> a -> a
multiply a b = go a b 0
  where go n rest res
            | rest == 0 = res
            | otherwise =
                go n (rest - 1) (res + n)
