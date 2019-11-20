load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
     "feature",
     "flag_group",
     "flag_set",
     "tool_path")
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")

def _impl(ctx):
    tools = ["ar", "cpp", "gcc", "gcov", "ld", "nm", "objdump", "objcopy", "strip"]
    tool_paths = [tool_path(name = tool, path = "tools/{}.sh".format(tool)) for tool in tools]
    compiler_flags_feature = feature(
        name = "compiler_flags_feature",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_module_compile,
                    ACTION_NAMES.cpp_module_codegen,
                    ACTION_NAMES.lto_backend,
                    ACTION_NAMES.clif_match,
                ],
                flag_groups = [
                    flag_group([
                        "-Wall",
                        "-Werror",
                        "-O2", 
                        "-nostdlib", 
                        "-nostartfiles", 
                        "-ffreestanding", 
                        "-mcpu=cortex-m3", 
                        "-mthumb",
                        # Assembler options
                        "-Wa,--warn",
                        "-Wa,--fatal-warnings", 
                    ]),
                ],
            ),
        ],
    )
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "arm-none-eabi-gcc",
        host_system_name = "x86_64-unknown-linux-gnu",
        target_system_name = "arm-none-eabi",
        target_cpu = "armv7",
        target_libc = "unknown",
        compiler = "gcc",
        abi_version = "eabi",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
        features = [compiler_flags_feature],
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
