#!/usr/bin/env bash

clear

# Save current working directory
current_dir="$PWD"

# Change to the script's directory
cd $(dirname $0)

mkdir -p ../printer_data
cp -r ../../printer_data/config ../printer_data/config

# Revert back to the saved directory
cd "$current_dir"
