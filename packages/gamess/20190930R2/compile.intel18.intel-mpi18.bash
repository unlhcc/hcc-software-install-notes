#!/bin/bash

module load compiler/intel/18 intel-mpi/18 intel-mkl/18
./config

<< COMM
[root@build.crane gamess]# module load compiler/intel/18 intel-mpi/18 intel-mkl/18
[root@build.crane gamess]# ./config
This script asks a few questions, depending on your computer system,
to set up compiler names, libraries, message passing libraries,
and so forth.

You can quit at any time by pressing control-C, and then <return>.

Please open a second window by logging into your target machine,
in case this script asks you to 'type' a command to learn something
about your system software situation.  All such extra questions will
use the word 'type' to indicate it is a command for the other window.

After the new window is open, please hit <return> to go on.
   GAMESS can compile on the following 32 bit or 64 bit machines:
axp64       - Alpha chip, native compiler, running Tru64 or Linux
cray-xt     - Cray's massively parallel system, running CNL
cray-xc     - Cray's XC40, with KNL nodes
hpux32      - HP PA-RISC chips (old models only), running HP-UX
hpux64      - HP Intel or PA-RISC chips, running HP-UX
ibm32       - IBM (old models only), running AIX
ibm64       - IBM, Power3 chip or newer, running AIX or Linux
ibm64-sp    - IBM SP parallel system, running AIX
ibm-bg      - IBM Blue Gene (Q model), these are 64 bit systems
linux32     - Linux (any 32 bit distribution), for x86 (old systems only)
linux64     - Linux (any 64 bit distribution), for x86_64 or ia64 chips,
              using gfortran, ifort, or perhaps PGI compilers.
mac32       - Apple Mac, any chip, running OS X 10.4 or older
mac64       - Apple Mac, any chip, running OS X 10.5 or newer
sgi32       - Silicon Graphics Inc., MIPS chip only, running Irix
sgi64       - Silicon Graphics Inc., MIPS chip only, running Irix
sun32       - Sun ultraSPARC chips (old models only), running Solaris
sun64       - Sun ultraSPARC or Opteron chips, running Solaris
win32       - Windows 32-bit (Windows XP, Vista, 7, Compute Cluster, HPC Edition)
win64       - Windows 64-bit (Windows XP, Vista, 7, Compute Cluster, HPC Edition)
winazure    - Windows Azure Cloud Platform running Windows 64-bit
singularity - GAMESS Singularity container image

    type 'uname -a' to partially clarify your computer's flavor.

please enter your target machine name: linux64
Where is the GAMESS software on your system?
A typical response might be /u1/mike/gamess,
most probably the correct answer is /tmp/gamess

GAMESS directory? [/tmp/gamess]
Setting up GAMESS compile and link for GMS_TARGET=linux64
GAMESS software is located at GMS_PATH=/tmp/gamess

Please provide the name of the build locaation.
This may be the same location as the GAMESS directory.

GAMESS build directory? [/tmp/gamess]

Please provide a version number for the GAMESS executable.
This will be used as the middle part of the binary's name,
for example: gamess.00.x

Version? [00]
Linux offers many choices for FORTRAN compilers, including the GNU
compiler suite's free compiler 'gfortran', usually included in
any Linux distribution.  If gfortran is not installed, it can be
installed from your distribution media.

To check on installed GNU compilers, for RedHat/SUSE style Linux,
   type 'rpm -aq | grep gcc' for both languages,
and for Debian/Ubuntu style Linux, it takes two commands
   type 'dpkg -l | grep gcc'
   type 'dpkg -l | grep gfortran'

There are also other compilers (some commercial), namely Intel's 'ifort',
Portland Group's 'pgfortran', Pathscale's 'pathf90', AMD's 'AOCC',
and ARM's armflang.
The last four are not common, and aren't as well tested.

type 'which gfortran'  to look for GNU's gfortran   (a good choice),
type 'which ifort'     to look for Intel's compiler (a good choice),
type 'which pgfortran' to look for Portland Group's compiler,
type 'which pathf90'   to look for Pathscale's compiler.
type 'which aocc'      to look for AMD's compiler.
type 'which armflang'  to look for ARM compiler.
Please enter your choice of FORTRAN: ifort

Use of 'ifort' requires additional information since library
names, and compiler flags, are very version number specific.
note: ifort's directory tree is typically
         /opt/intel/fc
         /opt/intel/fce
         /opt/intel/Compiler
         /opt/intel/composerxe     (et cetera).

Type 'which ifort' and note the version number in its pathname.
In case of the newer 'composerxe' bundles, the version is not
shown in the pathname, but can be obtained by 'ifort -V'.

Enter only the main version number, such as 8, ... 11, 12, 13, 14.
Version? 18
hit <return> to continue to the math library setup.
Linux distributions do not include a standard math library.

