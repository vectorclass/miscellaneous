; ***************************  svml_misc_y.nasm  ***************************
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

; Miscellaneous functions with 256-bit vectors

extern __svml_erff8, __svml_erf4, __svml_erfcf8, __svml_erfc4
extern __svml_erfinvf8, __svml_erfinv4
extern __svml_cdfnormf8, __svml_cdfnorm4, __svml_cdfnorminvf8, __svml_cdfnorminv4
extern __svml_cexpf8, __svml_cexp4

global __svml_erff8@@32, __svml_erf4@@32, __svml_erfcf8@@32, __svml_erfc4@@32
global __svml_erfinvf8@@32, __svml_erfinv4@@32
global __svml_cdfnormf8@@32, __svml_cdfnorm4@@32, __svml_cdfnorminvf8@@32, __svml_cdfnorminv4@@32
global __svml_cexpf8@@32, __svml_cexp2@@32


SECTION .text align = 8
default rel

__svml_erff8@@32: jmp __svml_erff8
__svml_erf4@@32: jmp __svml_erf4
__svml_erfcf8@@32: jmp __svml_erfcf8
__svml_erfc4@@32: jmp __svml_erfc4
__svml_erfinvf8@@32: jmp __svml_erfinvf8
__svml_erfinv4@@32: jmp __svml_erfinv4
__svml_cdfnormf8@@32: jmp __svml_cdfnormf8
__svml_cdfnorm4@@32: jmp __svml_cdfnorm4
__svml_cdfnorminvf8@@32: jmp __svml_cdfnorminvf8
__svml_cdfnorminv4@@32: jmp __svml_cdfnorminv4
__svml_cexpf8@@32: jmp __svml_cexpf8
__svml_cexp4@@32: jmp __svml_cexp4
