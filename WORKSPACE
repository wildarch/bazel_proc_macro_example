load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "platforms",
    urls = ["https://github.com/bazelbuild/platforms/archive/43155b81d40765f0d13008bc77cd2cca8ba9fb2a.zip"],
    sha256 = "f148e251136c57f14226652194518a2babd53e5660063c84c75f78167408d27c",
    strip_prefix = "platforms-43155b81d40765f0d13008bc77cd2cca8ba9fb2a",
)

http_archive(
    name = "arm_none_eabi",
    urls = ["https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/8-2019q3/RC1.1/gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2"],
    sha256 = "b50b02b0a16e5aad8620e9d7c31110ef285c1dde28980b1a9448b764d77d8f92",
    strip_prefix = "gcc-arm-none-eabi-8-2019-q3-update",
    build_file_content = """
package(default_visibility = ['//visibility:public'])

filegroup(
    name = "all_files",
    srcs = glob([
        "arm-none-eabi/**", 
        "bin/arm-none-eabi-*",
        "lib/gcc/arm-none-eabi/**",
        "share/gcc-arm-none-eabi/**",
    ]),
)

filegroup(
    name = "linker_files",
    srcs = glob([
        "arm-none-eabi/lib/**",
        "lib/gcc/arm-none-eabi/**",
    ]),
)

filegroup(
    name = "objcopy",
    srcs = ["bin/arm-none-eabi-objcopy"],
)

filegroup(
    name = "ld",
    srcs = ["bin/arm-none-eabi-ld"],
)

cc_library(
    name = "libm",
    srcs = ["arm-none-eabi/lib/libm.a"],
)
    """,
)

register_toolchains("//toolchain:arm_none_eabi_gcc_toolchain")

http_archive(
    name = "io_bazel_rules_rust",
    sha256 = "9f38c5fbf37b0dc445fe54558e14ac000cca0be6907251c6df21ba236acd59a8",
    strip_prefix = "rules_rust-ec436b5ff2ab1ddeba6f27a7a1a5d263812981a6",
    urls = [
        # Master branch as of 2019-10-07
        "https://github.com/bazelbuild/rules_rust/archive/ec436b5ff2ab1ddeba6f27a7a1a5d263812981a6.zip",
    ],
)

http_archive(
    name = "bazel_skylib",
    sha256 = "9a737999532daca978a158f94e77e9af6a6a169709c0cee274f0a4c3359519bd",
    strip_prefix = "bazel-skylib-1.0.0",
    url = "https://github.com/bazelbuild/bazel-skylib/archive/1.0.0.tar.gz",
)

load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")
bazel_version(name = "bazel_version")

http_archive(
    name = "rustc_x86_64_unknown_linux_gnu",
    url = "https://static.rust-lang.org/dist/rustc-1.38.0-x86_64-unknown-linux-gnu.tar.gz",
    sha256 = "790a611695fabd12c3a141efa58b3dc5913d749947c1a95d3f5b6eb5476ee612",
    strip_prefix = "rustc-1.38.0-x86_64-unknown-linux-gnu/rustc",
    build_file_content = """
package(default_visibility = ['//visibility:public'])

filegroup(
    name = "rustc",
    srcs = ["bin/rustc"],
)

filegroup(
    name = "rustdoc",
    srcs = ["bin/rustdoc"],
)

filegroup(
    name = "rustc_lib",
    srcs = glob(["lib/*.so"]),
)
    """,
)

http_archive(
    name = "rust_std_thumbv7m_none_eabi",
    url = "https://static.rust-lang.org/dist/rust-std-1.38.0-thumbv7m-none-eabi.tar.gz",
    sha256 = "36f31d9bfc823b26082faca201b100100a01e6f2f2d0e2d15ef0bce416a0164e",
    strip_prefix = "rust-std-1.38.0-thumbv7m-none-eabi/rust-std-thumbv7m-none-eabi",
    build_file_content = """
package(default_visibility = ['//visibility:public'])

filegroup(
    name = "rust_lib",
    srcs = glob([
        "lib/rustlib/thumbv7m-none-eabi/lib/*.rlib",
    ]),
)
    """,
)

http_archive(
    name = "rust_std_x86_64_unknown_linux_gnu",
    url = "https://static.rust-lang.org/dist/rust-std-1.38.0-x86_64-unknown-linux-gnu.tar.gz",
    sha256 = "cd50ec3384d79aae89ffdacf09715b68b1b5562657e993f26f67b9458e92dfdd",
    strip_prefix = "rust-std-1.38.0-x86_64-unknown-linux-gnu/rust-std-x86_64-unknown-linux-gnu",
    build_file_content = """
package(default_visibility = ['//visibility:public'])

filegroup(
    name = "rust_lib",
    srcs = glob([
        "lib/rustlib/x86_64-unknown-linux-gnu/lib/*.rlib",
        "lib/rustlib/x86_64-unknown-linux-gnu/lib/*.so",
    ]),
)
    """,
)

register_toolchains("//toolchain:arm_none_eabi_rust_toolchain")
register_toolchains("//toolchain:x86_64_linux_gnu_rust_toolchain")

load("//cargo:crates.bzl", "raze_fetch_remote_crates")

raze_fetch_remote_crates()
