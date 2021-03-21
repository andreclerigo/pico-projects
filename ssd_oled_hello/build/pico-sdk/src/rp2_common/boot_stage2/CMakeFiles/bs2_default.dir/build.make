# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build

# Include any dependencies generated for this target.
include pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\depend.make

# Include the progress variables for this target.
include pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\progress.make

# Include the compile flags for this target's objects.
include pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\flags.make

pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\boot2_w25q080.S.obj: pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\flags.make
pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\boot2_w25q080.S.obj: D:\Downloads\pico-sdk\src\rp2_common\boot_stage2\boot2_w25q080.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building ASM object pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default.dir/boot2_w25q080.S.obj"
	cd C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build\pico-sdk\src\rp2_common\boot_stage2
	C:\PROGRA~2\GNUARM~1\102020~1\bin\AR19DD~1.EXE $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles\bs2_default.dir\boot2_w25q080.S.obj   -c D:\Downloads\pico-sdk\src\rp2_common\boot_stage2\boot2_w25q080.S
	cd C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build

# Object files for target bs2_default
bs2_default_OBJECTS = \
"CMakeFiles\bs2_default.dir\boot2_w25q080.S.obj"

# External object files for target bs2_default
bs2_default_EXTERNAL_OBJECTS =

pico-sdk\src\rp2_common\boot_stage2\bs2_default.elf: pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\boot2_w25q080.S.obj
pico-sdk\src\rp2_common\boot_stage2\bs2_default.elf: pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\build.make
pico-sdk\src\rp2_common\boot_stage2\bs2_default.elf: D:\Downloads\pico-sdk\src\rp2_common\boot_stage2\boot_stage2.ld
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking ASM executable bs2_default.elf"
	cd C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build\pico-sdk\src\rp2_common\boot_stage2
	C:\PROGRA~2\GNUARM~1\102020~1\bin\AR19DD~1.EXE -march=armv6-m -mcpu=cortex-m0plus -mthumb -Og -g -Wl,--build-id=none --specs=nosys.specs -nostartfiles -Wl,--script=D:/Downloads/pico-sdk/src/rp2_common/boot_stage2/boot_stage2.ld -Wl,-Map=bs2_default.elf.map $(bs2_default_OBJECTS) $(bs2_default_EXTERNAL_OBJECTS) -o bs2_default.elf 
	cd C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build
	cd C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build\pico-sdk\src\rp2_common\boot_stage2
	echo >nul && "C:\Program Files (x86)\GNU Arm Embedded Toolchain\10 2020-q4-major\bin\arm-none-eabi-objdump.exe" -h bs2_default.elf >bs2_default.dis
	echo >nul && "C:\Program Files (x86)\GNU Arm Embedded Toolchain\10 2020-q4-major\bin\arm-none-eabi-objdump.exe" -d bs2_default.elf >>bs2_default.dis
	cd C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build

# Rule to build all files generated by this target.
pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\build: pico-sdk\src\rp2_common\boot_stage2\bs2_default.elf

.PHONY : pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\build

pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\clean:
	cd C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build\pico-sdk\src\rp2_common\boot_stage2
	$(CMAKE_COMMAND) -P CMakeFiles\bs2_default.dir\cmake_clean.cmake
	cd C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build
.PHONY : pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\clean

pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello D:\Downloads\pico-sdk\src\rp2_common\boot_stage2 C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build\pico-sdk\src\rp2_common\boot_stage2 C:\Users\AndreClerigo\Desktop\Git\pico-projects\ssd_oled_hello\build\pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : pico-sdk\src\rp2_common\boot_stage2\CMakeFiles\bs2_default.dir\depend

