cmake_minimum_required(VERSION 3.31)
project(eevee)
set(CMAKE_CXX_STANDARD 20)

find_package(OpenGL REQUIRED)

add_executable(eevee main.cpp)

set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)

add_subdirectory(glfw)
include_directories(${OPENGL_INCLUDE_DIRS} glfw)

add_subdirectory(spdlog)
include_directories(spdlog)

target_link_libraries(eevee ${OPENGL_LIBRARIES} glfw spdlog)