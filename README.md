# 📉 Discrete Fourier Transform (DFT)

#### Implementation
A quick and dirty implementation of [Discrete Fourier transform (DFT)](https://en.wikipedia.org/wiki/Discrete_Fourier_transform) in Haskell.
The algorithm is implemented using the simplified version of **[Cooley–Tukey FFT algorithm](https://en.wikipedia.org/wiki/Cooley%E2%80%93Tukey_FFT_algorithm)**.
The implementation is [here](https://github.com/gboduljak/dft/blob/master/src/FFT.hs). 

#### Testing
Algorithms are tested by simply checking whether the composition of inverse dft and dft produce the same results as the provided input.
The test implementation is [here](https://github.com/gboduljak/dft/blob/master/test/Spec.hs).

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
