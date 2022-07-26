; ***************************  svml_trig_y.nasm  ***************************
; Author:        Agner Fog
; Date created:  2019-07-03
; Last modified: 2022-07-23
; Version:       2.02
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
; (c) Copyright 2019-2022 Apache licence 2.0
;******************************************************************************

; Trignometric and inverse trigonometric functions with 256-bit vectors

extern __svml_sinf8, __svml_sin4, __svml_cosf8, __svml_cos4  
extern __svml_sincosf8, __svml_sincos4, __svml_tanf8, __svml_tan4
extern __svml_sinpif8, __svml_sinpi4, __svml_cospif8, __svml_cospi4  
extern __svml_tanpif8, __svml_tanpi4
extern __svml_asinf8, __svml_asin4, __svml_acosf8, __svml_acos4
extern __svml_atanf8, __svml_atan4, __svml_atan2f8, __svml_atan24

global __svml_sinf8@@32, __svml_sin4@@32, __svml_cosf8@@32, __svml_cos4@@32  
global __svml_sincosf8@@32, __svml_sincos4@@32, __svml_tanf8@@32, __svml_tan4@@32
global __svml_sinpif8@@32, __svml_sinpi4@@32, __svml_cospif8@@32, __svml_cospi4@@32  
global __svml_tanpif8@@32, __svml_tanpi4@@32
global __svml_asinf8@@32, __svml_asin4@@32, __svml_acosf8@@32, __svml_acos4@@32
global __svml_atanf8@@32, __svml_atan4@@32, __svml_atan2f8@@64, __svml_atan24@@64


SECTION .text align = 8
default rel

__svml_sinf8@@32: jmp __svml_sinf8
__svml_sin4@@32: jmp __svml_sin4
__svml_cosf8@@32: jmp __svml_cosf8
__svml_cos4@@32: jmp __svml_cos4
__svml_sincosf8@@32: jmp __svml_sincosf8
__svml_sincos4@@32: jmp __svml_sincos4
__svml_tanf8@@32: jmp __svml_tanf8
__svml_tan4@@32: jmp __svml_tan4
__svml_sinpif8@@32: jmp __svml_sinpif8
__svml_sinpi4@@32: jmp __svml_sinpi4
__svml_cospif8@@32: jmp __svml_cospif8
__svml_cospi4@@32: jmp __svml_cospi4
__svml_tanpif8@@32: jmp __svml_tanpif8
__svml_tanpi4@@32: jmp __svml_tanpi4
__svml_asinf8@@32: jmp __svml_asinf8
__svml_asin4@@32: jmp __svml_asin4
__svml_acosf8@@32: jmp __svml_acosf8
__svml_acos4@@32: jmp __svml_acos4
__svml_atanf8@@32: jmp __svml_atanf8
__svml_atan4@@32: jmp __svml_atan4
__svml_atan2f8@@64: jmp __svml_atan2f8
__svml_atan24@@64: jmp __svml_atan24
