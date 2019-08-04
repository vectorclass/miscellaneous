# Issues with Intel C++ compiler when compiling Vector Class Library

### constexpr function problem

The Intel C++ compiler version 19 cannot compile VCL version 2.00, apparently because the 
returns from constexpr functions is not treated as sufficiently constant.  
The remedy is to use version 1.xx of VCL, or use another compiler.


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

