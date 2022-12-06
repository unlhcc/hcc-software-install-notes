Quantum ESPRESSO 7.1



 After execute“./configure” command as in the script, that generates make.inc file in the current directory.
Please open that file and replace "DFLAGS         =  -D__MPI " with "DFLAGS         =  -D__DFTI -D__MPI".
Then, continue with "make all" and "make install" from the script
~                                                                                                                                                                                                           
~                                                                       
