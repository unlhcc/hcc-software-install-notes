module load  compiler/intel/15 intel-mkl/15 openmpi/1.10

make clean && make distclean

./configure --prefix=/util/opt/plumed/2.4/intel/15/openmpi/1.10 --enable-mpi --enable-modules CXX=mpicxx CC=mpicc FC=mpif90

make -j 8 install

#if the compilation errors out with: 
# "cp: cannot create regular file `/util/opt/plumed/2.4/intel/15/openmpi/1.10/lib/plumed/vim/': Is a directory"
#try:
#mkdir -p /util/opt/plumed/2.4/intel/15/openmpi/1.10/lib/plumed/vim/
