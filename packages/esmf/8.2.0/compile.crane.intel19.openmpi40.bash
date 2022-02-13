#!/bin/sh

module load compiler/intel/19 openmpi/4.0 netcdf/4.7

export ESMF_DIR=/util/src/esmf/8.2.0/esmf-ESMF_8_2_0
export DEFAULTINSTALLDIR=/util/opt/esmf/8.2.0/intel/19.0.1/
export PREFIX=/util/opt/esmf/8.2.0/intel/19.0.1/
export ESMF_INSTALL_PREFIX=${PREFIX}
export ESMF_INSTALL_BINDIR=${PREFIX}/bin
export ESMF_INSTALL_DOCDIR=${PREFIX}/doc
export ESMF_INSTALL_HEADERDIR=${PREFIX}/include
export ESMF_INSTALL_LIBDIR=${PREFIX}/lib
export ESMF_INSTALL_MODDIR=${PREFIX}/mod
export ESMF_NETCDF="split"
export ESMF_NETCDF_INCLUDE=/util/opt/netcdf/4.7/intel/19/include/
export ESMF_NETCDF_LIBPATH=/util/opt/netcdf/4.7/intel/19/lib/
export ESMF_COMPILER=intel
export ESMF_COMM=openmpi

gmake all
gmake build_apps

# apps are in ./apps/appsO/Linux.intel.64.openmpi.default/
# libraries are in ./lib/libO/Linux.intel.64.openmpi.default/
