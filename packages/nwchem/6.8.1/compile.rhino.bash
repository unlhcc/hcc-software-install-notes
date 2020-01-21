#!/bin/bash

cd src/rdmft/recycling/wfn1/
gfortran wfn1_test_para.F wfn1_f0df0f1.F wfn1_f1f2f3.F -o testpara
