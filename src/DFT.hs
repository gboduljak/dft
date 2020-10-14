module DFT (dft, idft) where
import FFT (fft)
import Data.Complex (Complex)
import Data.List (reverse, map, take)

dft :: [Complex Float] -> [Complex Float]
dft [] = []
dft xs = fft $ preprocess xs

idft :: [Complex Float] -> [Complex Float]
idft [] = []
idft xs = (invertFFT . dft) xs

invertFFT :: [Complex Float] -> [Complex Float]
invertFFT [] = []
invertFFT coeffs@(x:xs) = [ x' / n | x' <- (x : reverse xs) ] 
  where n = (fromIntegral . length) coeffs

preprocess :: [Complex Float] -> [Complex Float]
preprocess [] = []
preprocess xs = take targetLength (xs ++ (repeat 0))
  where targetLength = 2 ^ ceiling (log ((fromIntegral . length) xs) / log 2)