There are several reasonable add-on library choices,
       MKL from Intel           for 32 or 64 bit Linux (very fast)
      ACML from AMD             for 32 or 64 bit Linux (free)
     LibFLAME from AMD          for 64 bit Linux (free)
     ATLAS from www.rpmfind.net for 32 or 64 bit Linux (free)
  PGI BLAS from Portland Group  for 32 or 64 bit Linux
     ArmPL from ARM             for 64 bit Linux
and one very unreasonable option, namely 'none', which will use
some slow FORTRAN routines supplied with GAMESS.  Choosing 'none'
will run MP2 jobs 2x slower, or CCSD(T) jobs 5x slower.

Some typical places (but not the only ones) to find math libraries are
Type 'ls /opt/intel/mkl'                 to look for MKL
Type 'ls /opt/intel/Compiler/mkl'        to look for MKL
Type 'ls /opt/intel/composerxe/mkl'      to look for MKL
Type 'echo $MKLROOT'                     to look for MKL
Type 'ls -d /opt/acml*'                  to look for ACML
Type 'ls -d /usr/local/acml*'            to look for ACML
Type 'ls /usr/lib64/atlas'               to look for Atlas
Type 'ls /opt/pgi/linux86-64/*/lib/*     to look for libblas.a from PGI
Type 'ls /opt/pgi/osx86-64/*/lib/*       to look for libblas.a from PGI
Type 'echo $ARMPL_DIR'                   to look for ArmPL

Enter your choice of 'mkl' or 'atlas' or 'acml' or 'libflame' or 'openblas' or 'pgiblas' or 'armpl' or 'none': mkl

The exact MKL libraries needed depend on its version number.
First, where is your MKL software installed?  For example
             /opt/intel/mkl                           -or-
             /opt/intel/Compiler/mkl                  -or-
             /opt/intel/composerxe/mkl                -or-
             /your/sites/nonstandard/path/mkl

Found:       /util/comp/intel/18/mkl

Don't enter anything past the mkl subdirectory pathname.
MKL pathname? /util/comp/intel/18/mkl

Second, it is possible to have multiple version of MKL
installed, but often there is only one version installed.
Your system seems to have the following version(s):

benchmarks  bin  examples  include  interfaces  lib  tools

a) If the above output contains one or more version number,
enter the specific version you prefer, giving all decimals.
b) If the above output contains paths like 'bin' and 'lib',
enter the word 'proceed' next.
MKL version (or 'proceed')? proceed
Math library 'mkl' will be taken from /util/comp/intel/18/mkl/lib/intel64

please hit <return> to compile the GAMESS source code activator
ifort -o /tmp/gamess/tools/actvte.x actvte.f
unset echo
Source code activator was successfully compiled.

please hit <return> to set up your network for Linux clusters.

If you have a slow network, like Gigabit Ethernet (GE), or
if you have so few nodes you won't run extensively in parallel, or
if you have no MPI library installed, or
if you want a fail-safe compile/link and easy execution,
     choose 'sockets'
to use good old reliable standard TCP/IP networking.

If you have an expensive but fast network like Infiniband (IB), and
if you have an MPI library correctly installed,
     choose 'mpi'.

If you wish to use a combination of TCP/IP networking for small
messages and MPI for large messages in a 'mixed' fashion,
     choose 'mixed'.

communication library ('serial','sockets' or 'mpi' or 'mixed')? mpi
The MPI libraries which work well on linux64/Infiniband are
      Intel's MPI (impi)
      MPICH/MPICH2
      MVAPICH2
      SGI's mpt from ProPack, on Altix/ICE systems
Other libraries may work, please see 'readme.ddi' for info.
The choices listed above will compile and link easily,
and are known to run correctly and efficiently.

Enter 'sockets' if you just changed your mind about trying MPI.

Enter MPI library (impi, mpich, mpich2, mvapich2, mpt, sockets): impi

MPI can be installed in many places, so let's find impi.
The person who installed your MPI can tell you where it really is.

impi     is probably located at a directory like
              /opt/intel/impi/impi_latest

Found:        Nothing.

Please enter your impi's location: /util/opt/intel-mpi/18/compilers_and_libraries/linux/mpi
Users have the option of compiling the beta version of the
active-space CCSDt and CC(t;3) codes developed at Michigan
State University (CCTYP = CCSD3A and CCT3, respectively).

These builds take a considerable amount of time and memory for
compilation due to the amount of machine generated source code.
We recommend that users interested in installing these codes
compile GAMESS in parallel using the Makefile generated during
the initial configuration ('make -j [number of cores]').

This option can be manually changed later by modifying install.info

Optional: Build Michigan State University CCT3 & CCSD3A methods?  (yes/no): no
64 bit Linux and IBM builds can attach a special LIBCCHEM code for fast
MP2 and CCSD(T) runs.  The LIBCCHEM code can utilize nVIDIA GPUs,
through the CUDA libraries, if GPUs are available.
Usage of LIBCCHEM requires installation of HDF5 I/O software as well.
GAMESS+LIBCCHEM binaries are unable to run most of GAMESS computations,
and are a bit harder to create due to the additional CUDA/HDF5 software.
Therefore, the first time you run 'config', the best answer is 'no'!
If you decide to try LIBCCHEM later, just run this 'config' again.

