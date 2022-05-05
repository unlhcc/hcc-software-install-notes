## Installation of VTST Tools
Copy the VTST files into `vasp/src` and then make some code file modifications.


In the `main.F` file within the VASP source, change
```
CALL CHAIN_FORCE(T_INFO%NIONS,DYN%POSION,TOTEN,TIFOR, &
     LATT_CUR%A,LATT_CUR%B,IO%IU6)
```
to
```
CALL CHAIN_FORCE(T_INFO%NIONS,DYN%POSION,TOTEN,TIFOR, &
     TSIF,LATT_CUR%A,LATT_CUR%B,IO%IU6)
```

For version 6.2+, also change
```
IF (LCHAIN) CALL chain_init( T_INFO, IO)
```
to
```
CALL chain_init( T_INFO, IO)
```

For Vasp 6.2.1, you will also need vtstcode 4.1.


Next:
Add the below into `src/.objects`
```
bfgs.o dynmat.o  instanton.o  lbfgs.o sd.o   cg.o dimer.o bbm.o \
fire.o lanczos.o neb.o  qm.o opt.o
```

After this, compile as normal.





Steps Source: https://theory.cm.utexas.edu/vtsttools/installation.html

