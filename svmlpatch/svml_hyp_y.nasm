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

; Hyperbolic and inverse hyperbolic functions with 256-bit vectors

extern __svml_sinhf8, __svml_sinh4, __svml_coshf8, __svml_cosh4, __svml_tanhf8, __svml_tanh4
extern __svml_asinhf8, __svml_asinh4, __svml_acoshf8, __svml_acosh4, __svml_atanhf8, __svml_atanh4

global __svml_sinhf8@@32, __svml_sinh4@@32, __svml_coshf8@@32, __svml_cosh4@@32, __svml_tanhf8@@32, __svml_tanh4@@32
global  __svml_asinhf8@@32, __svml_asinh4@@32, __svml_acoshf8@@32, __svml_acosh4@@32, __svml_atanhf8@@32, __svml_atanh4@@32


SECTION .text align = 8
default rel

__svml_sinhf8@@32: jmp __svml_sinhf8
__svml_sinh4@@32: jmp __svml_sinh4
__svml_coshf8@@32: jmp __svml_coshf8
__svml_cosh4@@32: jmp __svml_cosh4
__svml_tanhf8@@32: jmp __svml_tanhf8
__svml_tanh4@@32: jmp __svml_tanh4
__svml_asinhf8@@32: jmp __svml_asinhf8
__svml_asinh4@@32: jmp __svml_asinh4
__svml_acoshf8@@32: jmp __svml_acoshf8
__svml_acosh4@@32: jmp __svml_acosh4
__svml_atanhf8@@32: jmp __svml_atanhf8
__svml_atanh4@@32: jmp __svml_atanh4
