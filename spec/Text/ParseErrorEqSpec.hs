module Text.ParseErrorEqSpec (spec) where

import Test.Hspec (it, describe, shouldBe, Spec)

import Text.Parsec.Error (newErrorUnknown)
import Text.Parsec.Pos (initialPos)

import Text.ParseErrorEq ()

spec :: Spec
spec = describe "ParseError" $ do
  it "has an Eq instance" $ do
    (newErrorUnknown (initialPos "file")) `shouldBe`
      (newErrorUnknown (initialPos "file"))
