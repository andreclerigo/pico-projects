# Generated Cmake Pico project file
cmake_minimum_required(VERSION 3.12)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Pull in Pico SDK (must be before project)
include(pico_sdk_import.cmake)

project(ssd_oled_hello)

# Initialise the Pico SDK
pico_sdk_init()

# Add executable. Default name is the project name, version 0.1
include_directories(lib)
file(GLOB SOURCES "lib/*.c")
add_executable(ssd_oled_hello main.c ${SOURCES})

pico_enable_stdio_uart(ssd_oled_hello 0)
pico_enable_stdio_usb(ssd_oled_hello 1)

# Add the standard library to the build
target_link_libraries(ssd_oled_hello pico_stdlib hardware_i2c)

pico_add_extra_outputs(ssd_oled_hello)