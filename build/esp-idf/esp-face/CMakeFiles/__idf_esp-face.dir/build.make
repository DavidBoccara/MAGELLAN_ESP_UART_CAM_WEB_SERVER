# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build

# Include any dependencies generated for this target.
include esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/depend.make

# Include the progress variables for this target.
include esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/flags.make

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.obj: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/flags.make
esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.obj: /home/boccara/esp/esp-idf/components/esp-face/face_detection/fd_forward.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.obj"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.obj   -c /home/boccara/esp/esp-idf/components/esp-face/face_detection/fd_forward.c

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.i"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/boccara/esp/esp-idf/components/esp-face/face_detection/fd_forward.c > CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.i

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.s"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/boccara/esp/esp-idf/components/esp-face/face_detection/fd_forward.c -o CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.s

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.obj: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/flags.make
esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.obj: /home/boccara/esp/esp-idf/components/esp-face/object_detection/object_detection.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.obj"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.obj -c /home/boccara/esp/esp-idf/components/esp-face/object_detection/object_detection.cpp

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.i"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boccara/esp/esp-idf/components/esp-face/object_detection/object_detection.cpp > CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.i

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.s"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boccara/esp/esp-idf/components/esp-face/object_detection/object_detection.cpp -o CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.s

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.obj: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/flags.make
esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.obj: /home/boccara/esp/esp-idf/components/esp-face/face_recognition/fr_forward.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.obj"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.obj   -c /home/boccara/esp/esp-idf/components/esp-face/face_recognition/fr_forward.c

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.i"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/boccara/esp/esp-idf/components/esp-face/face_recognition/fr_forward.c > CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.i

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.s"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/boccara/esp/esp-idf/components/esp-face/face_recognition/fr_forward.c -o CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.s

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.obj: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/flags.make
esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.obj: /home/boccara/esp/esp-idf/components/esp-face/face_recognition/fr_flash.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.obj"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.obj   -c /home/boccara/esp/esp-idf/components/esp-face/face_recognition/fr_flash.c

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.i"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/boccara/esp/esp-idf/components/esp-face/face_recognition/fr_flash.c > CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.i

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.s"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/boccara/esp/esp-idf/components/esp-face/face_recognition/fr_flash.c -o CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.s

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.obj: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/flags.make
esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.obj: /home/boccara/esp/esp-idf/components/esp-face/pose_estimation/pe_forward.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.obj"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.obj   -c /home/boccara/esp/esp-idf/components/esp-face/pose_estimation/pe_forward.c

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.i"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/boccara/esp/esp-idf/components/esp-face/pose_estimation/pe_forward.c > CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.i

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.s"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/boccara/esp/esp-idf/components/esp-face/pose_estimation/pe_forward.c -o CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.s

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.obj: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/flags.make
esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.obj: /home/boccara/esp/esp-idf/components/esp-face/image_util/image_util.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.obj"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.obj   -c /home/boccara/esp/esp-idf/components/esp-face/image_util/image_util.c

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.i"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/boccara/esp/esp-idf/components/esp-face/image_util/image_util.c > CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.i

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.s"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/boccara/esp/esp-idf/components/esp-face/image_util/image_util.c -o CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.s

# Object files for target __idf_esp-face
__idf_esp__face_OBJECTS = \
"CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.obj" \
"CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.obj" \
"CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.obj" \
"CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.obj" \
"CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.obj" \
"CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.obj"

# External object files for target __idf_esp-face
__idf_esp__face_EXTERNAL_OBJECTS =

esp-idf/esp-face/libesp-face.a: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_detection/fd_forward.c.obj
esp-idf/esp-face/libesp-face.a: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/object_detection/object_detection.cpp.obj
esp-idf/esp-face/libesp-face.a: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_forward.c.obj
esp-idf/esp-face/libesp-face.a: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/face_recognition/fr_flash.c.obj
esp-idf/esp-face/libesp-face.a: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/pose_estimation/pe_forward.c.obj
esp-idf/esp-face/libesp-face.a: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/image_util/image_util.c.obj
esp-idf/esp-face/libesp-face.a: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/build.make
esp-idf/esp-face/libesp-face.a: esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking C static library libesp-face.a"
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && $(CMAKE_COMMAND) -P CMakeFiles/__idf_esp-face.dir/cmake_clean_target.cmake
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_esp-face.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/build: esp-idf/esp-face/libesp-face.a

.PHONY : esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/build

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/clean:
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face && $(CMAKE_COMMAND) -P CMakeFiles/__idf_esp-face.dir/cmake_clean.cmake
.PHONY : esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/clean

esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/depend:
	cd /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER /home/boccara/esp/esp-idf/components/esp-face /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face /home/boccara/esp/MAGELLAN_ESP_UART_CAM_WEB_SERVER/build/esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/esp-face/CMakeFiles/__idf_esp-face.dir/depend

