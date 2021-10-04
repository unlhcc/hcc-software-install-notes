###########################################################################################
# buildoptions.py 
# 
# This file defines all options related to building CRIMSON
# Optimisation is on by default. 
# To build create a debug build add the option debug=1
# For example: "scons -j3 debug=1" will execute a debug build using 3 parallel build jobs 
###########################################################################################

import sys
import os 

SHELL           = '/bin/sh'  # setme
CXX             = 'mpicxx'  # setme
CC              = 'mpicc'  # setme
F90             = 'mpif90'  # setme

#################################
# Select Intel of GNU archiever #
#################################

#AR              = 'xiar' # Intel
AR              = 'ar'  # GNU
 
GLOBAL_DEFINES = ['-Dunix']
 
MAKE_WITH_POSTSOLVER = 1
MAKE_WITH_FLOWSOLVER = 1
MAKE_WITH_ESTIMATOR = 1

# disables acusim tests only currently.
DISABLE_ACUSIM = 1

WITH_ELECTRIC_FENCE = 0

#######################################################
# Extra console output.                               #
# These options should be set to zero on the SGI/FLUX #
# #####################################################

EXTRA_CONSOLE_OUTPUT_ON = 0
DEBUG_ALE_ON = 0

#############################
# Select Intel or GNU flags # 
#############################

# Intel flags

# OPT_FLAGS       = ['-O3', '-std=c++0x', '-DNDEBUG','-DDEBUG_ALE='+str(DEBUG_ALE_ON)]
# OPT_FFLAGS      = ['-O3','-align','array64byte','-fpp','-D\'DEBUG_ALE='+str(DEBUG_ALE_ON)+'\'','-D\'EXTRA_CONSOLE_OUTPUT='+str(EXTRA_CONSOLE_OUTPUT_ON)+'\'']
# DEBUG_FLAGS     = ['-O0','-g','-std=c++0x','-pthread','-Wall','-DDEBUG_ALE='+str(DEBUG_ALE_ON)]
# DEBUG_FFLAGS    = ['-O0','-g','-align','array64byte','-traceback','-fp-stack-check','-fpp','-DDEBUG_ALE='+str(DEBUG_ALE_ON),'-DEXTRA_CONSOLE_OUTPUT='+str(EXTRA_CONSOLE_OUTPUT_ON)]

# GNU flags
#
# Note that the 64 bit alignment should be done automatically with gfortran. 
# "GFortran translates ALLOCATE calls using malloc(), so if your system malloc() returns correctly aligned memory"
# See https://gcc.gnu.org/ml/fortran/2007-05/msg00494.html
#
# Other users post about using the flag -m64, but tests are inconclusive if this is faster/different from the default behaviour	
# See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=24261

# OPT_FLAGS       = ['-O3', '-std=c++0x', '-fsanitize=undefined', '-static-libasan', '-DNDEBUG','-DDEBUG_ALE='+str(DEBUG_ALE_ON)]
# OPT_FLAGS       = ['-O3', '-std=c++0x', '-fsanitize=address', '-static-libasan', '-DNDEBUG','-DDEBUG_ALE='+str(DEBUG_ALE_ON)]
OPT_FLAGS       = ['-O3', '-std=c++0x', '-DNDEBUG','-DDEBUG_ALE='+str(DEBUG_ALE_ON)]
OPT_FFLAGS      = ['-ffree-line-length-none','-O3','-cpp','-D\'DEBUG_ALE='+str(DEBUG_ALE_ON)+'\'','-D\'EXTRA_CONSOLE_OUTPUT='+str(EXTRA_CONSOLE_OUTPUT_ON)+'\'']
DEBUG_FLAGS     = ['-O0','-g','-std=c++0x','-pthread','-Wall','-DDEBUG_ALE='+str(DEBUG_ALE_ON)]
DEBUG_FFLAGS    = ['-ffree-line-length-none','-g','-fbacktrace','-cpp','-DDEBUG_ALE='+str(DEBUG_ALE_ON),'-DEXTRA_CONSOLE_OUTPUT='+str(EXTRA_CONSOLE_OUTPUT_ON)]  #-cpp #-fno-underscoring

