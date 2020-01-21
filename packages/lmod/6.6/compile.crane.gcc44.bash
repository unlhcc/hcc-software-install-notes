#!/bin/bash

# Newer versions of Lmod pick up these variables (LUA_PATH, LUA_CPATH)
# at compile time and ignore them later to prevent user changes in the
# environment from breaking things.  So we have to set them now.
export LUA_PATH="/util/opt/LuaXML/1.7.4/?.lua;;;"
export LUA_CPATH="/util/opt/LuaXML/1.7.4/?.so;;;"

./configure --prefix=/util/opt \
--with-module-root-path=/util/opt/modulefiles \
--with-caseIndependentSorting=yes \
--with-settarg=no
