module Polynomial (multiply, multiplyWithIntCoeffs, Poly(Poly), Coefficients) where

import Data.Complex
import DFT (dft, idft)
import Data.List (take, zip, repeat)

type Coefficients = [Complex Float]
data Poly = Poly Coefficients deriving (Eq)

instance Show Poly where
  show (Poly p) = show' p 0
    where show' [] degree = ""
          show' (x:xs) 0 = "(" ++ show (round (realPart x)) ++ " + " ++ ("(" ++ show (round (imagPart x)) ++ ")") ++ "i" ++ ")" ++ " + " ++ show' xs 1
          show' [x] degree = "(" ++ show (round (realPart x)) ++ " + " ++ ("(" ++ show (round (imagPart x)) ++ ")") ++ "i" ++ ")" ++ "x^" ++ show degree
          show' (x:xs) degree = "(" ++ show (round (realPart x)) ++ " + " ++ ("(" ++ show (round (imagPart x)) ++ ")") ++ "i" ++ ")" ++ "x^" ++ show degree ++ " + " ++ show' xs (degree + 1)

multiplyWithIntCoeffs :: Poly -> Poly -> [Int]
multiplyWithIntCoeffs p q = map round $ map (realPart) $ coeffs
  where (Poly coeffs) = multiply p q

multiply :: Poly -> Poly -> Poly
multiply (Poly p) (Poly q) = Poly (trimPoly $ idft (dft p' |*| dft q'))
  where (p', q') = pad p q
        trimPoly = take (length p + length q - 1) 

pad :: Coefficients -> Coefficients -> (Coefficients, Coefficients)
pad p q = (p', q')
  where maxDegree = closestPowerOfTwo (length p + length q + 2)
        p' = p ++ (take (maxDegree - (length p)) (repeat 0))
        q' = q ++ (take (maxDegree - (length q)) (repeat 0))

(|*|) :: Coefficients -> Coefficients -> Coefficients
(|*|) = hadamard

hadamard :: Coefficients -> Coefficients -> Coefficients
hadamard p q = [ a * b | (a, b) <- zip p q ]

closestPowerOfTwo :: Int -> Int
closestPowerOfTwo x = 2 ^ ceiling (log (fromIntegral x) / log 2)