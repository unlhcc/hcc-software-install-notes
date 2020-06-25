#!/bin/bash

module load compiler/intel/19 openmpi/4.0

cd /util/opt/gamess/20190930R2/openmpi/4.0/intel/19

./config

<<COMM
Enter the following after ./config is run
please enter your target machine name: linux64
GAMESS directory? [/util/opt/gamess/20190930R2/openmpi/4.0.2/intel/19.0.1] 
GAMESS build directory? [/util/opt/gamess/20190930R2/openmpi/4.0.2/intel/19.0.1] 
Version? [00] 
Please enter your choice of FORTRAN: ifort
Version? 19
Enter your choice of 'mkl' or 'atlas' or 'acml' or 'libflame' or 'openblas' or 'pgiblas' or 'armpl' or 'none': mkl
MKL pathname? /util/comp/intel/19/mkl 
MKL version (or 'proceed')? proceed
Math library 'mkl' will be taken from /util/comp/intel/19/mkl/lib/intel64
communication library ('serial','sockets' or 'mpi' or 'mixed')? mpi
Enter MPI library (impi, mpich, mpich2, mvapich2, mpt, sockets): openmpi
Please enter your openmpi's location: /util/opt/openmpi/4.0/intel/19
Optional: Build Michigan State University CCT3 & CCSD3A methods?  (yes/no): no
Do you want to try LIBCCHEM?  (yes/no): no
 
Your configuration for GAMESS compilation is now in
     /util/opt/gamess/20190930R2/openmpi/4.0.2/intel/19.0.1/install.info
Now, please follow the directions in
     /util/opt/gamess/20190930R2/openmpi/4.0.2/intel/19.0.1/machines/readme.unix
COMM



# there is no prompt about OpenMP, and the previous builds have this set to true
sed -i 's/setenv GMS_OPENMP          false/setenv GMS_OPENMP          true/g' install.info




cd ddi
./compddi >& compddi.log
cd .. 




./compall >& compall.log 




./lked gamess 00 >& lked.log




# Few things in rungms need to be manually changed.
# The block below is a comparison of working rungms with the originally generated rungms file.
# The +line should be added in the new rungms.
<<COMM
[root@login.crane 19.0.1]# diff -u rungms.org rungms
--- rungms.org	2019-10-01 07:36:13.000000000 -0500
+++ rungms	2019-11-25 19:56:49.994010691 -0600
@@ -61,10 +61,13 @@
 #       both Sun Grid Engine (SGE), and Portable Batch System (PBS).
 #       See also a very old LoadLeveler "ll-gms" for some IBM systems.
 #
-set TARGET=sockets
-set SCR=/scr1/$USER
-set USERSCR=~/gamess-devv
-set GMSPATH=~/gamess-devv
+
+set TARGET=mpi
+set SCR=$TMPDIR
+set USERSCR=$WORK/scr
+set GMSPATH=/util/opt/gamess/20190930R2/openmpi/4.0.2/intel/19.0.1
+set PBS_NODEFILE=$PWD/PBS_NODEFILE
+
 #
 set JOB=$1      # name of the input file xxx.inp, give only the xxx part
 set VERNO=$2    # revision number of the executable created by 'lked' step
@@ -85,7 +88,7 @@
 #      on every assigned node (if not, modify scheduler's prolog script).
 #      The SCHED variable, and scheduler assigned work space, is used
 #      below only in the MPI section.  See that part for more info.
-                      set SCHED=none
+                      set SCHED=PBS
 if ($?PBS_O_LOGNAME)  set SCHED=PBS
 if ($?SGE_O_LOGNAME)  set SCHED=SGE
 if ($SCHED == SGE) then
@@ -156,15 +159,15 @@
 #    specify the full path name to the NBO binary.
 #    This value is ignored if NBO has not been linked to GAMESS.
 #
-setenv NBOEXE /u1/mike/nbo6/bin/nbo6.i8.exe
+#setenv NBOEXE /u1/mike/nbo6/bin/nbo6.i8.exe
 #
 #        choose remote shell execution program.
 #    Parallel run do initial launch of GAMESS on remote nodes by the
 #    following program.  Note that the authentication keys for ssh
 #    must have been set up correctly.
 #    If you wish, choose 'rsh/rcp' using .rhosts authentication instead.
-setenv DDI_RSH ssh
-setenv DDI_RCP scp
+#setenv DDI_RSH ssh
+#setenv DDI_RCP scp
 #
 #    If a $GDDI input group is present, the calculation will be using
 #    subgroups within DDI (the input NGROUP=0 means this isn't GDDI).
@@ -566,7 +569,7 @@
    #          this will have directories like include/lib/bin below it.
    #       3. a bit lower, perhaps specify your ifort path information.
    #
