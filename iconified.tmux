#!/usr/bin/env bash

CURRENT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

ICONIFIED_OPTION="@iconified_flavour"

PREFIX_SEGMENT="#{?client_prefix, #[fg=red], #[fg=green]}"
CLIENTS_SEGMENT="#{?session_many_attached,  #{session_attached},}"
TIME_SEGMENT="  %H:%M"
HOSTNAME_SEGMENT="  #h"

BATTERY_SCRIPT="#(battery)"
WIFI_SCRIPT="#(wifi_network)"

STATUS_LEFT="   #S ${PREFIX_SEGMENT} #[fg=default] ${CLIENTS_SEGMENT}"
STATUS_RIGHT=" ${BATTERY_SCRIPT} | ${WIFI_SCRIPT} | ${TIME_SEGMENT} | ${HOSTNAME_SEGMENT} "

_get_tmux_option()
{
    local option="$1" default_value="$2"
    local option_value="$(tmux show-option -gqv "$option")"

    echo "${option_value:-${default_value}}"
}

main()
{
    local flavour="$(_get_tmux_option "${ICONIFIED_OPTION}")"

    [ -z "${flavour}" ] && exit

    tmux source-file "${CURRENT_DIR}/iconified_${flavour}.tmuxtheme"
    tmux set -g status-left "$(_get_tmux_option '@iconified_status_left' "${STATUS_LEFT}")"
    tmux set -g status-right "$(_get_tmux_option '@iconified_status_right' "${STATUS_RIGHT}")"
}

main
