
module load compiler/intel/15 intel-mkl/15 openmpi/1.10

make clean && make distclean

./configure --prefix=/util/opt/plumed/2.3.0/intel/15/openmpi/1.10 --enable-mpi --enable-modules CXX=mpicxx CC=mpicc FC=mpif90

make -j 8 install

