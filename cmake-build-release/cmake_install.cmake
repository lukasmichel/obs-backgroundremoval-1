# Install script for directory: /home/lukas/Documents/obs-backgroundremoval

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/llvm-objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/lib/obs-plugins/obs-backgroundremoval.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/lib/obs-plugins/obs-backgroundremoval.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/lib/obs-plugins/obs-backgroundremoval.so"
         RPATH "/usr/lib/obs-backgroundremoval")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/lib/obs-plugins/obs-backgroundremoval.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/lib/obs-plugins" TYPE MODULE FILES "/home/lukas/Documents/obs-backgroundremoval/cmake-build-release/obs-backgroundremoval.so")
  if(EXISTS "$ENV{DESTDIR}/usr/lib/obs-plugins/obs-backgroundremoval.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/lib/obs-plugins/obs-backgroundremoval.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/lib/obs-plugins/obs-backgroundremoval.so"
         OLD_RPATH "/home/lukas/Documents/obs-backgroundremoval/build/onnxruntime-gpu/lib:"
         NEW_RPATH "/usr/lib/obs-backgroundremoval")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/llvm-strip" "$ENV{DESTDIR}/usr/lib/obs-plugins/obs-backgroundremoval.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/share/obs/obs-plugins/obs-backgroundremoval/locale/en-US.ini")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/share/obs/obs-plugins/obs-backgroundremoval/locale" TYPE FILE FILES "/home/lukas/Documents/obs-backgroundremoval/data/locale/en-US.ini")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/share/obs/obs-plugins/obs-backgroundremoval/SINet_Softmax_simple.onnx;/usr/share/obs/obs-plugins/obs-backgroundremoval/mediapipe.onnx;/usr/share/obs/obs-plugins/obs-backgroundremoval/modnet_simple.onnx;/usr/share/obs/obs-plugins/obs-backgroundremoval/selfie_segmentation.onnx")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/share/obs/obs-plugins/obs-backgroundremoval" TYPE FILE FILES
    "/home/lukas/Documents/obs-backgroundremoval/data/SINet_Softmax_simple.onnx"
    "/home/lukas/Documents/obs-backgroundremoval/data/mediapipe.onnx"
    "/home/lukas/Documents/obs-backgroundremoval/data/modnet_simple.onnx"
    "/home/lukas/Documents/obs-backgroundremoval/data/selfie_segmentation.onnx"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/lukas/Documents/obs-backgroundremoval/cmake-build-release/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
