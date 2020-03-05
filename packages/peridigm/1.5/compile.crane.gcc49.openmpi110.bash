module load compiler/gcc/4.9 openmpi/1.10 boost/1.55 phdf5/1.8 pnetcdf/4.4 matio/1.5 trilinos/12.6

rm -rf build && mkdir -p build && pushd build

cmake \
-D CMAKE_INSTALL_PREFIX:PATH=/util/opt/peridigm/1.5/openmpi/1.10.2/gcc/4.9.2 \
-D CMAKE_BUILD_TYPE:STRING=Debug \
-D Trilinos_DIR:PATH=/util/opt/trilinos/12.6/openmpi/1.10/gcc/4.9/ \
-D NO_DEFAULT_PATH:BOOL=ON \
-D CMAKE_C_COMPILER:STRING=/util/opt/openmpi/1.10/gcc/4.9/bin/mpicc \
-D CMAKE_CXX_COMPILER:STRING=/util/opt/openmpi/1.10/gcc/4.9/bin/mpicxx \
-D CMAKE_EXE_LINKER_FLAGS="-L/util/opt/boost/1.59/gcc/4.9/lib -L/util/opt/hdf5/1.8/openmpi/1.10/gcc/4.9/lib" \
-D BOOST_ROOT=/util/opt/boost/1.55/openmpi/1.10/gcc/4.9/ \
-D CMAKE_CXX_FLAGS:STRING="-O2 -Wall -std=c++11 -pedantic -Wno-long-long -ftrapv -Wno-deprecated" \
-D USE_DAKOTA:BOOL=ON \
..

make
make install
