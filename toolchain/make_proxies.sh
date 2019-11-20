#!/bin/bash

# Creates the proxies necessary for using the toolchain.

for tool in ar cpp gcc gcov ld nm objdump objcopy strip; do
    echo "#!/bin/sh" > toolchain/tools/$tool.sh
    echo "external/arm_none_eabi/bin/arm-none-eabi-$tool \$@" >> toolchain/tools/$tool.sh
    chmod +x toolchain/tools/$tool.sh
done
