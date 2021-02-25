# C++ Templates

## Generic Algorithms

It's no secret that some common idioms can be useful variety of data types. This applies especially well to numeric values. Imagine a function which returns the absolute value of a number:

```c++
int abs(int i) {
	if (i < 0) {
		return (-1)*i;
	}
	return i;
}
```

If this function were to be implemented as `long`, `float`, or `double`, the only difference would be in the signature. The logic wouldn't change at all. 

In plain C, these sorts of functions are implemented using macros and defined as a family of similar-looking functions. 
```c
#define ABS_IMPL_MACRO(type, var) \
	if (var < 0) { \
		return ((type)-1)*var; \
	} \
	return var;

int abs(int i) {
	ABS_MACRO(int, i)
}
long labs(long l) {
	ABS_MACRO(long, l)
}
double fabs(double d) {
	ABS_MACRO(double, d)
}
```
This sort of idiom is uncomfortable to read and difficult to debug.

One way that C++ can make this cleaner for the end user is by using function overloads.
```c++
int abs(int) {...};
long abs(long) {...};
double abs(double) {...};
```
The C++ compiler will automatically select the version of `abs` that matches the input argument, but that still requires the library developer to create three implementations of `abs`. It would be much more convenient if the `abs` function could be _written_ generically as well...

Enter C++ Templates: templates are a way to define a function or class using a generic placeholder type. 
```c++
template <typename SomeType>
SomeType abs(SomeType val) {
	if (val < 0) {
		return ((SomeType)-1)*val;
	}
	return val;
}
```
The compiler automatically deduces the type of a call to the template and generates the appropriate machine code wherever the function is used. The type can also be explicitly specified using `<>` with the identifier. For example, `abs<short int>(-10)` will return the 16-bit integer `10`.

The C++ Standard Library makes extensive use of templates. It even provides a [set of common algorithms](https://en.cppreference.com/w/cpp/algorithm) which can be used on generic container types.

## Templated Classes
C++ also supports templated class types. This allows a library developer to specify complex types and the functions to operate on them without knowing the underlying data type ahead of time.

Here is an example of a generic fixed-width vector implemented using a template:
```c++
template <typename T>
class vec4 {
public:
	using data_type = T;
	vec4(T a, T b, T c, T d) : a(a), b(b), c(c), d(d) {};

	T a;
	T b;
	T c;
	T d;
};
```
The following template function could be used to multiply the vector by a scalar value.
```c++
template <class VecT>
VecT scale_v(typename VecT::data_type v, typename VecT::data_type scalar) {
	v.a *= scalar;
	v.b *= scalar;
	v.c *= scalar;
	v.d *= scalar;

	return v;
}
```

## Header-only Libraries

The on-demand compilation of C++ templates means that the definition and implementation of a function doesn't need to be split into separate header (`.h`) and source (`.cpp`) files. This property also means that it is possible to define entire libraries of functions exclusively in header files. 

> Some developers prefer to identify their code as a header-only C++ library using the `.hpp` file extension.

The distribution of a header-only C++ library can be much simpler than a compiled one. The library developer does not need to provide compilation and linking scripts or generate precompiled binaries for distribution. Anyone who wishes to use the library needs only to obtain the source code and use `#include "MyHeaderLibrary.h"` from their application.
