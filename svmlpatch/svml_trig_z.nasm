; ***************************  svml_trig_z.nasm  ***************************
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

; Trignometric and inverse trigonometric functions with 512-bit vectors

extern __svml_sinf16, __svml_sin8, __svml_cosf16, __svml_cos8  
extern __svml_sincosf16, __svml_sincos8, __svml_tanf16, __svml_tan8
extern __svml_asinf16, __svml_asin8, __svml_acosf16, __svml_acos8
extern __svml_atanf16, __svml_atan8, __svml_atan2f16, __svml_atan28

global __svml_sinf16@@64, __svml_sin8@@64, __svml_cosf16@@64, __svml_cos8@@64  
global __svml_sincosf16@@128, __svml_sincos8@@128, __svml_tanf16@@64, __svml_tan8@@64
global __svml_asinf16@@64, __svml_asin8@@64, __svml_acosf16@@64, __svml_acos8@@64
global __svml_atanf16@@64, __svml_atan8@@64, __svml_atan2f16@@128, __svml_atan28@@128


SECTION .text align = 8
default rel

__svml_sinf16@@64: jmp __svml_sinf16
__svml_sin8@@64: jmp __svml_sin8
__svml_cosf16@@64: jmp __svml_cosf16
__svml_cos8@@64: jmp __svml_cos8
__svml_sincosf16@@128: jmp __svml_sincosf16
__svml_sincos8@@128: jmp __svml_sincos8
__svml_tanf16@@64: jmp __svml_tanf16
__svml_tan8@@64: jmp __svml_tan8
__svml_asinf16@@64: jmp __svml_asinf16
__svml_asin8@@64: jmp __svml_asin8
__svml_acosf16@@64: jmp __svml_acosf16
__svml_acos8@@64: jmp __svml_acos8
__svml_atanf16@@64: jmp __svml_atanf16
__svml_atan8@@64: jmp __svml_atan8
__svml_atan2f16@@128: jmp __svml_atan2f16
__svml_atan28@@128: jmp __svml_atan28
