#!/bin/env bash
set -euo pipefail

fuzzel --dmenu \
       --prompt-only "Type 'yes' to confirm: " \
       --placeholder "" \
       --auto-select \
       --width 30