#!/usr/bin/env bash

CURRENT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

ICONIFIED_OPTION="@iconified_flavour"

main()
{
    local flavour="$(tmux show-option -gqv "${ICONIFIED_OPTION}")"

    if [ ! -z "${flavour}" ]; then
        tmux source-file "${CURRENT_DIR}/iconified_${flavour}.tmuxtheme"
    fi
}

main
