load(":cc_toolchain_config.bzl", "cc_toolchain_config")
load("@io_bazel_rules_rust//rust:toolchain.bzl", "rust_toolchain")

cc_toolchain_config(name = "arm_none_eabi_gcc_toolchain_config")

cc_toolchain(
    name = "arm_none_eabi_gcc",
    toolchain_identifier = "arm-none-eabi-gcc-toolchain",
    toolchain_config = "arm_none_eabi_gcc_toolchain_config",
    all_files = ":all_files",
    #TODO These could be more specific
    ar_files = ":all_files",
    as_files = ":all_files",
    compiler_files = ":all_files",
    dwp_files = ":all_files",
    linker_files = ":all_files",
    objcopy_files = ":all_files",
    strip_files = ":all_files",
)

toolchain(
    name = "arm_none_eabi_gcc_toolchain",
    exec_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:none",
        "@platforms//cpu:armv7",
    ],
    toolchain = ":arm_none_eabi_gcc",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    visibility = ["//visibility:public"],
)

filegroup(
    name = "all_files",
    srcs = [
        "@arm_none_eabi//:all_files",
        ":tools",
    ],
)

filegroup(
    name = "tools",
    srcs = glob(["tools/*.sh"]),
)

rust_toolchain(
    name = "rust_arm_none_eabi",
    rustc = "@rustc_x86_64_unknown_linux_gnu//:rustc",
    rustc_lib = "@rustc_x86_64_unknown_linux_gnu//:rustc_lib",
    rust_lib = ":rust_lib_arm_none_eabi",
    rust_doc = "@rustc_x86_64_unknown_linux_gnu//:rustdoc",
    staticlib_ext = ".a",
    dylib_ext = ".so",
    os = "linux",
    default_edition = "2015",
    exec_triple = "x86_64-unknown-linux-gnu",
    target_triple = "thumbv7m-none-eabi",
)

filegroup(
    name = "rust_lib_arm_none_eabi",
    srcs = [
        "@rust_std_thumbv7m_none_eabi//:rust_lib",   
    ],
)

toolchain(
    name = "arm_none_eabi_rust_toolchain",
    exec_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:none",
        "@platforms//cpu:armv7",
    ],
    toolchain = ":rust_arm_none_eabi",
    toolchain_type = "@io_bazel_rules_rust//rust:toolchain",
    visibility = ["//visibility:public"],
)

rust_toolchain(
    name = "rust_x86_64_linux_gnu",
    rustc = "@rustc_x86_64_unknown_linux_gnu//:rustc",
    rustc_lib = "@rustc_x86_64_unknown_linux_gnu//:rustc_lib",
    rust_lib = ":rust_lib_x86_64_linux_gnu",
    rust_doc = "@rustc_x86_64_unknown_linux_gnu//:rustdoc",
    staticlib_ext = ".a",
    dylib_ext = ".so",
    os = "linux",
    default_edition = "2015",
    exec_triple = "x86_64-unknown-linux-gnu",
    target_triple = "x86_64-unknown-linux-gnu",
)

filegroup(
    name = "rust_lib_x86_64_linux_gnu",
    srcs = [
        "@rust_std_x86_64_unknown_linux_gnu//:rust_lib",   
    ],
)

toolchain(
    name = "x86_64_linux_gnu_rust_toolchain",
    exec_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    toolchain = ":rust_x86_64_linux_gnu",
    toolchain_type = "@io_bazel_rules_rust//rust:toolchain",
    visibility = ["//visibility:public"],
)

platform(
    name = "lm3s811evb",
    constraint_values = [
        "@platforms//os:none",
        "@platforms//cpu:armv7",
        ":device_lm3s811evb",
    ],
)

constraint_setting(name = "device")
constraint_value(	
    name = "device_lm3s811evb",
    constraint_setting = "device",
)

