module FFT (fft) where
import Data.Complex (Complex, cis, conjugate)
import Data.List (head, zip, take)

fft :: [Complex Float] -> [Complex Float]
fft xs = fft' (length xs) xs

fft' :: Int -> [Complex Float] -> [Complex Float]
fft' 1 [x] = [x]
fft' n coeffs = eval [0..n-1] halfN nThPrimitiveRoots halfFFT
  where 
        halfN                   = n `div` 2
        (evenCoeffs, oddCoeffs) = split coeffs
        evenFFT                 = fft' halfN evenCoeffs
        oddFFT                  = fft' halfN oddCoeffs
        nThPrimitiveRoots       = duplicate $ take halfN (rootsOfUnity n)
        halfFFT                 = duplicate $ zip evenFFT oddFFT

rootsOfUnity :: Int -> [Complex Float]
rootsOfUnity = rootsOfUnity' . fromIntegral

rootsOfUnity' :: Float -> [Complex Float]
rootsOfUnity' n = map conjugate $ [ cis (2 * pi * k / n) | k <- [0 .. n - 1] ]

split :: [Complex Float] -> ([Complex Float], [Complex Float])
split coeffs = (evenCoeffs, oddCoeffs)
  where indexedCoeffs = zip coeffs [0..]
        evenCoeffs    = [ coeff | (coeff, index) <- indexedCoeffs, even index ]
        oddCoeffs     = [ coeff | (coeff, index) <- indexedCoeffs, odd index ]
        
eval :: [Int] -> Int -> [Complex Float] -> [(Complex Float, Complex Float)] -> [Complex Float]
eval [] _ _ _ = []
eval (power:restPowers) halfPower (root:restRoots) (coeffs:restCoeffs) 
  | power < halfPower = (evenCoeff + root * oddCoeff) : (eval restPowers halfPower restRoots restCoeffs)
  | otherwise         = (evenCoeff - root * oddCoeff) : (eval restPowers halfPower restRoots restCoeffs)
  where (evenCoeff, oddCoeff) = coeffs

duplicate :: [a] -> [a]
duplicate xs = xs ++ xs