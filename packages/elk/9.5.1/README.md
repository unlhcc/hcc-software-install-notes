ELK 9.5.1
We have made changes into make.inc for elk-9.5.1 to be compatable with guest partition. We have changed line 71 in the make.inc from

#F90_OPTS = -O3 -xHost -ipo -qopenmp -mkl=parallel

To

#F90_OPTS = -O3 -axCORE-AVX512,CORE-AVX2 -ipo -qopenmp -mkl=parallel

A copy of the modified make.inc is attached.
