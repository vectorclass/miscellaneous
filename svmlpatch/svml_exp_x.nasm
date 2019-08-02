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

; Exponential, power, and log functions with 128-bit vectors

extern __svml_expf4, __svml_exp2, __svml_expm1f4, __svml_expm12
extern __svml_exp2f4, __svml_exp22, __svml_exp10f4, __svml_exp102 
extern __svml_powf4, __svml_pow2
extern __svml_cbrtf4, __svml_cbrt2, __svml_invsqrtf4, __svml_invsqrt2
extern __svml_logf4, __svml_log2, __svml_log1pf4, __svml_log1p2
extern __svml_log2f4 , __svml_log22, __svml_log10f4, __svml_log102 

global __svml_expf4@@16, __svml_exp2@@16, __svml_expm1f4@@16, __svml_expm12@@16
global __svml_exp2f4@@16, __svml_exp22@@16, __svml_exp10f4@@16, __svml_exp102@@16 
global __svml_powf4@@32, __svml_pow2@@32
global __svml_cbrtf4@@16, __svml_cbrt2@@16, __svml_invsqrtf4@@16, __svml_invsqrt2@@16
global __svml_logf4@@16, __svml_log2@@16, __svml_log1pf4@@16, __svml_log1p2@@16
global __svml_log2f4@@16 , __svml_log22@@16, __svml_log10f4@@16, __svml_log102@@16


SECTION .text align = 8
default rel

__svml_expf4@@16: jmp __svml_expf4
__svml_exp2@@16: jmp __svml_exp2
__svml_expm1f4@@16: jmp __svml_expm1f4
__svml_expm12@@16: jmp __svml_expm12
__svml_exp2f4@@16: jmp __svml_exp2f4
__svml_exp22@@16: jmp __svml_exp22
__svml_exp10f4@@16: jmp __svml_exp10f4
__svml_exp102@@16: jmp  __svml_exp102
__svml_powf4@@32: jmp __svml_powf4
__svml_pow2@@32: jmp __svml_pow2
__svml_cbrtf4@@16: jmp __svml_cbrtf4
__svml_cbrt2@@16: jmp __svml_cbrt2
__svml_invsqrtf4@@16: jmp __svml_invsqrtf4
__svml_invsqrt2@@16: jmp __svml_invsqrt2
__svml_logf4@@16: jmp __svml_logf4
__svml_log2@@16: jmp __svml_log2
__svml_log1pf4@@16: jmp __svml_log1pf4
__svml_log1p2@@16: jmp __svml_log1p2
__svml_log2f4@@16: jmp __svml_log2f4
__svml_log22@@16: jmp __svml_log22
__svml_log10f4@@16: jmp __svml_log10f4
__svml_log102@@16: jmp __svml_log102
