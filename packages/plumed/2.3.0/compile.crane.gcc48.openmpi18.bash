
module load  compiler/gcc/4.8 intel-mkl/12 openmpi/1.8

make clean && make distclean

./configure --prefix=/util/opt/plumed/2.3.0/gcc/4.8/openmpi/1.8

make -j 8 install
