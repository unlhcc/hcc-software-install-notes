module load compiler/gcc/4.9 hdf5/1.8 zlib/1.2

make clean && make distclean

./configure --prefix=/util/opt/matio/1.5.6/gcc/4.9.2/ --with-hdf5=/util/opt/hdf5/1.8/gcc/4.9/ --with-zlib=/util/opt/zlib/1.2/gcc/4.9/ 
