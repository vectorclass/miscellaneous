# Issues with Clang C++ compiler when compiling Vector Class Library

### intrinsic vector types not distinguished  
The Clang compiler treats the intrinsic vector types __m128, __m128i, and __m128d as identical,
where all other compilers treat them as different, in accordance with Intel manuals.
I have reported this problem in 2013 but it is still not fixed in july 2019.
A fix may be underway.  
Work around in instrset.h: #define FIX_CLANG_VECTOR_ALIAS_AMBIGUITY  
Bug tracing: <https://bugs.llvm.org/show_bug.cgi?id=17164>

### Mask registers in inline assembly  
The compiler sometimes puts mask registers in inline assembly where a general purpose register is required.  
Work around in instrset.h: bit_scan_forward function given __ attribute __((noinline))  
Bug tracing: <https://bugs.llvm.org/show_bug.cgi?id=42883>

### Compiler crash on Vector3d rotate function with AVX instruction set  
Bug tracing: <https://bugs.llvm.org/show_bug.cgi?id=42898>

### Cygwin clang crashes on long double mathematical functions  
The cygwin64 version of clang causes crash on long double mathematical functions such as sqrtl, powl, etc.  
Reported to Cygwin mailing list 2019-05-10

### Cygwin clang cannot compile template with 64 parameters  
The cygwin64 version of clang has problems compiling the permute64 function  
Reported to Cygwin mailing list 2019-08-05

### Suboptimal use of 64-bit absolute addresses in Cygwin Clang  
This is not a bug, but suboptimal code.  
Reported to Cygwin mailing list 2019-08-06

