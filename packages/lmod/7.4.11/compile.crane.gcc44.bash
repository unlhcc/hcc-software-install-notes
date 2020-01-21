#!/bin/bash

make clean
make distclean
export LUA_PATH="/util/opt/LuaXML/1.7.4/?.lua;;"
export LUA_CPATH="/util/opt/LuaXML/1.7.4/?.so;;"
./configure --prefix=/util/opt --with-module-root-path=/util/opt/modulefiles --with-caseIndependentSorting=yes --with-settarg=no
