# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.3

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/brave/projects/share_rtmp_server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/brave/projects/share_rtmp_server/build

# Include any dependencies generated for this target.
include CMakeFiles/share_rtmp_server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/share_rtmp_server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/share_rtmp_server.dir/flags.make

CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o: ../brs/share_rtmp_server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o -c /home/brave/projects/share_rtmp_server/brs/share_rtmp_server.cpp

CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/brs/share_rtmp_server.cpp > CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.i

CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/brs/share_rtmp_server.cpp -o CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.s

CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o


CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o: ../common/BRSHeader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o -c /home/brave/projects/share_rtmp_server/common/BRSHeader.cpp

CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/common/BRSHeader.cpp > CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.i

CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/common/BRSHeader.cpp -o CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.s

CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o


CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o: ../common/BRSCommon.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o -c /home/brave/projects/share_rtmp_server/common/BRSCommon.cpp

CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/common/BRSCommon.cpp > CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.i

CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/common/BRSCommon.cpp -o CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.s

CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o


CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o: ../common/BRSMath.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o -c /home/brave/projects/share_rtmp_server/common/BRSMath.cpp

CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/common/BRSMath.cpp > CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.i

CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/common/BRSMath.cpp -o CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.s

CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o


CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o: ../core/BRSUtils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o -c /home/brave/projects/share_rtmp_server/core/BRSUtils.cpp

CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/core/BRSUtils.cpp > CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.i

CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/core/BRSUtils.cpp -o CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.s

CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o


CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o: ../core/BRSLog.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o -c /home/brave/projects/share_rtmp_server/core/BRSLog.cpp

CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/core/BRSLog.cpp > CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.i

CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/core/BRSLog.cpp -o CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.s

CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o


CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o: ../core/BRSJson.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o -c /home/brave/projects/share_rtmp_server/core/BRSJson.cpp

CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/core/BRSJson.cpp > CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.i

CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/core/BRSJson.cpp -o CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.s

CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o


CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o: ../network/BRSSocket.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o -c /home/brave/projects/share_rtmp_server/network/BRSSocket.cpp

CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/network/BRSSocket.cpp > CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.i

CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/network/BRSSocket.cpp -o CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.s

CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o


CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o: ../network/BRSEpoll.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o -c /home/brave/projects/share_rtmp_server/network/BRSEpoll.cpp

CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/network/BRSEpoll.cpp > CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.i

CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/network/BRSEpoll.cpp -o CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.s

CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o


CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o: ../network/BRSStream.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o -c /home/brave/projects/share_rtmp_server/network/BRSStream.cpp

CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/network/BRSStream.cpp > CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.i

CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/network/BRSStream.cpp -o CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.s

CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o


CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o: ../network/BRSServer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o -c /home/brave/projects/share_rtmp_server/network/BRSServer.cpp

CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/network/BRSServer.cpp > CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.i

CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/network/BRSServer.cpp -o CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.s

CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o


CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o: ../app/BRSUser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o -c /home/brave/projects/share_rtmp_server/app/BRSUser.cpp

CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/app/BRSUser.cpp > CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.i

CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/app/BRSUser.cpp -o CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.s

CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o


CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o: CMakeFiles/share_rtmp_server.dir/flags.make
CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o: ../app/BRSClientContext.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o -c /home/brave/projects/share_rtmp_server/app/BRSClientContext.cpp

CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/brave/projects/share_rtmp_server/app/BRSClientContext.cpp > CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.i

CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/brave/projects/share_rtmp_server/app/BRSClientContext.cpp -o CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.s

CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o.requires:

.PHONY : CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o.requires

CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o.provides: CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o.requires
	$(MAKE) -f CMakeFiles/share_rtmp_server.dir/build.make CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o.provides.build
.PHONY : CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o.provides

CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o.provides.build: CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o


# Object files for target share_rtmp_server
share_rtmp_server_OBJECTS = \
"CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o" \
"CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o"

# External object files for target share_rtmp_server
share_rtmp_server_EXTERNAL_OBJECTS =

share_rtmp_server: CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/build.make
share_rtmp_server: ../objs/libco/lib/libcolib.a
share_rtmp_server: ../objs/openssl/lib/libssl.a
share_rtmp_server: ../objs/openssl/lib/libcrypto.a
share_rtmp_server: ../objs/hp/libhttp_parser.a
share_rtmp_server: CMakeFiles/share_rtmp_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/brave/projects/share_rtmp_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Linking CXX executable share_rtmp_server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/share_rtmp_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/share_rtmp_server.dir/build: share_rtmp_server

.PHONY : CMakeFiles/share_rtmp_server.dir/build

CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/brs/share_rtmp_server.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/common/BRSHeader.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/common/BRSCommon.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/common/BRSMath.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/core/BRSUtils.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/core/BRSLog.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/core/BRSJson.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/network/BRSSocket.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/network/BRSEpoll.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/network/BRSStream.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/network/BRSServer.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/app/BRSUser.cpp.o.requires
CMakeFiles/share_rtmp_server.dir/requires: CMakeFiles/share_rtmp_server.dir/app/BRSClientContext.cpp.o.requires

.PHONY : CMakeFiles/share_rtmp_server.dir/requires

CMakeFiles/share_rtmp_server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/share_rtmp_server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/share_rtmp_server.dir/clean

CMakeFiles/share_rtmp_server.dir/depend:
	cd /home/brave/projects/share_rtmp_server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/brave/projects/share_rtmp_server /home/brave/projects/share_rtmp_server /home/brave/projects/share_rtmp_server/build /home/brave/projects/share_rtmp_server/build /home/brave/projects/share_rtmp_server/build/CMakeFiles/share_rtmp_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/share_rtmp_server.dir/depend
