# from here:
#
# https://github.com/lefticus/cppbestpractices/blob/master/02-Use_the_Tools_Available.md

function(set_project_warnings project_name)

  set(MSVC_WARNINGS
      /W4 # Baseline reasonable warnings
      /w14242 # 'identifier': conversion from 'type1' to 'type1', possible loss of data
      /w14254 # 'operator': conversion from 'type1:field_bits' to 'type2:field_bits', possible loss of data
      /w14263 # 'function': member function does not override any base class virtual member function
      /w14265 # 'classname': class has virtual functions, but destructor is not virtual instances of this class may not
              # be destructed correctly
      /w14287 # 'operator': unsigned/negative constant mismatch
      /we4289 # nonstandard extension used: 'variable': loop control variable declared in the for-loop is used outside
              # the for-loop scope
      /w14296 # 'operator': expression is always 'boolean_value'
      /w14311 # 'variable': pointer truncation from 'type1' to 'type2'
      /w14545 # expression before comma evaluates to a function which is missing an argument list
      /w14546 # function call before comma missing argument list
      /w14547 # 'operator': operator before comma has no effect; expected operator with side-effect
      /w14549 # 'operator': operator before comma has no effect; did you intend 'operator'?
      /w14555 # expression has no effect; expected expression with side- effect
      /w14619 # pragma warning: there is no warning number 'number'
      /w14640 # Enable warning on thread un-safe static member initialization
      /w14826 # Conversion from 'type1' to 'type_2' is sign-extended. This may cause unexpected runtime behavior.
      /w14905 # wide string literal cast to 'LPSTR'
      /w14906 # string literal cast to 'LPWSTR'
      /w14928 # illegal copy-initialization; more than one user-defined conversion has been implicitly applied
      /permissive- # standards conformance mode for MSVC compiler.
  )

  set(GCC_WARNINGS
  -Wall
  -Wcast-align # warn for potential performance problem casts
  -Wcast-qual
  -Wconversion # warn on type conversions that may lose data
  -Wdouble-promotion # warn if float is implicit promoted to double
  -Wduplicated-branches
  -Wduplicated-cond
  -Wextra # reasonable and standard
  -Wfloat-equal
  -Wformat=2 # warn on security issues around functions that format output (ie printf)
  -Wlogical-op
  -Wmisleading-indentation
  -Wnon-virtual-dtor # warn the user if a class with virtual functions has a non-virtual destructor. This helps
  -Wnull-dereference # warn if a null dereference is detected
  -Wold-style-cast # warn for c-style casts
  -Woverloaded-virtual # warn if you overload (not override) a virtual function
  -Wpedantic # warn if non-standard C++ is used
  -Wrestrict
  -Wshadow # warn the user if a variable declaration shadows one from a parent context
  -Wsign-conversion # warn on sign conversions
  -Wunused # warn on anything being unused
  -Wuseless-cast
  )


  set(CLANG_WARNINGS
  -Wall
  -Wcast-align
  -Wcast-align
  -Wcast-qual
  -Wconversion
  -Wconversion
  -Wdouble-promotion
  -Wdouble-promotion
  -Wduplicated-cond
  -Wextra
  -Wfloat-equal
  -Wformat=2
  -Wlogical-op
  -Wnon-virtual-dtor
  -Wnon-virtual-dtor
  -Wnull-dereference
  -Wnull-dereference
  -Wold-style-cast
  -Woverloaded-virtual
  -Wpedantic
  -Wpedantic
  -Wrestrict
  -Wshadow
  -Wsign-conversion
  -Wsign-conversion
  -Wunused
  -Wunused
  -Wuseless-cast
  )

  if(MSVC)
    set(PROJECT_WARNINGS ${MSVC_WARNINGS})
  elseif(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
    set(PROJECT_WARNINGS ${CLANG_WARNINGS})
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(PROJECT_WARNINGS ${GCC_WARNINGS})
  else()
    message(AUTHOR_WARNING "No compiler warnings set for '${CMAKE_CXX_COMPILER_ID}' compiler.")
  endif()

  target_compile_options(${project_name} INTERFACE ${PROJECT_WARNINGS})

endfunction()