cmake_minimum_required(VERSION 3.12)
###############################################################################
# Set project name and source code folder location
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(TOOLCHAIN_PREFIX arm-none-eabi-)
set(FLAGS
    "-fdata-sections -ffunction-sections --specs=nosys.specs -Wl,--gc-sections")
set(CPP_FLAGS
    "-fno-rtti -fno-exceptions -fno-threadsafe-statics")

set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}gcc ${FLAGS})
set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}g++ ${FLAGS} ${CPP_FLAGS})
set(CMAKE_OBJCOPY ${TOOLCHAIN_PREFIX}objcopy)
set(CMAKE_SIZE ${TOOLCHAIN_PREFIX}size)
set(CMAKE_OBJDUMP ${TOOLCHAIN_PREFIX}objdump)

set(CMAKE_EXECUTABLE_SUFFIX_ASM ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_C ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_CXX ".elf")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

project(ECU)

set(PROJECT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Project)
set(PERIPH_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Periph)

set(CC, arm-none-eabi-gcc)
option(DUMP_ASM "Create full assembly of final executable" OFF)

# Set microcontroller information

set(MCU_MODEL GF32F307xx)
set(CPU_PARAMETERS
    -mcpu=cortex-m4
    -mthumb
    #-mfpu=fpv4-sp-d16
    -mfloat-abi=soft)

set(STARTUP_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/System/startup_ARMCM4.s)
set(MCU_LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/System/gcc_arm.ld)

###############################################################################
set(EXECUTABLE ${CMAKE_PROJECT_NAME})

enable_language(C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

###############################################################################
set(LIB_INCLUDE_DIRECTORIES
    ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS
    ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS/GD/GD32F30x/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/GD32F30x_standard_peripheral/Include)
                                
set(PROJECT_INCLUDE_DIRECTORIES
    ${PERIPH_DIR}/CAN/Inc
    ${PERIPH_DIR}/SPI/Inc
    ${PERIPH_DIR}/GPIO/Inc

    ${CMAKE_CURRENT_SOURCE_DIR}/Project/Inc
    
    )


file(GLOB_RECURSE LIB_SOURCES CONFIGURE_DEPENDS
    ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS/*.c
    ${CMAKE_CURRENT_SOURCE_DIR}/GD32F30x_standard_peripheral/*.c)

file(GLOB_RECURSE PROJECT_SOURCES CONFIGURE_DEPENDS
    ${PROJECT_DIR}/*.cpp
    ${PROJECT_DIR}/*.c
    ${PERIPH_DIR}/*.cpp
    ${PERIPH_DIR}/*.c)

add_executable(${EXECUTABLE}
    ${LIB_SOURCES} 
    ${PROJECT_SOURCES}
    ${STARTUP_SCRIPT})

target_compile_definitions(${EXECUTABLE} PRIVATE
    #$<$<CONFIG:Debug>:DEBUG>
    ${MCU_MODEL}
    )

target_include_directories(${EXECUTABLE} SYSTEM PRIVATE
    ${LIB_INCLUDE_DIRECTORIES})

target_include_directories(${EXECUTABLE} PRIVATE
    ${PROJECT_INCLUDE_DIRECTORIES})
    
###############################################################################
target_compile_options(${EXECUTABLE} PRIVATE
${CPU_PARAMETERS}
    -Wall
    -Wextra
    -Wpedantic
    -Wshadow
    -Wdouble-promotion
    -Wformat=2 -Wformat-truncation
    -Wundef
    -fno-common
    -Wno-unused-parameter
    -Og
    -I
    -L
    -ggdb
    -g
    $<$<COMPILE_LANGUAGE:CXX>:
        -Wconversion # STM libraries!
        -Wno-volatile
        -Wold-style-cast
        -Wuseless-cast
        -Wsuggest-override>
        -Og
        -I
        -L
        -ggdb
        -g)
        #$<$<CONFIG:Debug>:-O3 -ggdb>)
       # $<$<CONFIG:Debug>:-Og -g3 -ggdb>
    #$<$<CONFIG:Release>:-Og -g3 -ggdb>)
    #$<$<CONFIG:Release>:-Og -g0>)

target_link_options(${EXECUTABLE} PRIVATE
    -T${MCU_LINKER_SCRIPT}
    ${CPU_PARAMETERS}
    -Wl,-Map=${CMAKE_PROJECT_NAME}.map
    -Og
    -I
    -L
    -ggdb
    -g
    #-Og -ggdb
    -Wl,--start-group
    -lc
    -lm
    -lstdc++
    -Wl,--end-group
    -Wl,--print-memory-usage)

# The last command can take a couple of seconds on larger project, usefull for debugging
add_custom_command(TARGET ${EXECUTABLE} POST_BUILD
    COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${EXECUTABLE}>
    COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${EXECUTABLE}> ${EXECUTABLE}.hex
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${EXECUTABLE}> ${EXECUTABLE}.bin)

if (${DUMP_ASM})
    add_custom_command(TARGET ${EXECUTABLE} POST_BUILD
        COMMAND ${CMAKE_OBJDUMP} -D $<TARGET_FILE:${EXECUTABLE}> > ${EXECUTABLE}.s)
endif()