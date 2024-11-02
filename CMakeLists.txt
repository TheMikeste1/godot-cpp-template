cmake_minimum_required(VERSION 3.13)

project(godot-cpp-template LANGUAGES CXX)

set(GODOT_PROJECT_PATH demo CACHE FILEPATH "The path from the project root to the Godot project")
set(CMAKE_CXX_STANDARD 17)

include(cmake/SetOutput.cmake)

if("${CMAKE_BUILD_TYPE}" STREQUAL "")
  set(CMAKE_BUILD_TYPE Debug)
endif()

add_subdirectory(godot-cpp)
add_subdirectory(src)
