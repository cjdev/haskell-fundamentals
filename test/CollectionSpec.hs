{-# LANGUAGE OverloadedStrings #-}
module CollectionSpec where

import Test.Hspec

import qualified Data.Map as Map
import qualified Data.Text as Text

spec :: Spec
spec = do
  it "list operations" $ do
    let a = [1, 2, 3]
        b = [4, 5, 6]

    -- concatenate lists
    a ++ b `shouldBe` [1, 2, 3, 4, 5, 6]

    -- add to beginning
    100 : a `shouldBe` [100, 1, 2, 3]

    -- add to end
    a ++ [100] `shouldBe` [1, 2, 3, 100]

  it "a string is a list of chars" $ do
    let a = "abc"
        b = "def"

    -- concatenate lists
    a ++ b `shouldBe` "abcdef"

    -- add to beginning
    'z' : a `shouldBe` "zabc"

    -- add to end
    a ++ ['z'] `shouldBe` "abcz"

  it "you can use the text library as an alternative to char lists" $ do
    let a = "abc" :: Text.Text
        b = "def" :: Text.Text

    -- concatenate text
    Text.append a b `shouldBe` "abcdef"
    (a `Text.append` b) `shouldBe` "abcdef"

    -- add to beginning
    Text.cons 'z' a `shouldBe` "zabc"
    ('z' `Text.cons` a) `shouldBe` "zabc"

    -- add to end
    Text.snoc a 'z' `shouldBe` "abcz"
    (a `Text.snoc` 'z') `shouldBe` "abcz"

  it "map operations" $ do
    let sampleMap = Map.fromList [(1, "a"), (2, "b"), (3, "c")]
    Map.size sampleMap `shouldBe` 3
    Map.member 2 sampleMap `shouldBe` True
    Map.member 4 sampleMap `shouldBe` False
    Map.lookup 2 sampleMap `shouldBe` (Just "b")
    Map.lookup 4 sampleMap `shouldBe` Nothing
    Map.findWithDefault "not there" 2 sampleMap `shouldBe` "b"
    Map.findWithDefault "not there" 4 sampleMap `shouldBe` "not there"
    Map.insert 4 "d" sampleMap `shouldBe`
      Map.fromList [(1, "a"), (2, "b"), (3, "c"), (4, "d")]
