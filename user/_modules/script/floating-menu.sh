#!/usr/bin/env bash
set -euo pipefail

exec foot --app-id="floating-menu" bash -c "$*" &
