; ***************************  svml_exp_x.nasm  ***************************
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

; Miscellaneous functions with 128-bit vectors

extern __svml_erff4, __svml_erf2, __svml_erfcf4, __svml_erfc2
extern __svml_erfinvf4, __svml_erfinv2
extern __svml_cdfnormf4, __svml_cdfnorm2, __svml_cdfnorminvf4, __svml_cdfnorminv2
extern __svml_cexpf4, __svml_cexp2

global __svml_erff4@@16, __svml_erf2@@16, __svml_erfcf4@@16, __svml_erfc2@@16
global __svml_erfinvf4@@16, __svml_erfinv2@@16
global __svml_cdfnormf4@@16, __svml_cdfnorm2@@16, __svml_cdfnorminvf4@@16, __svml_cdfnorminv2@@16
global __svml_cexpf4@@16, __svml_cexp2@@16


SECTION .text align = 8
default rel

__svml_erff4@@16: jmp __svml_erff4
__svml_erf2@@16: jmp __svml_erf2
__svml_erfcf4@@16: jmp __svml_erfcf4
__svml_erfc2@@16: jmp __svml_erfc2
__svml_erfinvf4@@16: jmp __svml_erfinvf4
__svml_erfinv2@@16: jmp __svml_erfinv2
__svml_cdfnormf4@@16: jmp __svml_cdfnormf4
__svml_cdfnorm2@@16: jmp __svml_cdfnorm2
__svml_cdfnorminvf4@@16: jmp __svml_cdfnorminvf4
__svml_cdfnorminv2@@16: jmp __svml_cdfnorminv2
__svml_cexpf4@@16: jmp __svml_cexpf4
__svml_cexp2@@16: jmp __svml_cexp2
