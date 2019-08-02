; ***************************  svml_hyp_x.nasm  ***************************
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

; Hyperbolic and inverse hyperbolic functions with 512-bit vectors

extern __svml_sinhf16, __svml_sinh8, __svml_coshf16, __svml_cosh8, __svml_tanhf16, __svml_tanh8
extern __svml_asinhf16, __svml_asinh8, __svml_acoshf16, __svml_acosh8, __svml_atanhf16, __svml_atanh8

global __svml_sinhf16@@64, __svml_sinh8@@64, __svml_coshf16@@64, __svml_cosh8@@64, __svml_tanhf16@@64, __svml_tanh8@@64
global __svml_asinhf16@@64, __svml_asinh8@@64, __svml_acoshf16@@64, __svml_acosh8@@64, __svml_atanhf16@@64, __svml_atanh8@@64


SECTION .text align = 8
default rel

__svml_sinhf16@@64: jmp __svml_sinhf16
__svml_sinh8@@64: jmp __svml_sinh8
__svml_coshf16@@64: jmp __svml_coshf16
__svml_cosh8@@64: jmp __svml_cosh8
__svml_tanhf16@@64: jmp __svml_tanhf16
__svml_tanh8@@64: jmp __svml_tanh8
__svml_asinhf16@@64: jmp __svml_asinhf16
__svml_asinh8@@64: jmp __svml_asinh8
__svml_acoshf16@@64: jmp __svml_acoshf16
__svml_acosh8@@64: jmp __svml_acosh8
__svml_atanhf16@@64: jmp __svml_atanhf16
__svml_atanh8@@64: jmp __svml_atanh8
