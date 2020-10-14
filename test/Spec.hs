import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import DFT (dft, idft)
import Data.Complex
import Data.List (zip, repeat)

main :: IO ()
main = hspec $ do
  describe "Are DFT and IDFT correct ?" $ do
    it "checks whether composition of inverse dft and dft returns the original sequence" $
      property $ prop_dft_correct

prop_dft_correct :: [Float] -> Bool
prop_dft_correct xs = are_numbers_nearly_equal ((idft . dft . map (\x -> x :+ 0) ) ys) ys
  where ys = preprocess xs

preprocess :: [Float] -> [Float]
preprocess [] = []
preprocess xs = take targetLength (xs ++ (repeat 0))
  where targetLength = 2 ^ ceiling (log ((fromIntegral . length) xs) / log 2)

are_numbers_nearly_equal :: [Complex Float] -> [Float] -> Bool
are_numbers_nearly_equal [] [] = True
are_numbers_nearly_equal (x:xs) (y:ys) 
  | realPartsEq = are_numbers_nearly_equal xs ys
  | otherwise = False
  where realPartsEq = nearly_equal (realPart x) y

nearly_equal :: Float -> Float -> Bool
nearly_equal x y = abs (x - y) <= 1e-4