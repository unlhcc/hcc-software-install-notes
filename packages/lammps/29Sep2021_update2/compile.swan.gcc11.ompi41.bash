#!/bin/bash

module purge
module load compiler/gcc/11 openmpi/4.1 fftw3/3.3 python/3.8 cmake/3.20 ffmpeg plumed/2.8
export CMAKE_PREFIX_PATH=$FFTW3:$PLUMED

rm -rf build && mkdir build && pushd build
PREFIX=/util/opt/lammps/29Sep2021_update2/openmpi/4.1/gcc/11

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_SHARED_LIBS=ON \
      -DLAMMPS_INSTALL_RPATH=ON \
      -DPKG_ASPHERE=yes \
      -DPKG_BOCS=yes \
      -DPKG_BODY=yes \
      -DPKG_BROWNIAN=yes \
      -DPKG_CG-DNA=yes \
      -DPKG_CG-SDK=yes \
      -DPKG_CLASS2=yes \
      -DPKG_COLLOID=yes \
      -DPKG_COLVARS=yes \
      -DPKG_COMPRESS=yes \
      -DPKG_CORESHELL=yes \
      -DPKG_DIELECTRIC=yes \
      -DPKG_DIFFRACTION=yes \
      -DPKG_DIPOLE=yes \
      -DPKG_DPD-BASIC=yes \
      -DPKG_DPD-MESO=yes \
      -DPKG_DPD-REACT=yes \
      -DPKG_DPD-SMOOTH=yes \
      -DPKG_DRUDE=yes \
      -DPKG_EFF=yes \
      -DPKG_EXTRA-PAIR=yes \
      -DPKG_FEP=yes \
      -DPKG_GRANULAR=yes \
      -DPKG_INTERLAYER=yes \
      -DPKG_KOKKOS=yes \
      -DPKG_KSPACE=yes \
      -DPKG_LATBOLTZ=yes \
      -DPKG_MANIFOLD=yes \
      -DPKG_MANYBODY=yes \
      -DPKG_MC=yes \
      -DPKG_MEAM=yes \
      -DPKG_MISC=yes \
      -DPKG_MOLECULE=yes \
      -DPKG_OPENMP=yes \
      -DPKG_OPT=yes \
      -DPKG_ORIENT=yes \
      -DPKG_PERI=yes \
      -DPKG_PTM=yes \
      -DPKG_QEQ=yes \
      -DPKG_QTB=yes \
      -DPKG_PHONON=yes \
      -DPKG_REACTION=yes \
      -DPKG_REAXFF=yes \
      -DPKG_RIGID=yes \
      -DPKG_SHOCK=yes \
      -DPKG_SMTBQ=yes \
      -DPKG_SPH=yes \
      -DPKG_SPIN=yes \
      -DPKG_SRD=yes \
      -DPKG_TALLY=yes \
      -DPKG_UEF=yes \
      -DPKG_YAFF=yes \
      -DPKG_EXTRA-DUMP=yes \
      -DPKG_PLUMED=yes \
      -DPLUMED_MODE=shared \
      ../cmake

make -j 4
make install
