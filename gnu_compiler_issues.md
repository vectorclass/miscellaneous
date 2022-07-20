# Issues with Gnu C++ compiler when compiling Vector Class Library

### Warning: optimization attribute  
Warning message: optimization attribute on ‘Vec2d round(Vec2d)’ follows definition but the attribute doesn’t match [-Wattributes]"  
Work around: Use option  -Wno-attributes 
Fixed 2021
Bug tracing: <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89325>

### Bug in intrinsic header file  
Intrinsic function \_mm256_cmp_epi8_mask returns 16 bit mask, should be 32 bit.  
A fix appears to be underway.  
Work around in vectori256.h function \_mm256_cmp_epi8_mask_fix  
Bug doc: <https://patchwork.ozlabs.org/patch/940760/>

### Missing __vectorcall support  
Gcc does not support the __vectorcall calling convention in Windows, needed in vectormath_lib.h  
Work around in vectormath_lib.h: __ attribute __((sysv_abi))  
__vectorcall could speed up all non-inline vector functions in 64-bit Windows.  
Bug tracing: <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89485>

### Wrong calling convention for __m256 and __m512 returns in win64  
Gcc returns 256- and 512-bit vectors through a pointer in Win64, while all other compilers use a register.
This can cause errors when using function libraries or when different parts of a program are compiled with different compilers.  
Bug tracing: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89597

### Suboptimal broadcast of static constants  
This is not a bug, only suboptimal code.  
Bug tracing: <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=87767>  
Fixed 2021 in Gcc version 11 and 12

### Error: invalid register for .seh_savexmm   
This bug occurs when compiling for Windows.  
Work around: Compile with option  -fno-asynchronous-unwind-tables  
Bug tracing: <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65782>  
Fixed in Gcc 8 and 9, February 2020.
