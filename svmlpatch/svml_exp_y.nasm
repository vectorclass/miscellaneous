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

extern __svml_expf8, __svml_exp4, __svml_expm1f8, __svml_expm14
extern __svml_exp2f8, __svml_exp24, __svml_exp10f8, __svml_exp104 
extern __svml_powf8, __svml_pow4
extern __svml_cbrtf8, __svml_cbrt4, __svml_invsqrtf8, __svml_invsqrt4
extern __svml_logf8, __svml_log4, __svml_log1pf8, __svml_log1p4
extern __svml_log2f8 , __svml_log24, __svml_log10f8, __svml_log104 

global __svml_expf8@@32, __svml_exp4@@32, __svml_expm1f8@@32, __svml_expm14@@32
global __svml_exp2f8@@32, __svml_exp24@@32, __svml_exp10f8@@32, __svml_exp104@@32 
global __svml_powf8@@64, __svml_pow4@@64
global __svml_cbrtf8@@32, __svml_cbrt4@@32, __svml_invsqrtf8@@32, __svml_invsqrt4@@32
global __svml_logf8@@32, __svml_log4@@32, __svml_log1pf8@@32, __svml_log1p4@@32
global __svml_log2f8@@32 , __svml_log24@@32, __svml_log10f8@@32, __svml_log104@@32


SECTION .text align = 8
default rel

__svml_expf8@@32: jmp __svml_expf8
__svml_exp4@@32: jmp __svml_exp4
__svml_expm1f8@@32: jmp __svml_expm1f8
__svml_expm14@@32: jmp __svml_expm14
__svml_exp2f8@@32: jmp __svml_exp2f8
__svml_exp24@@32: jmp __svml_exp24
__svml_exp10f8@@32: jmp __svml_exp10f8
__svml_exp104@@32: jmp  __svml_exp104
__svml_powf8@@64: jmp __svml_powf8
__svml_pow4@@64: jmp __svml_pow4
__svml_cbrtf8@@32: jmp __svml_cbrtf8
__svml_cbrt4@@32: jmp __svml_cbrt4
__svml_invsqrtf8@@32: jmp __svml_invsqrtf8
__svml_invsqrt4@@32: jmp __svml_invsqrt4
__svml_logf8@@32: jmp __svml_logf8
__svml_log4@@32: jmp __svml_log4
__svml_log1pf8@@32: jmp __svml_log1pf8
__svml_log1p4@@32: jmp __svml_log1p4
__svml_log2f8@@32: jmp __svml_log2f8
__svml_log24@@32: jmp __svml_log24
__svml_log10f8@@32: jmp __svml_log10f8
__svml_log104@@32: jmp __svml_log104
