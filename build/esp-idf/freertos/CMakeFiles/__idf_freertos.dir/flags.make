# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# compile ASM with /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
# compile C with /home/boccara/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
ASM_FLAGS =   -ffunction-sections -fdata-sections -Wall -Werror=all -Wno-error=unused-function -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wextra -Wno-unused-parameter -Wno-sign-compare -ggdb -Og -fstrict-volatile-bitfields -Wno-error=unused-but-set-variable -D_GNU_SOURCE -DIDF_VER=\"v4.4-dev-4-g73db14240-dirty\" -DESP_PLATFORM

ASM_DEFINES = 

ASM_INCLUDES = -I/home/boccara/esp/MAGELLAN/build/config -I/home/boccara/esp/esp-idf/components/freertos/include -I/home/boccara/esp/esp-idf/components/freertos/port/xtensa/include -I/home/boccara/esp/esp-idf/components/freertos/include/freertos -I/home/boccara/esp/esp-idf/components/freertos/port/xtensa/include/freertos -I/home/boccara/esp/esp-idf/components/freertos/port/xtensa -I/home/boccara/esp/esp-idf/components/freertos -I/home/boccara/esp/esp-idf/components/newlib/platform_include -I/home/boccara/esp/esp-idf/components/esp_hw_support/include -I/home/boccara/esp/esp-idf/components/esp_hw_support/port/esp32/. -I/home/boccara/esp/esp-idf/components/heap/include -I/home/boccara/esp/esp-idf/components/log/include -I/home/boccara/esp/esp-idf/components/lwip/include/apps -I/home/boccara/esp/esp-idf/components/lwip/include/apps/sntp -I/home/boccara/esp/esp-idf/components/lwip/lwip/src/include -I/home/boccara/esp/esp-idf/components/lwip/port/esp32/include -I/home/boccara/esp/esp-idf/components/lwip/port/esp32/include/arch -I/home/boccara/esp/esp-idf/components/soc/include -I/home/boccara/esp/esp-idf/components/soc/esp32/. -I/home/boccara/esp/esp-idf/components/soc/esp32/include -I/home/boccara/esp/esp-idf/components/hal/esp32/include -I/home/boccara/esp/esp-idf/components/hal/include -I/home/boccara/esp/esp-idf/components/esp_rom/include -I/home/boccara/esp/esp-idf/components/esp_rom/esp32 -I/home/boccara/esp/esp-idf/components/esp_common/include -I/home/boccara/esp/esp-idf/components/esp_system/include -I/home/boccara/esp/esp-idf/components/esp32/include -I/home/boccara/esp/esp-idf/components/driver/include -I/home/boccara/esp/esp-idf/components/driver/esp32/include -I/home/boccara/esp/esp-idf/components/esp_ringbuf/include -I/home/boccara/esp/esp-idf/components/efuse/include -I/home/boccara/esp/esp-idf/components/efuse/esp32/include -I/home/boccara/esp/esp-idf/components/xtensa/include -I/home/boccara/esp/esp-idf/components/xtensa/esp32/include -I/home/boccara/esp/esp-idf/components/espcoredump/include -I/home/boccara/esp/esp-idf/components/esp_timer/include -I/home/boccara/esp/esp-idf/components/esp_ipc/include -I/home/boccara/esp/esp-idf/components/esp_pm/include -I/home/boccara/esp/esp-idf/components/vfs/include -I/home/boccara/esp/esp-idf/components/esp_wifi/include -I/home/boccara/esp/esp-idf/components/esp_wifi/esp32/include -I/home/boccara/esp/esp-idf/components/esp_event/include -I/home/boccara/esp/esp-idf/components/esp_netif/include -I/home/boccara/esp/esp-idf/components/esp_eth/include -I/home/boccara/esp/esp-idf/components/tcpip_adapter/include -I/home/boccara/esp/esp-idf/components/app_trace/include 

C_FLAGS = -mlongcalls -Wno-frame-address   -ffunction-sections -fdata-sections -Wall -Werror=all -Wno-error=unused-function -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wextra -Wno-unused-parameter -Wno-sign-compare -ggdb -Og -fstrict-volatile-bitfields -Wno-error=unused-but-set-variable -std=gnu99 -Wno-old-style-declaration -D_GNU_SOURCE -DIDF_VER=\"v4.4-dev-4-g73db14240-dirty\" -DESP_PLATFORM

