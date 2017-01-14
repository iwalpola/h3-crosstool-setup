set(ENV{PKG_CONFIG_PATH} $ENV{ARMPREFIX}/lib/pkgconfig)
set(ENV{LD_LIBRARY_PATH} $ENV{ARMPREFIX}/lib)
set(ENV{C_INCLUDE_PATH} $ENV{ARMPREFIX}/include)
set(ENV{CPLUS_INCLUDE_PATH} $ENV{ARMPREFIX}/include)

set (CMAKE_SYSTEM_NAME Linux)
set (CMAKE_SYSTEM_PROCESSOR arm)
set (CMAKE_C_COMPILER arm-linux-gnueabihf-gcc)
set (CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++)
set (ARM_LINUX_SYSROOT /usr/arm-linux-gnueabihf CACHE PATH "ARM cross compilation system root")
set (CMAKE_FIND_ROOT_PATH ${CMAKE_FIND_ROOT_PATH} ${ARM_LINUX_SYSROOT})

set(CMAKE_INSTALL_PREFIX $ENV{ARMPREFIX})


set(CMAKE_CXX_FLAGS           "-mthumb -fdata-sections -Wa,--noexecstack -fsigned-char -Wno-psabi"                    CACHE STRING "c++ flags")
set(CMAKE_C_FLAGS             "-mthumb -fdata-sections -Wa,--noexecstack -fsigned-char -Wno-psabi"                    CACHE STRING "c flags")
set(CMAKE_SHARED_LINKER_FLAGS "-Wl,--fix-cortex-a8 -Wl,--no-undefined -Wl,--gc-sections -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now"                    CACHE STRING "shared linker flags")
set(CMAKE_MODULE_LINKER_FLAGS ""                    CACHE STRING "module linker flags")
set(CMAKE_EXE_LINKER_FLAGS    "-Wl,-z,nocopyreloc"  CACHE STRING "executable linker flags")

set(MY_FLAGS "-I$ENV{ARMPREFIX}/include -L$ENV{ARMPREFIX}/lib -lxvidcore -lx264 -lswscale -lavformat -lavutil -lswresample -lavcodec")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  ${MY_FLAGS}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  ${MY_FLAGS}")

set(ENABLE_NEON TRUE)
set(ENABLE_VFPV3 TRUE)

set(TOOLCHAIN_CONFIG_VARS ${TOOLCHAIN_CONFIG_VARS}
    ARM_LINUX_SYSROOT
    ENABLE_NEON
    ENABLE_VFPV3
    CUDA_TOOLKIT_ROOT_DIR
)
