#!/bin/bash

# Name: System Specifications
# Purpose: Scans hardware info stored in linux directories to display the devices specs. 
# Author: Harvey Lopez

# CPU specs pulled from CPU_info_path
CPU_info_path="/proc/cpuinfo"
CPU_model=$(awk -F': ' '/model name/ {print $2; exit}' "$CPU_info_path")
CPU_processor_count=$(awk -F': ' '/siblings/ {print $2; exit}' "$CPU_info_path")
CPU_cache_size=$(awk -F': ' '/cache size/ {print $2; exit}' "$CPU_info_path")

# Storage specs pulled from Storage_info_path
Storage_info_path="/proc/meminfo"
Storage_mem_total=$(awk -F': ' '/MemTotal/ {print $2; exit}' "$Storage_info_path")
Storage_mem_free=$(awk -F': ' '/MemFree/ {print $2; exit}' "$Storage_info_path")

echo "========================="
echo "Development Machine Specs"
echo "========================="

# CPU Specs
echo -e  "\nCPU Specs\n"
echo -e "\tModel: $CPU_model"
echo -e "\tProcessor Count: $CPU_processor_count"
echo -e "\tCache Size: $CPU_cache_size"

# Memory Specs
echo -e "\nStorage Specs\n"
echo -e "\tTotal Storage Space: $Storage_mem_total"
echo -e "\tFree Storage Space: $Storage_mem_free"

# Compiler versions (gcc, g++ clang, MSVC)
compilers=("gcc" "g++" "clang" "msvc")

echo -e "\nCompiler Version Checks\n"

for compiler in "${compilers[@]}"; do
	if command -v "$compiler" >/dev/null 2>&1; then
		version=$("$compiler" --version | head -n1)
		echo -e "\t${compiler^^}: $version"
	else 
		echo -e "\t${compiler^^}: Not Found"
	fi
done
# Toolchain versions (CMake, Make, Git, GDB)
tools=("cmake" "make" "git" "gdb")

echo -e "\nToolchain Version Checks\n"

for tool in "${tools[@]}"; do
	if command -v "$tool" >/dev/null 2>&1; then
		version=$("$tool" --version | head -n1)
		echo -e "\t${tool^^}: $version"
	else
		echo -e "\t${tool^^}: Not Found"
	fi
done

# USB Devices - to be added


# Serial Ports - to be added 


# Disk Usage - to be added
