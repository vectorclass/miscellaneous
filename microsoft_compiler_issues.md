# Issues with Microsoft Visual Studio C++ compiler when compiling Vector Class Library

### Vector parameters not aligned  
Older versions of MS compiler cannot have vectors as function parameters.  
You get error messages like "error C2719: formal parameter with __declspec(align('16')) won't be aligned"  
The remedy is to make the parameter a const &, or use a later version of the compiler

### Cannot specify instruction set on command line  
Visual Studio version 19 cannot specify instruction sets higher than "/arch:AVX2" on the command line.  
It is still possible to code for higher instruction sets by using instrinsic functions, but there is
not check that the code matches a particular instruction set.

### Code compiled for AVX512F includes AVX512DQ instructions  
A consequence of the previous issue is that Visual Studio may issue instructions beyond AVX512F when compiling for AVX512F.  
Example:  
```cpp
#define INSTRSET 9  // AVX512F
#include "vectorclass.h"
Vec8d test (Vec8d a, Vec8d b) {
    return select (a > b && a < b+1, a, b);
}
```  
Visual Studio version 19 is issuing kmovb instructions when compiling this.  
This program will crash on a CPU with AVX512F only, because the kmovb instruction belongs to the
AVX512DQ instruction set.  
Bug report:  
https://developercommunity.visualstudio.com/content/problem/613737/can-i-use-mmask8-in-intrinsic-functions-without-av.html

The reply from Microsoft so far is not assuring (2019-08-04)

### Compiler crash on blend8 instruction with Vec8q  
Bug report:  
https://developercommunity.visualstudio.com/content/problem/676415/vx2019-compiler-crash-on-union-in-constexpr-functi.html
Work-around and future fix, see:
https://developercommunity.visualstudio.com/content/problem/676415/vx2019-compiler-crash-on-union-in-constexpr-functi.html?childToView=716149
