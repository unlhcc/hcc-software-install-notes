module load compiler/gcc/6.1 libctl/3.2 openmpi/2.0 fftw3/3.3 intel-mkl/16

make clean && make distclean

PREFIX=/util/opt/mpb/1.5/openmpi/2.0/gcc/6.1
./configure --prefix=$PREFIX --with-inv-symmetry --with-libctl=/util/opt/libctl/3.2/gcc/6.1/share/libctl/ --with-blas=/util/comp/intel/16/mkl/lib/intel64/ --with-lapack=/util/comp/intel/16/mkl/lib/intel64/ --with-mpi

make -j 4
make install
