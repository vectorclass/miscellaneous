# makefile
# Author:        Agner Fog
# Date created:  2019-07-03
# Last modified: 2022-07-23
# Version:       2.02
# Project:       vector class library
# Description:
# Makefile for building a library of stubs for fixing explicit calls from 
# 64-bit windows to Intel short vector math library (SVML).
#
# The SVML library uses vector registers for paramters, while the default
# calling convention for intrinsic vector types in Win64 is by pointers.
# Some compilers (MS, Clang) allow the __vectorcall attribute which makes
# vector parameters transferred in vector registers. Unfortunately, the 
# compiler adds @@ and the total parameter size in bytes to the name,
# even when extern "C" is specified.
#
# The stubs in this library fixes the name incompatibility for several functions.
# This is a makefile for building the library using Gnu/Cygwin make or similar.
#
# (c) Copyright 2019-2022 Apache licence 2.0
#******************************************************************************

svmlpatch.lib : svml_exp_x.obj svml_exp_y.obj svml_exp_z.obj \
svml_trig_x.obj svml_trig_y.obj svml_trig_z.obj \
svml_hyp_x.obj svml_hyp_y.obj svml_hyp_z.obj \
svml_misc_x.obj svml_misc_y.obj svml_misc_z.obj
	lib /out:$@ $^

svmlpatch.a : svml_exp_x.obj svml_exp_y.obj svml_exp_z.obj \
svml_trig_x.obj svml_trig_y.obj svml_trig_z.obj \
svml_hyp_x.obj svml_hyp_y.obj svml_hyp_z.obj \
svml_misc_x.obj svml_misc_y.obj svml_misc_z.obj
	ar ru $@ $^
	ranlib $@

%.obj : %.nasm
	nasm -fwin64 $< -o $@
