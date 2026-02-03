#!/usr/bin/env bash
set -euo pipefail

list="$(cat "$XDG_DATA_HOME/flake-assets/symbols/math.txt")"
dmenu="fuzzel --dmenu"
# WIP: once fuzzel fixes "nth-delimiter" debug output bug, this can be simplified!
echo -e "$list" | $dmenu | cut -d ' ' -f 1 | tr -d '\n' | wl-copy
