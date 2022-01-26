#!/bin/bash

rm -f makefile.include && cp makefile.intel19.ompi40.include makefile.include
make veryclean
make all
