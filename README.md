# Building embedded Rust with Bazel (and proc-macros)
This is an example of how to cross compile a Rust library that depends on a procedural macro. 

## Building
```bash
# Regular desktop build (under linux)
bazel build //:lib 

# To cross compile for Cortex M3
bazel build //:lib --platforms=//toolchain:lm3s811evb
```
