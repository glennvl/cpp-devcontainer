cmake_minimum_required(VERSION 4.2 FATAL_ERROR)

# workaround clang bug
set(CMAKE_CXX_STDLIB_MODULES_JSON "/usr/lib/llvm-21/lib/libc++.modules.json")

set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD "d0edc3af-4c50-42ea-a356-e2862fe7a444")
set(CMAKE_CXX_MODULE_STD ON)
set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

project(TestCppDevcontainer LANGUAGES CXX)

add_executable(hello_world)
target_sources(hello_world PRIVATE "main.cpp")
