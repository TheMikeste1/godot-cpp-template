set(TARGET_NAME gdexample)

add_library(${TARGET_NAME} SHARED gdexample.hpp gdexample.cpp register_types.hpp register_types.cpp)
target_link_libraries(${TARGET_NAME} godot::cpp)

# Create the correct name (godot.os.build_type.system_bits)
string(TOLOWER "${CMAKE_SYSTEM_NAME}" SYSTEM_NAME)
string(TOLOWER "${CMAKE_BUILD_TYPE}" BUILD_TYPE)
string(TOLOWER "${CMAKE_SYSTEM_PROCESSOR}" ARCHITECTURE)

if ("${ARCHITECTURE}" STREQUAL "amd64")
  set(ARCHITECTURE "x86_64")
endif()

set(OUTPUT_NAME "${TARGET_NAME}.${SYSTEM_NAME}.${BUILD_TYPE}.${ARCHITECTURE}")
if(ANDROID)
  # Added the android abi after system name
  set(SYSTEM_NAME ${SYSTEM_NAME}.${ANDROID_ABI})

  # Android does not have the bits at the end if you look at the main godot repo build
  set(OUTPUT_NAME "${TARGET_NAME}.${SYSTEM_NAME}.${BUILD_TYPE}")
endif()

message(STATUS "Setting output name for ${TARGET_NAME} to ${OUTPUT_NAME}")

set_target_properties(${TARGET_NAME}
  PROPERTIES
    CXX_EXTENSIONS OFF
    POSITION_INDEPENDENT_CODE ON
    OUTPUT_NAME "${OUTPUT_NAME}"
)
