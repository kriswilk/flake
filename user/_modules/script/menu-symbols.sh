#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC2086
cat "$XDG_DATA_HOME/flake-asset/symbol/"${1:-*} |
  fzf --exact --no-sort |
  cut -d ' ' -f 1 |
  tr -d '\n' |
  wl-copy
