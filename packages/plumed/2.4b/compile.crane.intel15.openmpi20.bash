module load  compiler/intel/15 intel-mkl/15 openmpi/2.0
make clean
make distclean
./configure --prefix=/util/opt/plumed/2.4/intel/15/openmpi/2.0 --enable-mpi CXX=mpicxx CC=mpicc FC=mpif90
make 
make install
