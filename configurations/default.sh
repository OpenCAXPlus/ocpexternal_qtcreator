#!/bin/bash
# This is a template script to install the external project
# You should create a configuration folder and copy this script
# to the folder for actual installation.
config=$(basename "${BASH_SOURCE[0]}" .sh)
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
root="$script_dir/.."
source_dir="$script_dir/../source"
build_dir="$script_dir/../build/$config"
install_dir="$script_dir/../install/$config"
qt_dir="$HOME/ocp/external/qt/6.5.2/install/default"

cmake -S $source_dir -B $build_dir -DCMAKE_INSTALL_PREFIX=$install_dir -G Ninja -DCMAKE_PREFIX_PATH=$qt_dir
cmake --build $build_dir --target install
