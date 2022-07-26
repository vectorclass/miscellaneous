; ***************************  svml_exp_x.nasm  ***************************
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

; Trignometric and inverse trigonometric functions with 128-bit vectors

extern __svml_sinf4, __svml_sin2, __svml_cosf4, __svml_cos2  
extern __svml_sincosf4, __svml_sincos2, __svml_tanf4, __svml_tan2
extern __svml_sinpif4, __svml_sinpi2, __svml_cospif4, __svml_cospi2  
extern __svml_tanpif4, __svml_tanpi2
extern __svml_asinf4, __svml_asin2, __svml_acosf4, __svml_acos2
extern __svml_atanf4, __svml_atan2, __svml_atan2f4, __svml_atan22

global __svml_sinf4@@16, __svml_sin2@@16, __svml_cosf4@@16, __svml_cos2@@16  
global __svml_sincosf4@@16, __svml_sincos2@@16, __svml_tanf4@@16, __svml_tan2@@16
global __svml_sinpif4@@16, __svml_sinpi2@@16, __svml_cospif4@@16, __svml_cospi2@@16  
global __svml_tanpif4@@16, __svml_tanpi2@@16
global __svml_asinf4@@16, __svml_asin2@@16, __svml_acosf4@@16, __svml_acos2@@16
global __svml_atanf4@@16, __svml_atan2@@16, __svml_atan2f4@@32, __svml_atan22@@32


SECTION .text align = 8
default rel

__svml_sinf4@@16: jmp __svml_sinf4
__svml_sin2@@16: jmp __svml_sin2
__svml_cosf4@@16: jmp __svml_cosf4
__svml_cos2@@16: jmp __svml_cos2
__svml_sincosf4@@16: jmp __svml_sincosf4
__svml_sincos2@@16: jmp __svml_sincos2
__svml_tanf4@@16: jmp __svml_tanf4
__svml_tan2@@16: jmp __svml_tan2
__svml_sinpif4@@16: jmp __svml_sinpif4
__svml_sinpi2@@16: jmp __svml_sinpi2
__svml_cospif4@@16: jmp __svml_cospif4
__svml_cospi2@@16: jmp __svml_cospi2
__svml_tanpif4@@16: jmp __svml_tanpif4
__svml_tanpi2@@16: jmp __svml_tanpi2
__svml_asinf4@@16: jmp __svml_asinf4
__svml_asin2@@16: jmp __svml_asin2
__svml_acosf4@@16: jmp __svml_acosf4
__svml_acos2@@16: jmp __svml_acos2
__svml_atanf4@@16: jmp __svml_atanf4
__svml_atan2@@16: jmp __svml_atan2
__svml_atan2f4@@32: jmp __svml_atan2f4
__svml_atan22@@32: jmp __svml_atan22

