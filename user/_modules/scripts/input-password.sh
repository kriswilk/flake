#!/bin/env bash
set -euo pipefail

fuzzel --dmenu \
       --prompt-only "󰌆  " \
       --placeholder "" \
       --password \
       --width 30