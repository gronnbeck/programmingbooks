data TisAndInteger =
    TisAn Integer

instance Eq TisAndInteger where
  (==) (TisAn a) (TisAn b) =
    a == b


data TwoIntegers =
  Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two a1 a2) (Two b1 b2) =
    a1 == b1
      && a2 == b2


data StringOrInt = TisAnInt Int
                 | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt a) (TisAnInt b)     = a == b
  (==) (TisAString a) (TisAString b) = a == b
  (==) (TisAnInt _) (TisAString _)   = False
  (==) (TisAString _) (TisAnInt _)   = False