-   set DDI_MPI_CHOICE=impi
+   set DDI_MPI_CHOICE=openmpi
    #
    #        ISU's various clusters have various iMPI paths, in this order:
    #              dynamo/chemphys2011/exalted/bolt/CyEnce/CJ
@@ -593,7 +596,7 @@
    #          examples are our bolt/CyEnce clusters
    if ($DDI_MPI_CHOICE == openmpi) then
       #-- DDI_MPI_ROOT=/share/apps/mpi/openmpi-1.6.4-generic
-      set DDI_MPI_ROOT=/shared/openmpi-1.6.4/intel-13.0.1
+      set DDI_MPI_ROOT=/util/opt/openmpi/4.0/intel/19
    endif
    #
    #   MPICH/MPICH2
@@ -672,10 +675,10 @@
       endif
    endif
    #           uncomment next lines if you need to debug host configuration.
-   #--echo '-----debug----'
-   #--echo HOSTFILE $HOSTFILE contains
-   #--cat $HOSTFILE
-   #--echo '--------------'
+   #echo '-----debug----'
+   #echo HOSTFILE $HOSTFILE contains
+   #cat $HOSTFILE
+   #echo '--------------'
    #
    #  B. the next file forces explicit "which process on what node" rules.
    #     The contents depend on the kickoff style.  This file is how
@@ -752,10 +755,10 @@
 
    endsw
    #           uncomment next lines if you need to debug host configuration.
-   #--echo '-----debug----'
-   #--echo PROCFILE $PROCFILE contains
-   #--cat $PROCFILE
-   #--echo '--------------'
+   #echo '-----debug----'
+   #echo PROCFILE $PROCFILE contains
+   #cat $PROCFILE
+   #echo '--------------'
    #
    #     ==== values that influence the MPI operation ====
    #
@@ -830,10 +833,10 @@
    #----- LD_LIBRARY_PATH /share/apps/intel/composerxe-2011.1.107/compiler/lib/intel64:$LD_LIBRARY_PATH
    #----- LD_LIBRARY_PATH /share/apps/intel/composerxe-2011.4.191/compiler/lib/intel64:$LD_LIBRARY_PATH
    #----- LD_LIBRARY_PATH /share/apps/intel/composer_xe_2013.3.163/compiler/lib/intel64:$LD_LIBRARY_PATH
-   setenv LD_LIBRARY_PATH /shared/intel/composer_xe_2013.1.117/compiler/lib/intel64:$LD_LIBRARY_PATH
+   #setenv LD_LIBRARY_PATH /shared/intel/composer_xe_2013.1.117/compiler/lib/intel64:$LD_LIBRARY_PATH
    #----- LD_LIBRARY_PATH "/share/apps/intel/composer_xe_2011_sp1.8.273/composer_xe_2011_sp1.11.339/compiler/lib/intel64:$LD_LIBRARY_PATH"
    #----- LD_LIBRARY_PATH /share/apps/intel/composer_xe_2013.5.192/compiler/lib/intel64:$LD_LIBRARY_PATH
-
+   setenv LD_LIBRARY_PATH /util/comp/intel/19/lib/intel64:$LD_LIBRARY_PATH
    #
    #    Math library setup (MKL or Atlas):
    #
@@ -951,8 +954,8 @@
 
    case orte:
       set echo
-      orterun -np $NPROCS --npernode $PPN2 \
-              $GMSPATH/gamess.$VERNO.x < /dev/null
+#      orterun --oversubscribe -mca hwloc_base_binding_policy core:overload-allowed -np $NPROCS --npernode $PPN2 $GMSPATH/gamess.$VERNO.x < /dev/null
+       orterun --oversubscribe -mca hwloc_base_binding_policy core:overload-allowed -np $NPROCS $GMSPATH/gamess.$VERNO.x < /dev/null
       unset echo
       breaksw
    #
@@ -1679,7 +1682,7 @@
    set nnodes=`wc -l $HOSTFILE`
    set nnodes=$nnodes[1]
    @ n=1
-   set master=`hostname`
+   set master=`hostname -s`
            # burn off the .local suffix in our cluster's hostname
    set master=$master:r
    while ($n <= $nnodes)
@@ -1694,8 +1697,10 @@
          #--   ssh $host -l $USER "cat $SCR/$JOB.F06*"
          #--endif
          #---------FMO rescue------
-         ssh $host -l $USER "ls -l $SCR/$JOB.*"
-         ssh $host -l $USER "rm -f $SCR/$JOB.*"
+	 srun -N 1 -n 1 -w $host /bin/bash -c "ls -l $SCR/$JOB.*"
+         srun -N 1 -n 1 -w $host /bin/bash -c "rm -f $SCR/$JOB.*"
+#         ssh $host -l $USER "ls -l $SCR/$JOB.*"
+#         ssh $host -l $USER "rm -f $SCR/$JOB.*"
       endif
       @ n++
    end

