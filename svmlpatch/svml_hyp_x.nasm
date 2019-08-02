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

; Hyperbolic and inverse hyperbolic functions with 128-bit vectors

extern __svml_sinhf4, __svml_sinh2, __svml_coshf4, __svml_cosh2, __svml_tanhf4, __svml_tanh2
extern __svml_asinhf4, __svml_asinh2, __svml_acoshf4, __svml_acosh2, __svml_atanhf4, __svml_atanh2

global __svml_sinhf4@@16, __svml_sinh2@@16, __svml_coshf4@@16, __svml_cosh2@@16, __svml_tanhf4@@16, __svml_tanh2@@16
global  __svml_asinhf4@@16, __svml_asinh2@@16, __svml_acoshf4@@16, __svml_acosh2@@16, __svml_atanhf4@@16, __svml_atanh2@@16


SECTION .text align = 8
default rel

__svml_sinhf4@@16: jmp __svml_sinhf4
__svml_sinh2@@16: jmp __svml_sinh2
__svml_coshf4@@16: jmp __svml_coshf4
__svml_cosh2@@16: jmp __svml_cosh2
__svml_tanhf4@@16: jmp __svml_tanhf4
__svml_tanh2@@16: jmp __svml_tanh2
__svml_asinhf4@@16: jmp __svml_asinhf4
__svml_asinh2@@16: jmp __svml_asinh2
__svml_acoshf4@@16: jmp __svml_acoshf4
__svml_acosh2@@16: jmp __svml_acosh2
__svml_atanhf4@@16: jmp __svml_atanhf4
__svml_atanh2@@16: jmp __svml_atanh2
