cmake_minimum_required(VERSION 3.25)
project(dwm LANGUAGES C)

set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED true)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

file(GLOB_RECURSE dwm_HEADERS "src/*.h")
file(GLOB_RECURSE dwm_SOURCES "src/*.c")

set(CCSD ${CMAKE_CURRENT_SOURCE_DIR})

list(REMOVE_ITEM dwm_SOURCES "${CCSD}/src/transient.c")

add_executable(dwm ${dwm_HEADERS} ${dwm_SOURCES})

find_package(X11 REQUIRED)
find_package(Freetype REQUIRED)
find_package(Fontconfig REQUIRED)

target_link_libraries(dwm PRIVATE ${X11_LIBRARIES} ${FREETYPE_LIBRARIES} ${X11_Xft_LIB} ${Fontconfig_LIBRARIES} ${X11_Xinerama_LIB})
target_include_directories(dwm PRIVATE ${X11_INCLUDE_DIR} ${FREETYPE_INCLUDE_DIRS})

target_compile_options(dwm PRIVATE -Wall -Wextra -Wpedantic)
target_link_options(dwm PRIVATE ${X11_LIBRARIES} ${FREETYPE_LIBRARIES})

install(TARGETS dwm)
