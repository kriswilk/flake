#!/bin/env bash
set -euo pipefail

dmenu="fuzzel --dmenu --minimal-lines"
cliphist list | $dmenu | cliphist decode | wl-copy