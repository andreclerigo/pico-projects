# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.19

# compile ASM with C:/Program Files (x86)/GNU Arm Embedded Toolchain/10 2020-q4-major/bin/arm-none-eabi-gcc.exe
# compile C with C:/Program Files (x86)/GNU Arm Embedded Toolchain/10 2020-q4-major/bin/arm-none-eabi-gcc.exe
# compile CXX with C:/Program Files (x86)/GNU Arm Embedded Toolchain/10 2020-q4-major/bin/arm-none-eabi-g++.exe
ASM_DEFINES = -DCFG_TUSB_DEBUG=1 -DCFG_TUSB_MCU=OPT_MCU_RP2040 -DCFG_TUSB_OS=OPT_OS_PICO -DPICO_BIT_OPS_PICO=1 -DPICO_BOARD=\"pico\" -DPICO_BUILD=1 -DPICO_CMAKE_BUILD_TYPE=\"Debug\" -DPICO_COPY_TO_RAM=0 -DPICO_CXX_ENABLE_EXCEPTIONS=0 -DPICO_DIVIDER_HARDWARE=1 -DPICO_DOUBLE_PICO=1 -DPICO_FLOAT_PICO=1 -DPICO_INT64_OPS_PICO=1 -DPICO_MEM_OPS_PICO=1 -DPICO_MULTICORE=1 -DPICO_NO_FLASH=0 -DPICO_NO_HARDWARE=0 -DPICO_ON_DEVICE=1 -DPICO_PRINTF_PICO=1 -DPICO_STDIO_USB=1 -DPICO_TARGET_NAME=\"temp_7seg\" -DPICO_USE_BLOCKED_RAM=0

ASM_INCLUDES = -ID:\Downloads\pico-sdk\src\common\pico_stdlib\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_gpio\include -ID:\Downloads\pico-sdk\src\common\pico_base\include -IC:\Users\AndreClerigo\Desktop\Maker\Pico\Projects\temp_7seg\build\generated\pico_base -ID:\Downloads\pico-sdk\src\boards\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_platform\include -ID:\Downloads\pico-sdk\src\rp2040\hardware_regs\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_base\include -ID:\Downloads\pico-sdk\src\rp2040\hardware_structs\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_claim\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_sync\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_uart\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_divider\include -ID:\Downloads\pico-sdk\src\common\pico_time\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_timer\include -ID:\Downloads\pico-sdk\src\common\pico_sync\include -ID:\Downloads\pico-sdk\src\common\pico_util\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_runtime\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_clocks\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_resets\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_watchdog\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_xosc\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_pll\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_vreg\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_irq\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_printf\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_bootrom\include -ID:\Downloads\pico-sdk\src\common\pico_bit_ops\include -ID:\Downloads\pico-sdk\src\common\pico_divider\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_double\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_int64_ops\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_float\include -ID:\Downloads\pico-sdk\src\common\pico_binary_info\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_stdio\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_stdio_usb\include -ID:\Downloads\pico-sdk\lib\tinyusb\src -ID:\Downloads\pico-sdk\lib\tinyusb\src\common -ID:\Downloads\pico-sdk\lib\tinyusb\hw -ID:\Downloads\pico-sdk\src\rp2_common\pico_fix\rp2040_usb_device_enumeration\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_adc\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_multicore\include

ASM_FLAGS = -march=armv6-m -mcpu=cortex-m0plus -mthumb -Og -g -ffunction-sections -fdata-sections

C_DEFINES = -DCFG_TUSB_DEBUG=1 -DCFG_TUSB_MCU=OPT_MCU_RP2040 -DCFG_TUSB_OS=OPT_OS_PICO -DPICO_BIT_OPS_PICO=1 -DPICO_BOARD=\"pico\" -DPICO_BUILD=1 -DPICO_CMAKE_BUILD_TYPE=\"Debug\" -DPICO_COPY_TO_RAM=0 -DPICO_CXX_ENABLE_EXCEPTIONS=0 -DPICO_DIVIDER_HARDWARE=1 -DPICO_DOUBLE_PICO=1 -DPICO_FLOAT_PICO=1 -DPICO_INT64_OPS_PICO=1 -DPICO_MEM_OPS_PICO=1 -DPICO_MULTICORE=1 -DPICO_NO_FLASH=0 -DPICO_NO_HARDWARE=0 -DPICO_ON_DEVICE=1 -DPICO_PRINTF_PICO=1 -DPICO_STDIO_USB=1 -DPICO_TARGET_NAME=\"temp_7seg\" -DPICO_USE_BLOCKED_RAM=0

