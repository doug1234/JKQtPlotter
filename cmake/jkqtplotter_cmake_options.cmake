if(NOT DEFINED BUILD_SHARED_LIBS)
    option(BUILD_SHARED_LIBS "Build as shared library" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_INCLUDE_XITS_FONTS)
    option(JKQtPlotter_BUILD_INCLUDE_XITS_FONTS "Include XITS fonts (SIL OPEN FONT LICENSE Version 1.1) as resources in library" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_INCLUDE_FIRAMATH_FONTS)
    option(JKQtPlotter_BUILD_INCLUDE_FIRAMATH_FONTS "Include Fira Math fonts (SIL OPEN FONT LICENSE Version 1.1) as resources in library" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_DECORATE_LIBNAMES_WITH_BUILDTYPE)
    option(JKQtPlotter_BUILD_DECORATE_LIBNAMES_WITH_BUILDTYPE "If set, the build-type (debug/release/...) is appended to the library name" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_EXAMPLES)
    option(JKQtPlotter_BUILD_EXAMPLES "Build the examples" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_LIB_JKQTMATH)
    option(JKQtPlotter_BUILD_LIB_JKQTMATH "Build the sub-library JKQTMath" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_LIB_JKQTMATHTEXT)
    option(JKQtPlotter_BUILD_LIB_JKQTMATHTEXT "Build the sub-library JKQTMathText" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_LIB_JKQTFASTPLOTTER)
    option(JKQtPlotter_BUILD_LIB_JKQTFASTPLOTTER "Build the sub-library JKQTFastPlotter" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_LIB_JKQTPLOTTER)
    option(JKQtPlotter_BUILD_LIB_JKQTPLOTTER "Build the sub-library JKQTPlotter" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_TOOLS)
    option(JKQtPlotter_BUILD_TOOLS "Build the tools" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_TESTS)
    option(JKQtPlotter_BUILD_TESTS "Build the unit tests" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_FORCE_NO_PRINTER_SUPPORT)
    option(JKQtPlotter_BUILD_FORCE_NO_PRINTER_SUPPORT "Build the library with printer support switched off, even if it is available" OFF)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_WITH_PRECOMPILED_HEADERS)
    option(JKQtPlotter_BUILD_WITH_PRECOMPILED_HEADERS "Build the library using precompiled headers to improve compile speed" ON)
endif()
if(NOT DEFINED JKQtPlotter_BUILD_WITH_TIMING_INFO_OUTPUT)
    option(JKQtPlotter_BUILD_WITH_TIMING_INFO_OUTPUT "Build the library to output extra timing information using Debug()" OFF)
endif()
if(NOT DEFINED JKQtPlotter_ENABLED_CXX20)
    option(JKQtPlotter_ENABLED_CXX20 "Build the library using C++20" OFF)
endif()
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
    option(CMAKE_INSTALL_PREFIX "Install directory" ${CMAKE_CURRENT_SOURCE_DIR}/install)
endif()

set(jkqtplotter_default_build_type "Debug")
get_property(JKQtPlotter_isMultiConfigGenerator GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT JKQtPlotter_isMultiConfigGenerator)
  if(NOT CMAKE_BUILD_TYPE)
      warning(STATUS "Setting build type to '${jkqtplotter_default_build_type}' as none was specified.")
    set(CMAKE_BUILD_TYPE ${jkqtplotter_default_build_type} CACHE STRING "Choose the type of build." FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
  endif()
endif()


include(GNUInstallDirs)

#evaluate the settings above
if (NOT CMAKE_INSTALL_LIBDIR)
    set(CMAKE_INSTALL_LIBDIR "lib")
endif()

if (NOT CMAKE_INSTALL_BINDIR)
    set(CMAKE_INSTALL_BINDIR "bin")
endif()

if (NOT CMAKE_INSTALL_INCLUDEDIR)
    set(CMAKE_INSTALL_INCLUDEDIR "include")
endif()

# place all DLLs and EXEs in the subdirectory output of the top level directory of the build tree
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/output)
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/output)


if(JKQtPlotter_BUILD_DECORATE_LIBNAMES_WITH_BUILDTYPE)
    set(JKQtPlotter_LIBNAME_ADDITION "_$<CONFIG>")
else()
    set(JKQtPlotter_LIBNAME_ADDITION )
endif()

if (JKQtPlotter_BUILD_FORCE_NO_PRINTER_SUPPORT)
    set(JKQtPlotter_BUILD_WITH_PRINTER_SUPPORT "OFF")
else()
    set(JKQtPlotter_BUILD_WITH_PRINTER_SUPPORT "ON")
endif()

if(JKQtPlotter_BUILD_LIB_JKQTPLOTTER)
    set(JKQtPlotter_BUILD_LIB_JKQTMATH "ON")
    set(JKQtPlotter_BUILD_LIB_JKQTMATHTEXT "ON")
endif()

