#!/usr/bin/env bash

CURRENT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
ICONIFIED_OPTION_PREFIX='@iconified_'

_iconified_option()
{
    local option="$1" default_value="$2"
    local option_value="$(tmux show-option -gqv "${ICONIFIED_OPTION_PREFIX}${option}")"

    echo "${option_value:-${default_value}}"
}

main()
{
    local flavour="$(_iconified_option "flavour")"

    # Return early if no flavour is configured for the script
    [ -z "${flavour}" ] && exit

    SESSION_ICON="$(_iconified_option 'session_icon' " ")"

    PREFIX_ICON="$(_iconified_option 'prefix_icon' '')"
    PREFIX_SENT_ICON="$(_iconified_option 'prefix_sent_icon' '')"
    PREFIX_SEGMENT="#{?client_prefix, #[fg=red]${PREFIX_SENT_ICON}, #[fg=green]${PREFIX_ICON}}"
    CLIENTS_SEGMENT="#{?session_many_attached,  #{session_attached},}"

    TIME_ICON="$(_iconified_option 'session_icon' " ")"
    TIME_SEGMENT="${TIME_ICON} %H:%M"

    HOSTNAME_ICON="$(_iconified_option 'hostname_icon' ' ')"
    HOSTNAME_SEGMENT="${HOSTNAME_ICON} #h"

    STATUS_LEFT=" ${SESSION_ICON} #S ${PREFIX_SEGMENT} #[fg=default] ${CLIENTS_SEGMENT}"

    BATTERY_SCRIPT="#($(_iconified_option 'battery_script' 'battery'))"
    WIFI_SCRIPT="#($(_iconified_option 'wifi_script' 'wifi_network'))"

    STATUS_RIGHT=" ${BATTERY_SCRIPT} | ${WIFI_SCRIPT} | ${TIME_SEGMENT} | ${HOSTNAME_SEGMENT} "

    tmux source-file "${CURRENT_DIR}/iconified_${flavour}.tmuxtheme"
    tmux set -g status-left "$(_iconified_option 'status_left' "${STATUS_LEFT}")"
    tmux set -g status-right "$(_iconified_option 'status_right' "${STATUS_RIGHT}")"
}

main
