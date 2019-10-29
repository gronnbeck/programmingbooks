module Addition where

import Test.Hspec
import Test.QuickCheck

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
        it "x + 1 is always greather than x" $ do
            property $ prop_additionGreater

runQc :: IO ()
runQc = quickCheck prop_additionGreater

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

prop_additionGreater :: Int -> Bool
prop_additionGreater x = x + 1 > x

genBool :: Gen Bool
genBool = choose (False, True)

genBool' :: Gen Bool
genBool' = elements [False, True]

genOrdering :: Gen Ordering
genOrdering = elements [LT, EQ, GT]

genChar :: Gen Char
genChar = elements ['a'..'z']

genTuple :: (Arbitrary a, Arbitrary b)
         => Gen (a, b)
genTuple = do
    a <- arbitrary
    b <- arbitrary
    return (a, b)

