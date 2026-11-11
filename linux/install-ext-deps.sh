#!/bin/sh
# Install the 3rd-party programs the Python apps run, from apt. The apps
# start without them, but the feature that needs one says "not found".
# Run as yourself: sudo asks for the password once.
# Also shipped in the binary release, as linux/install-ext-deps.sh.
set -e

sudo apt-get update

# edx: f4 doc lookup (cppdoc) and the format commands
sudo apt-get install -y clangd clang-format

# dbx: configure, build and debug (Ninja Multi-Config, gdb >= 14 for DAP)
sudo apt-get install -y cmake ninja-build build-essential gdb

# edx git marks, gtx; ccx remote panels
sudo apt-get install -y git openssh-client

# clipboard paste (pylib clipkit): Wayland, then X11
sudo apt-get install -y wl-clipboard xclip

# utx: without it, utx downloads a static ffmpeg on first use
sudo apt-get install -y ffmpeg

# ai-wrap: mic capture (parecord)
sudo apt-get install -y pulseaudio-utils

# the release's install scripts: unpack password-protected apps
sudo apt-get install -y unzip
