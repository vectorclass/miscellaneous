; ***************************  svml_misc_z.nasm  ***************************
; Author:        Agner Fog
; Date created:  2019-07-03
; Version:       2.00
; Project:       vector class library
; Description:
; Stubs for fixing explicit calls from 64-bit windows to Intel short vector 
; math library (SVML).
;
; The SVML library uses vector registers for paramters, while the default
; calling convention for intrinsic vector types in Win64 is by pointers.
; Some compilers (MS, Clang) allow the __vectorcall attribute which makes
; vector paremters transferred in vector registers. Unfortunately, the 
; compiler adds @@ and the total parameter size in bytes to the name,
; even when extern "C" is specified.
;
; The stubs in this file fixes the name incompatibility for several functions
;
; This assembly file uses nasm syntax. Use nasm or yasm to assemble.
;
; (c) Copyright 2019 Apache licence 2.0
;******************************************************************************

; Miscellaneous functions with 512-bit vectors

extern __svml_erff16, __svml_erf8, __svml_erfcf16, __svml_erfc8
extern __svml_erfinvf16, __svml_erfinv8
extern __svml_cdfnormf16, __svml_cdfnorm8, __svml_cdfnorminvf16, __svml_cdfnorminv8
extern __svml_cexpf16, __svml_cexp8

global __svml_erff16@@64, __svml_erf8@@64, __svml_erfcf16@@64, __svml_erfc8@@64
global __svml_erfinvf16@@64, __svml_erfinv8@@64
global __svml_cdfnormf16@@64, __svml_cdfnorm8@@64, __svml_cdfnorminvf16@@64, __svml_cdfnorminv8@@64
global __svml_cexpf16@@64, __svml_cexp8@@64


SECTION .text align = 8
default rel

__svml_erff16@@64: jmp __svml_erff16
__svml_erf8@@64: jmp __svml_erf8
__svml_erfcf16@@64: jmp __svml_erfcf16
__svml_erfc8@@64: jmp __svml_erfc8
__svml_erfinvf16@@64: jmp __svml_erfinvf16
__svml_erfinv8@@64: jmp __svml_erfinv8
__svml_cdfnormf16@@64: jmp __svml_cdfnormf16
__svml_cdfnorm8@@64: jmp __svml_cdfnorm8
__svml_cdfnorminvf16@@64: jmp __svml_cdfnorminvf16
__svml_cdfnorminv8@@64: jmp __svml_cdfnorminv8
__svml_cexpf16@@64: jmp __svml_cexpf16
__svml_cexp8@@64: jmp __svml_cexp8
