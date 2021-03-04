# Generated Cmake Pico project file
cmake_minimum_required(VERSION 3.12)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Pull in Pico SDK (must be before project)
include(pico_sdk_import.cmake)

project(rtctime_7seg)

# Initialise the Pico SDK
pico_sdk_init()

# Add executable. Default name is the project name, version 0.1
add_executable(rtctime_7seg main.c)

pico_enable_stdio_uart(rtctime_7seg 0)
pico_enable_stdio_usb(rtctime_7seg 1)

# Add the standard library to the build
target_link_libraries(rtctime_7seg pico_stdlib pico_util pico_multicore hardware_rtc)

pico_add_extra_outputs(rtctime_7seg)