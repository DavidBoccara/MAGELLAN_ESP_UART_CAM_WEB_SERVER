file(REMOVE_RECURSE
  "bootloader.bin"
  "bootloader.map"
  "config/sdkconfig.cmake"
  "config/sdkconfig.h"
  "project_elf_src_esp32.c"
  "CMakeFiles/menuconfig"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/menuconfig.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
