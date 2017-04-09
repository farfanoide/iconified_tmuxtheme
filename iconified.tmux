#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

iconified_option="@iconified"
default_flavour='dark'

get_tmux_option()
{
    local option="$1" default_value="$2"
    local option_value="$(tmux show-option -gqv "$option")"

    echo "${option_value:-${default_value}}"
}

main()
{
    local flavour="$(get_tmux_option "${iconified_option}" "${default_flavour}")"
    tmux source-file "$CURRENT_DIR/iconified_${flavour}.tmuxtheme"
}

main
