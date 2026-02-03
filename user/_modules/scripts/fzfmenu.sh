#!/usr/bin/env bash
foot --app-id="fzfmenu" bash -c "fzf \"\$@\" < /proc/$$/fd/0 > /proc/$$/fd/1" -- "$@"
