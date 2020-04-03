#!/bin/bash

echo "Sourcing set_module_env.bash"

module purge
module load NUWRF/intel/v9

export WRF_USE_MPI=1
export WPS_USE_MPI=1
export UPP_USE_MPI=1
export WRF_ESMF_LIBS="-L/util/opt/nuwrf/v9/deps/lib/libO/Linux.intel.64.openmpi.default -lesmf -lstdc++ -lrt"
export WRF_ESMF_LIBS_MPI="-L/util/opt/nuwrf/v9/deps/lib/libO/Linux.intel.64.openmpi.default -lesmf -lstdc++ -lrt"
export WRF_CONFIGURE_MPI_OPT=19 
export WRF_CONFIGURE_NOMPI_OPT=17
export WRF_CONFIGURE_LIS_MPI=configure.lis.linux_ifc.nuwrf_mpi
export WRF_CONFIGURE_LIS_NOMPI=configure.lis.linux_ifc.nuwrf_nompi
export LIS_ARCH=linux_ifc
export LIS_FC=mpifort
export LIS_CC=mpicc
export LIS_MOD_ESMF=/util/opt/nuwrf/v9/deps/mod/modO/Linux.intel.64.openmpi.default
export LIS_LIB_ESMF=/util/opt/nuwrf/v9/deps/lib/libO/Linux.intel.64.openmpi.default
export LIS_MODESMF=/util/opt/nuwrf/v9/deps/mod/modO/Linux.intel.64.openmpi.default
export LIS_LIBESMF=/util/opt/nuwrf/v9/deps/lib/libO/Linux.intel.64.openmpi.default
export LIS_GRIBAPI=/util/opt/nuwrf/v9/deps
export LIS_JASPER=/util/opt/nuwrf/v9/deps
export LIS_NETCDF=/util/opt/nuwrf/v9/deps
export LIS_HDF4=/util/opt/nuwrf/v9/deps
export LIS_HDF5=/util/opt/nuwrf/v9/deps
export LIS_HDFEOS=/util/opt/nuwrf/v9/deps
export LIS_ZLIB=/util/opt/nuwrf/v9/deps
export WPS_GRIB2_LIBS=/util/opt/nuwrf/v9/deps/lib
export WPS_GRIB2_INC=/util/opt/nuwrf/v9/deps/include
export WPS_CONFIGURE_MPI_OPT=19 # Linux x86_64, Intel compiler    (dmpar)
export WPS_CONFIGURE_NOMPI_OPT=17 # Linux x86_64, Intel compiler    (serial)
export DEP_LIB_PATH=/util/opt/nuwrf/v9/deps/lib

# Configure options for UPP.
export UPP_CONFIGURE_MPI_OPT=4 # Linux x86_64, Intel compiler      (dmpar)
export UPP_CONFIGURE_NOMPI_OPT=3 # Linux x86_64, Intel compiler      (serial)

# GRIB2 libraries (Jasper, LIBPNG, and ZLIB) for UPP
export UPP_GRIB2_LIBS=/util/opt/nuwrf/v9/deps/lib
export UPP_GRIB2_INC=/util/opt/nuwrf/v9/deps/include