Do you want to try LIBCCHEM?  (yes/no): no
# Capture floating-point exceptions

Your configuration for GAMESS compilation is now in
     /tmp/gamess/install.info
Now, please follow the directions in
     /tmp/gamess/machines/readme.unix

COMM

# cat install.info
<< INFO
#!/bin/csh

#   Compilation configuration for GAMESS
#   Generated on build.crane.hcc.unl.edu
#   Generated at Thu Aug 20 15:46:55 CDT 2020

#                GAMESS Paths                  #
setenv GMS_PATH            /tmp/gamess
setenv GMS_BUILD_DIR       /tmp/gamess

#                Machine Type                  #
setenv GMS_TARGET          linux64

#            FORTRAN Compiler Setup            #
setenv GMS_FORTRAN         ifort
setenv GMS_IFORT_VERNO     18

#         Mathematical Library Setup           #
setenv GMS_MATHLIB         mkl
setenv GMS_MATHLIB_PATH    /util/comp/intel/18/mkl/lib/intel64
setenv GMS_MKL_VERNO       12
setenv GMS_AMD_BLAS_PATH
#         parallel message passing model setup
setenv GMS_DDI_COMM        mpi
setenv GMS_MPI_LIB         impi
setenv GMS_MPI_PATH        /util/opt/intel-mpi/18/compilers_and_libraries/linux/mpi

#   Michigan State University Coupled Cluster  #
setenv GMS_MSUCC           false

# Please match any manual changes to the       #
# GMS_MSUCC flag in /tmp/gamess/Makefile
# before running make                          #

#         LIBCCHEM CPU/GPU Code Interface      #
setenv GMS_LIBCCHEM        false

#      Intel Xeon Phi Build: none/knc/knl      #
setenv GMS_PHI             none

#         Shared Memory Type: sysv/posix       #
setenv GMS_SHMTYPE         sysv

#      GAMESS OpenMP support: true/false       #
setenv GMS_OPENMP          true

# Please match any manual changes to the       #
# GMS_OPENM flag in /tmp/gamess/Makefile
# before running make                          #

#             Singularity Setup                #
setenv GMS_CONTAINER
setenv GMS_CONTAINER_PATH  /tmp/gamess

################################################
# Added any additional environmental variables #
# or module loads below if needed.             #
################################################
setenv GMS_FPE_FLAGS       '-fpe0'
INFO

# changes to rungms script
<< RUNGMS
[root@build.crane gamess]# diff rungms /util/opt/gamess/20190930R2/intel-mpi/18/intel/18/rungms
64,67c64,68
< set TARGET=sockets
< set SCR=/scr1/$USER
< set USERSCR=~/gamess-devv
< set GMSPATH=~/gamess-devv
---
> set TARGET=mpi
> set SCR=$TMPDIR
> set USERSCR=$WORK/scr
> set GMSPATH=/util/opt/gamess/20190930R2/intel-mpi/18.5/intel/18.5
> set PBS_NODEFILE=$PWD/PBS_NODEFILE
88c89
<                       set SCHED=none
---
>                       set SCHED=PBS
159c160
< setenv NBOEXE /u1/mike/nbo6/bin/nbo6.i8.exe
---
> #setenv NBOEXE /u1/mike/nbo6/bin/nbo6.i8.exe
166,167c167,168
< setenv DDI_RSH ssh
< setenv DDI_RCP scp
---
> #setenv DDI_RSH ssh
> #setenv DDI_RCP scp
578c579
<       set DDI_MPI_ROOT=/shared/intel/impi/4.1.0.024/intel64
---
>       set DDI_MPI_ROOT=/util/opt/intel-mpi/18/compilers_and_libraries/linux/mpi
780c781
<       setenv I_MPI_DAT_LIBRARY libdat2.so
---
>       setenv I_MPI_DAT_LIBRARY libdat2.so.2
833c834
<    setenv LD_LIBRARY_PATH /shared/intel/composer_xe_2013.1.117/compiler/lib/intel64:$LD_LIBRARY_PATH
---
>    setenv LD_LIBRARY_PATH /util/comp/intel/19/lib/intel64:$LD_LIBRARY_PATH
1682c1683
<    set master=`hostname`
---
>    set master=`hostname -s`
1697,1698c1698,1699
<          ssh $host -l $USER "ls -l $SCR/$JOB.*"
<          ssh $host -l $USER "rm -f $SCR/$JOB.*"
---
> #         srun -N 1 -n 1 -w $host /bin/bash -c "ls -l $SCR/$JOB.*"
> #         srun -N 1 -n 1 -w $host /bin/bash -c "rm -f $SCR/$JOB.*"
RUNGMS

