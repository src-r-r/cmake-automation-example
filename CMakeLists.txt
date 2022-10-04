cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(GCC_COMPILE_FLAGS "-std=gnu++2a")

Include(FetchContent)

project(
  cmake_autobuild
  VERSION 1.0.0
  LANGUAGES CXX
)

if(NOT DEFINED CATCH2_VERSION)
    set(CATCH2_VERSION
        v3.0.1
        CACHE
        STRING "Version of Catch2 (https://github.com/catchorg/Catch2) used for unit testing."
    )
endif()


FetchContent_Declare(
  Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG        ${CATCH2_VERSION} # or a later release
)

FetchContent_MakeAvailable(
    Catch2
)

set(
    SRC_DIR
    ${CMAKE_SOURCE_DIR}/src
)

add_library(
    hello
    ${SRC_DIR}/hello.cpp
)

add_executable(tests
               ${SRC_DIR}/test_hello.cpp
)
target_link_libraries(tests
    PRIVATE
        hello
        Catch2::Catch2WithMain
)