#!/bin/bash

module load pgi/12

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1/pgi/12
