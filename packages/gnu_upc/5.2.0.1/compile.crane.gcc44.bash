#!/bin/bash

module load m4/1.4 autoconf/2.69  automake/1.14
../upc-5.2.0.1/configure --prefix=/util/comp/gnu-upc/5.2.0.1 -with-upc-pts=struct
