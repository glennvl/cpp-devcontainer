# C++ Devcontainer

## Devcontainer

Basic C and C++ devcontainer with cmake, compiler warnings, clang-tidy and clang-format.

## Installed tools

* ccache
* clang
* clang-tidy
* clang-format
* cmake
* cppcheck
* lldb
* vcpkg

## Usage

```json
// devcontainer.json

{
    "name": "C++ Devcontainer",
    "image": "dhglennvl/cpp-devcontainer:latest",
    "capAdd": [ "SYS_PTRACE" ],
    "securityOpt": [ "seccomp=unconfined" ],
    "remoteUser": "user"
}
```
