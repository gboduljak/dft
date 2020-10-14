module PolynomialMultiplicationSpec (
  polynomialMultiplicationSpec,
  polynomialMultiplicationCommutativitySpec
) 
where

import Test.Hspec
import Test.QuickCheck
import Polynomial(Poly(Poly), Coefficients, multiplyWithIntCoeffs, multiply)

polynomialMultiplicationSpec :: Spec
polynomialMultiplicationSpec =  do
  describe "polynomial multiplication tests..." $ do
    it "correctly multiplies #1" $ do
      (multiplyWithIntCoeffs (Poly [1,1]) (Poly [1,1])) `shouldBe` ([1,2,1])
    it "correctly multiplies #2" $ do
      (multiplyWithIntCoeffs (Poly [1,5,1]) (Poly [15,-10,3])) `shouldBe` ([15,65,-32,5,3])
    it "correctly multiplies #3" $ do
      (multiplyWithIntCoeffs (Poly [5,0,1]) (Poly [9,-19,1])) `shouldBe` ([45,-95,14,-19,1])

polynomialMultiplicationCommutativitySpec :: Spec
polynomialMultiplicationCommutativitySpec =  do
  describe "polynomial multiplication commutativity tests..." $ do
    it "testing whether polynomial multiplication is commutative?" $ do
      property $ prop_is_multiplication_commutative

prop_is_multiplication_commutative :: Coefficients -> Coefficients -> Bool
prop_is_multiplication_commutative p q = multiply (Poly p) (Poly q) == multiply (Poly q) (Poly p)