C_INCLUDES = -ID:\Downloads\pico-sdk\src\common\pico_stdlib\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_gpio\include -ID:\Downloads\pico-sdk\src\common\pico_base\include -IC:\Users\AndreClerigo\Desktop\Maker\Pico\Projects\temp_7seg\build\generated\pico_base -ID:\Downloads\pico-sdk\src\boards\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_platform\include -ID:\Downloads\pico-sdk\src\rp2040\hardware_regs\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_base\include -ID:\Downloads\pico-sdk\src\rp2040\hardware_structs\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_claim\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_sync\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_uart\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_divider\include -ID:\Downloads\pico-sdk\src\common\pico_time\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_timer\include -ID:\Downloads\pico-sdk\src\common\pico_sync\include -ID:\Downloads\pico-sdk\src\common\pico_util\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_runtime\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_clocks\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_resets\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_watchdog\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_xosc\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_pll\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_vreg\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_irq\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_printf\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_bootrom\include -ID:\Downloads\pico-sdk\src\common\pico_bit_ops\include -ID:\Downloads\pico-sdk\src\common\pico_divider\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_double\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_int64_ops\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_float\include -ID:\Downloads\pico-sdk\src\common\pico_binary_info\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_stdio\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_stdio_usb\include -ID:\Downloads\pico-sdk\lib\tinyusb\src -ID:\Downloads\pico-sdk\lib\tinyusb\src\common -ID:\Downloads\pico-sdk\lib\tinyusb\hw -ID:\Downloads\pico-sdk\src\rp2_common\pico_fix\rp2040_usb_device_enumeration\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_adc\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_multicore\include

C_FLAGS = -march=armv6-m -mcpu=cortex-m0plus -mthumb -Og -g -ffunction-sections -fdata-sections -std=gnu11

CXX_DEFINES = -DCFG_TUSB_DEBUG=1 -DCFG_TUSB_MCU=OPT_MCU_RP2040 -DCFG_TUSB_OS=OPT_OS_PICO -DPICO_BIT_OPS_PICO=1 -DPICO_BOARD=\"pico\" -DPICO_BUILD=1 -DPICO_CMAKE_BUILD_TYPE=\"Debug\" -DPICO_COPY_TO_RAM=0 -DPICO_CXX_ENABLE_EXCEPTIONS=0 -DPICO_DIVIDER_HARDWARE=1 -DPICO_DOUBLE_PICO=1 -DPICO_FLOAT_PICO=1 -DPICO_INT64_OPS_PICO=1 -DPICO_MEM_OPS_PICO=1 -DPICO_MULTICORE=1 -DPICO_NO_FLASH=0 -DPICO_NO_HARDWARE=0 -DPICO_ON_DEVICE=1 -DPICO_PRINTF_PICO=1 -DPICO_STDIO_USB=1 -DPICO_TARGET_NAME=\"temp_7seg\" -DPICO_USE_BLOCKED_RAM=0

CXX_INCLUDES = -ID:\Downloads\pico-sdk\src\common\pico_stdlib\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_gpio\include -ID:\Downloads\pico-sdk\src\common\pico_base\include -IC:\Users\AndreClerigo\Desktop\Maker\Pico\Projects\temp_7seg\build\generated\pico_base -ID:\Downloads\pico-sdk\src\boards\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_platform\include -ID:\Downloads\pico-sdk\src\rp2040\hardware_regs\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_base\include -ID:\Downloads\pico-sdk\src\rp2040\hardware_structs\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_claim\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_sync\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_uart\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_divider\include -ID:\Downloads\pico-sdk\src\common\pico_time\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_timer\include -ID:\Downloads\pico-sdk\src\common\pico_sync\include -ID:\Downloads\pico-sdk\src\common\pico_util\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_runtime\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_clocks\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_resets\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_watchdog\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_xosc\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_pll\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_vreg\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_irq\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_printf\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_bootrom\include -ID:\Downloads\pico-sdk\src\common\pico_bit_ops\include -ID:\Downloads\pico-sdk\src\common\pico_divider\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_double\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_int64_ops\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_float\include -ID:\Downloads\pico-sdk\src\common\pico_binary_info\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_stdio\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_stdio_usb\include -ID:\Downloads\pico-sdk\lib\tinyusb\src -ID:\Downloads\pico-sdk\lib\tinyusb\src\common -ID:\Downloads\pico-sdk\lib\tinyusb\hw -ID:\Downloads\pico-sdk\src\rp2_common\pico_fix\rp2040_usb_device_enumeration\include -ID:\Downloads\pico-sdk\src\rp2_common\hardware_adc\include -ID:\Downloads\pico-sdk\src\rp2_common\pico_multicore\include

CXX_FLAGS = -march=armv6-m -mcpu=cortex-m0plus -mthumb -Og -g -ffunction-sections -fdata-sections -fno-exceptions -fno-unwind-tables -fno-rtti -fno-use-cxa-atexit -std=gnu++17

