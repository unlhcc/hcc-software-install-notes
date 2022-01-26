#!/bin/bash

rm -f makefile.include && cp makefile_acc.include makefile.include
make veryclean
make all