C_DEFINES = 

C_INCLUDES = -I/home/boccara/esp/MAGELLAN/build/config -I/home/boccara/esp/esp-idf/components/freertos/include -I/home/boccara/esp/esp-idf/components/freertos/port/xtensa/include -I/home/boccara/esp/esp-idf/components/freertos/include/freertos -I/home/boccara/esp/esp-idf/components/freertos/port/xtensa/include/freertos -I/home/boccara/esp/esp-idf/components/freertos/port/xtensa -I/home/boccara/esp/esp-idf/components/freertos -I/home/boccara/esp/esp-idf/components/newlib/platform_include -I/home/boccara/esp/esp-idf/components/esp_hw_support/include -I/home/boccara/esp/esp-idf/components/esp_hw_support/port/esp32/. -I/home/boccara/esp/esp-idf/components/heap/include -I/home/boccara/esp/esp-idf/components/log/include -I/home/boccara/esp/esp-idf/components/lwip/include/apps -I/home/boccara/esp/esp-idf/components/lwip/include/apps/sntp -I/home/boccara/esp/esp-idf/components/lwip/lwip/src/include -I/home/boccara/esp/esp-idf/components/lwip/port/esp32/include -I/home/boccara/esp/esp-idf/components/lwip/port/esp32/include/arch -I/home/boccara/esp/esp-idf/components/soc/include -I/home/boccara/esp/esp-idf/components/soc/esp32/. -I/home/boccara/esp/esp-idf/components/soc/esp32/include -I/home/boccara/esp/esp-idf/components/hal/esp32/include -I/home/boccara/esp/esp-idf/components/hal/include -I/home/boccara/esp/esp-idf/components/esp_rom/include -I/home/boccara/esp/esp-idf/components/esp_rom/esp32 -I/home/boccara/esp/esp-idf/components/esp_common/include -I/home/boccara/esp/esp-idf/components/esp_system/include -I/home/boccara/esp/esp-idf/components/esp32/include -I/home/boccara/esp/esp-idf/components/driver/include -I/home/boccara/esp/esp-idf/components/driver/esp32/include -I/home/boccara/esp/esp-idf/components/esp_ringbuf/include -I/home/boccara/esp/esp-idf/components/efuse/include -I/home/boccara/esp/esp-idf/components/efuse/esp32/include -I/home/boccara/esp/esp-idf/components/xtensa/include -I/home/boccara/esp/esp-idf/components/xtensa/esp32/include -I/home/boccara/esp/esp-idf/components/espcoredump/include -I/home/boccara/esp/esp-idf/components/esp_timer/include -I/home/boccara/esp/esp-idf/components/esp_ipc/include -I/home/boccara/esp/esp-idf/components/esp_pm/include -I/home/boccara/esp/esp-idf/components/vfs/include -I/home/boccara/esp/esp-idf/components/esp_wifi/include -I/home/boccara/esp/esp-idf/components/esp_wifi/esp32/include -I/home/boccara/esp/esp-idf/components/esp_event/include -I/home/boccara/esp/esp-idf/components/esp_netif/include -I/home/boccara/esp/esp-idf/components/esp_eth/include -I/home/boccara/esp/esp-idf/components/tcpip_adapter/include -I/home/boccara/esp/esp-idf/components/app_trace/include 

# Custom defines: esp-idf/freertos/CMakeFiles/__idf_freertos.dir/event_groups.c.obj_DEFINES = _ESP_FREERTOS_INTERNAL

# Custom defines: esp-idf/freertos/CMakeFiles/__idf_freertos.dir/queue.c.obj_DEFINES = _ESP_FREERTOS_INTERNAL

# Custom defines: esp-idf/freertos/CMakeFiles/__idf_freertos.dir/tasks.c.obj_DEFINES = _ESP_FREERTOS_INTERNAL

# Custom defines: esp-idf/freertos/CMakeFiles/__idf_freertos.dir/timers.c.obj_DEFINES = _ESP_FREERTOS_INTERNAL

# Custom defines: esp-idf/freertos/CMakeFiles/__idf_freertos.dir/stream_buffer.c.obj_DEFINES = _ESP_FREERTOS_INTERNAL