if DISABLE_ACUSIM==1:
	OPT_FLAGS.append('-DDISABLE_ACUSIM_TESTS')
	DEBUG_FLAGS.append('-DDISABLE_ACUSIM_TESTS')
	OPT_FLAGS.append('-DNO_ACUSIM')
	OPT_FFLAGS.append('-DNO_ACUSIM')
	DEBUG_FLAGS.append('-DNO_ACUSIM')
	DEBUG_FFLAGS.append('-DNO_ACUSIM')

ADDITIONAL_LINKFLAGS = []

###################################
# Python include and library list #
###################################

PYTHON_TOP = '/util/opt/anaconda/deployed-conda-envs/packages/python/envs/python-2.7'
PYTHON_INCDIR = [PYTHON_TOP + '/include/python2.7']  # setme
PYTHON_LIBSDIR = [PYTHON_TOP +'/lib/python2.7/config']
PYTHON_LIBSLIST = ['dl','util','m','python2.7']
PYTHON_LDMODULEFLAGS = ['-Wl,-export-dynamic','-Wl,-Bsymbolic-functions']

#################### 
# Set global flags #
#################### 

BUILDFLAGS      = GLOBAL_DEFINES

CXX_LIBS    = ''
CXX_LIBS    = '-lrt'
F90_LIBS    = ['']

################################### 
# Set root of CRIMSON source tree #
################################### 

HOME_DIR = os.getcwd()
EXTERNAL_LIB_DIR = HOME_DIR+'/external/x64-linux'
 
SOLVERIO_INCDIR   = [HOME_DIR+'/solverio/src']
SOLVERIO_LIBSDIR  = [HOME_DIR+'/lib']
SOLVERIO_LIBSLIST = ['crimson_solverio']

FLOWSOLVER_INCDIR = [HOME_DIR+'/flowsolver/src']
FLOWSOLVER_LIBSDIR = [HOME_DIR+'/lib']
FLOWSOLVER_LIBSLIST = ['crimson_flowsolver']

ESTIMATOR_INCDIR = [HOME_DIR+'/estimation/src']
 
##########################################
# Select Intel or GNU run time libraries # 
##########################################

INTEL_TOP      = '/opt/intel/composerxe'
INTEL_INCDIR   = [INTEL_TOP+'/include']
INTEL_LIBSDIR  = [INTEL_TOP+'/lib/intel64']
INTEL_LIBSLIST = ['ifcore','ifport','imf','irc']

GNU_TOP      = ['/util/comp/gcc/9.1']  # setme
GNU_INCDIR   = ['/util/comp/gcc/9.1/include']
GNU_LIBSDIR  = ['/util/comp/gcc/9.1/lib'] 
GNU_LIBSLIST = ['gfortran'] 

RUNTIME_INCDIR   = GNU_INCDIR 
RUNTIME_LIBSDIR  = GNU_LIBSDIR
RUNTIME_LIBSLIST = GNU_LIBSLIST

################################
# MPI include and library list #
################################

MPI_TOP        = os.getenv("OPENMPI")  # setme
MPI_INCDIR     = [MPI_TOP+'/include']
MPI_LIBSDIR    = [MPI_TOP+'/lib']
MPI_LIBSLIST   = ['mpi','mpi_mpifh']

####################################
# Metis 4 include and library list #
####################################

METIS_TOP      = os.getenv("METIS")
METIS_INCDIR   = [METIS_TOP+'/include']
METIS_LIBSDIR  = [METIS_TOP+'/lib']
METIS_LIBSLIST = ['metis']
 

######################
# Flowsolver library #
######################

CRIMSON_COMMON_LIBSLIST = ['crimson_common']

#######################
# Presolver libraries #
#######################

NSPCG_TOP      = EXTERNAL_LIB_DIR+'/NSPCG'
NSPCG_INCDIR   = [NSPCG_TOP]
NSPCG_LIBSDIR  = [NSPCG_TOP]
NSPCG_LIBSLIST = ['nspcg']

SPARSE_TOP     = EXTERNAL_LIB_DIR+'/sparse-1.4'
SPARSE_INCDIR  = [SPARSE_TOP]
SPARSE_LIBSDIR = [SPARSE_TOP]
SPARSE_LIBSLIST= ['sparse']

