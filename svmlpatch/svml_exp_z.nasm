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

; Exponential, power, and log functions with 256-bit vectors

extern __svml_expf16, __svml_exp8, __svml_expm1f16, __svml_expm18
extern __svml_exp2f16, __svml_exp28, __svml_exp10f16, __svml_exp108 
extern __svml_powf16, __svml_pow8
extern __svml_cbrtf16, __svml_cbrt8, __svml_invsqrtf16, __svml_invsqrt8
extern __svml_logf16, __svml_log8, __svml_log1pf16, __svml_log1p8
extern __svml_log2f16 , __svml_log28, __svml_log10f16, __svml_log108 

global __svml_expf16@@64, __svml_exp8@@64, __svml_expm1f16@@64, __svml_expm18@@64
global __svml_exp2f16@@64, __svml_exp28@@64, __svml_exp10f16@@64, __svml_exp108@@64 
global __svml_powf16@@128, __svml_pow8@@128
global __svml_cbrtf16@@64, __svml_cbrt8@@64, __svml_invsqrtf16@@64, __svml_invsqrt8@@64
global __svml_logf16@@64, __svml_log8@@64, __svml_log1pf16@@64, __svml_log1p8@@64
global __svml_log2f16@@64 , __svml_log28@@64, __svml_log10f16@@64, __svml_log108@@64


SECTION .text align = 8
default rel

__svml_expf16@@64: jmp __svml_expf16
__svml_exp8@@64: jmp __svml_exp8
__svml_expm1f16@@64: jmp __svml_expm1f16
__svml_expm18@@64: jmp __svml_expm18
__svml_exp2f16@@64: jmp __svml_exp2f16
__svml_exp28@@64: jmp __svml_exp28
__svml_exp10f16@@64: jmp __svml_exp10f16
__svml_exp108@@64: jmp  __svml_exp108
__svml_powf16@@128: jmp __svml_powf16
__svml_pow8@@128: jmp __svml_pow8
__svml_cbrtf16@@64: jmp __svml_cbrtf16
__svml_cbrt8@@64: jmp __svml_cbrt8
__svml_invsqrtf16@@64: jmp __svml_invsqrtf16
__svml_invsqrt8@@64: jmp __svml_invsqrt8
__svml_logf16@@64: jmp __svml_logf16
__svml_log8@@64: jmp __svml_log8
__svml_log1pf16@@64: jmp __svml_log1pf16
__svml_log1p8@@64: jmp __svml_log1p8
__svml_log2f16@@64: jmp __svml_log2f16
__svml_log28@@64: jmp __svml_log28
__svml_log10f16@@64: jmp __svml_log10f16
__svml_log108@@64: jmp __svml_log108
