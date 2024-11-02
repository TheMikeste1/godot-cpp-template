if (NOT DEFINED GODOT_PROJECT_PATH)
  message(FATAL_ERROR "GODOT_PROJECT_PATH is not defined")
endif()

get_filename_component(OUTPUT_ROOT "${GODOT_PROJECT_PATH}" ABSOLUTE)
message(DEBUG "OUTPUT_ROOT=${OUTPUT_ROOT}")

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Android")
  set(OUTPUT_DIRECTORY "${OUTPUT_ROOT}/bin/android")
elseif("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
  set(OUTPUT_DIRECTORY "${OUTPUT_ROOT}/bin/linux")
elseif("${CMAKE_SYSTEM_NAME}" STREQUAL "Darwin")
  set(OUTPUT_DIRECTORY "${OUTPUT_ROOT}/bin/macos")
elseif("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
  set(OUTPUT_DIRECTORY "${OUTPUT_ROOT}/bin/windows")
else()
  message(WARNING "Unrecognized system name: ${CMAKE_SYSTEM_NAME}. Using default library output")
  return()
endif()

message(STATUS "Setting library output to ${OUTPUT_DIRECTORY}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${OUTPUT_DIRECTORY}")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${OUTPUT_DIRECTORY}")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${OUTPUT_DIRECTORY}")