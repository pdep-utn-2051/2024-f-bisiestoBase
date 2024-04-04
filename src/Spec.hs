module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de la función esBisiesto" $ do
    it "Un año múltiplo de 400 es bisiesto" $ do
      esBisiesto 2000 `shouldBe` True
    it "Un año múltiplo de 4 pero no de 100 es bisiesto" $ do
      esBisiesto 2024 `shouldBe` True
    it "Un año múltiplo de 100 no es bisiesto" $ do
      esBisiesto 1900 `shouldBe` False
    it "Un año que no es múltiplo de 4 no es bisiesto" $ do
      esBisiesto 2023 `shouldBe` False