ZLIB_TOP       = EXTERNAL_LIB_DIR+'/zlib-1.2.3'
ZLIB_INCDIR    = [ZLIB_TOP]
ZLIB_LIBSDIR   = [ZLIB_TOP]
ZLIB_LIBSLIST  = ['z']

################################
# Verdandi and Seldon includes # 
################################

VERDANDI_TOP  = EXTERNAL_LIB_DIR+'/verdandi/verdandi-1.2.1-crimson-1/' # setme
VERDANDI_INCDIR  = [VERDANDI_TOP, \
		 VERDANDI_TOP+'/container', \
		 VERDANDI_TOP+'/error', \
		 VERDANDI_TOP+'/method', \
		 VERDANDI_TOP+'/model', \
		 VERDANDI_TOP+'/observation_manager', \
		 VERDANDI_TOP+'/output_saver', \
		 VERDANDI_TOP+'/share', \
		 VERDANDI_TOP+'/include', \
		 VERDANDI_TOP+'/include/lua/src', \
		 VERDANDI_TOP+'/include/seldon']

SELDON_TOP  = VERDANDI_TOP
SELDON_INCDIR  = [SELDON_TOP,'/include/seldon']

###############
# Lua library #
###############

LUA_LIBSDIR = [VERDANDI_TOP+'/include/lua/src/']
LUA_LIBSLIST = ['lua']

###############################
# PetSC include and libraries #
###############################

PETSC_TOP    = os.getenv("PETSC_DIR")  # setme
PETSC_BUILD = ''  # setme
PETSC_INCDIR = [PETSC_TOP+'/include',PETSC_TOP+'/'+PETSC_BUILD+'/include']
PETSC_LIBSDIR   = [PETSC_TOP+'/'+PETSC_BUILD+'/lib']
PETSC_LIBSLIST = ['petsc']

####################################
# Boost 1.57 include and libraries #
####################################

BOOSTCPP_TOP    = os.getenv("BOOST_DIR")  # setme
BOOSTCPP_INCDIR = [BOOSTCPP_TOP+'/include']
BOOSTCPP_LIBSDIR = [BOOSTCPP_TOP+'/lib']
BOOSTCPP_LIBSLIST = ['boost_thread','boost_filesystem','boost_system']

#################################
# VTK 5.8 include and libraries #
#################################

VTK_TOP    = '/util/opt/crimsonflowsolver/vtk/5.8/openmpi/3.1/gcc/9.1'  # setme
VTK_INCDIR = [VTK_TOP+'/include/vtk-5.8']
VTK_LIBSDIR   = [VTK_TOP+'/lib/vtk-5.8/']
VTK_LIBSLIST = ['vtkGraphics','vtkFiltering','vtkGenericFiltering','vtkIO','vtkCommon','vtksys']

##################################################
# BLAS and LAPACK include and libraries          #
##################################################

BLASLAPACK_TOP    = os.getenv("MKLROOT")  # setme
BLASLAPACK_INCDIR = [BLASLAPACK_TOP+'/include']
BLASLAPACK_LIBSDIR   = [BLASLAPACK_TOP+'/lib/intel64']
BLASLAPACK_LIBSLIST = ['mkl_intel_lp64', 'mkl_sequential', 'mkl_core', 'pthread']  # ['lapack','blas','cblas'] 

######################################
# Google test includes and libraries #
######################################

GOOGLETEST_TOP    = HOME_DIR+'/gtest-1.7.0'
GOOGLETEST_INCDIR = [GOOGLETEST_TOP+'/include']
GOOGLETEST_SRC    = [GOOGLETEST_TOP+'/src']
GOOGLETEST_LIBSLIST = ['test_flowsolver']

if WITH_ELECTRIC_FENCE == 1:
 EFENCE_TOP = '/home/USERNAME/Software/efence/electric-fence-2.1.13'
 EFENCE_INCDIR = [EFENCE_TOP]
 EFENCE_LIBSLIST=['efence']
else:
 EFENCE_TOP = ''
 EFENCE_INCDIR = []
 EFENCE_LIBSLIST=[]
