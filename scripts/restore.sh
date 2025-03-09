#!/usr/bin/env bash

clear

# Save current working directory
current_dir="$PWD"

# Change to the script's directory
cd $(dirname $0)

rm -rf ~/printer_data/config
cp -r ../printer_data/config ~/printer_data/config
cp ../home/kevin/.bashrc ~/.bashrc
cp ../home/kevin/.gitconfig ~/.gitconfig

# Revert back to the saved directory
cd "$current_dir"
