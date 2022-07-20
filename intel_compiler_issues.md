# Issues with Intel C++ compiler when compiling Vector Class Library

### Code runs slower or not at all on AMD computers  
Intel's compilers produce code that checks if it is running on an Intel CPU, and runs an inferior version of 
the code if it detects a non-Intel CPU.  
Work around: Use another compiler if the compiled code may run on a non-Intel machine.  
Documentation: <https://www.agner.org/optimize/blog/read.php?i=63>

### constexpr function problem

The Intel C++ compiler version 19 cannot compile VCL version 2.00, apparently because of 
problems with constexpr functions.  
Fixed in 2021 version.

### __vectorcall incompatible

The __vectorcall calling mode on Intel C++ compiler version 19 is incompatible with other compilers.
Example:
```cpp
Vec4f __vectorcall add_25 (__m128 x) {
    return _mm_add_ps (x, _mm_set1_ps(2.5));
}
```
The Intel compiler returns the result by a pointer, MS and Clang compilers return the result in xmm0
(__vectorcall is not currently supported on Gnu compiler )

