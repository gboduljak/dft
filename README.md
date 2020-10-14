# 📉 Discrete Fourier Transform (DFT)

#### Implementation
A quick and dirty implementation of [Discrete Fourier transform (DFT)](https://en.wikipedia.org/wiki/Discrete_Fourier_transform) in Haskell.
The algorithm is implemented using the simplified version of **[Cooley–Tukey FFT algorithm](https://en.wikipedia.org/wiki/Cooley%E2%80%93Tukey_FFT_algorithm)**.
The implementation is [here](https://github.com/gboduljak/dft/blob/master/src/FFT.hs). 

#### Testing
DFT, Inverse DFT and underlying FFT algorithm are tested by simply checking whether the composition of inverse dft and dft produces the same result as the provided input. The test implementation is [here](https://github.com/gboduljak/dft/blob/master/test/Main.hs). Polynomial Multiplication Algorithm was also used to test underlying DFT algorithm [here](https://github.com/gboduljak/dft/blob/master/test/PolynomialMultiplicationSpec.hs).

#### Application to O(n log n) Polynomial Multiplication
DFT algorithm can be conveniently applied to polynomial multiplication. The result is O(n log n) polynomial multiplication algorithm.
The implementation is [here](https://github.com/gboduljak/dft/blob/master/src/Polynomial.hs). This application was also used to test the FFT implementation,
and test cases are [here](https://github.com/gboduljak/dft/blob/master/test/PolynomialMultiplicationSpec.hs).

#### Build & Dependencies
In order to build **dft** from the source, you will need a [Haskell stack](https://docs.haskellstack.org/en/stable/README/).

**Build:**
  1. Clone the project
  2. Run **stack build** in the root of the repository
      - This should automatically pull dependencies, compile and build
      
**Run in interactive mode:**
Run **stack ghci** in the app folder of the repository
  
**Test:**
Run **stack test** in the root of the repository
