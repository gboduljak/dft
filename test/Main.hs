import Test.Hspec
import DFTSpec (dftSpec)
import PolynomialMultiplicationSpec (polynomialMultiplicationSpec, polynomialMultiplicationCommutativitySpec)

main :: IO ()
main = do
  hspec dftSpec
  hspec polynomialMultiplicationSpec
  hspec polynomialMultiplicationCommutativitySpec