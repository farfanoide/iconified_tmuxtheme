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

    CLIENTS_ICON="$(_iconified_option 'clients_icon' ' ')"
    CLIENTS_SEGMENT="#{?session_many_attached, ${CLIENTS_ICON}#{session_attached},}"

    TIME_ICON="$(_iconified_option 'session_icon' " ")"
    TIME_SEGMENT="${TIME_ICON} %H:%M"

    HOSTNAME_ICON="$(_iconified_option 'hostname_icon' ' ')"
    HOSTNAME_SEGMENT="${HOSTNAME_ICON} #h"

    STATUS_LEFT=" ${SESSION_ICON} #S ${PREFIX_SEGMENT} #[fg=default] ${CLIENTS_SEGMENT}"

    BATTERY_SCRIPT="#($(_iconified_option 'battery_script' 'battery'))"
    WIFI_SCRIPT="#($(_iconified_option 'wifi_script' 'wifi_network'))"

    STATUS_RIGHT=" ${BATTERY_SCRIPT} | ${WIFI_SCRIPT} | ${TIME_SEGMENT} | ${HOSTNAME_SEGMENT} "

    WINDOW_LINKED_ICON="$(_iconified_option 'window_linked_icon' ' ')"
    WINDOW_LINKED_SEGMENT="#{?window_linked,${WINDOW_LINKED_ICON},}"

    WINDOW_ZOOMED_ICON="$(_iconified_option 'window_zoomed_icon' ' ')"
    WINDOW_ZOOMED_SEGMENT="#{?window_zoomed_flag,${WINDOW_ZOOMED_ICON},}"

    WINDOW_LAST_ICON="$(_iconified_option 'window_last_icon' ' ')"
    WINDOW_LAST_SEGMENT="#{?window_last_flag,${WINDOW_LAST_ICON},}"

    WINDOW_SILENCED_ICON="$(_iconified_option 'window_silenced_icon' ' ')"
    WINDOW_SILENCED_SEGMENT="#{?window_silence_flag,${WINDOW_SILENCED_ICON},}"

    WINDOW_ACTIVE_ICON="$(_iconified_option 'window_active_icon' ' ')"
    WINDOW_ACTIVE_SEGMENT="#[fg=red]#{?window_activity_flag, ${WINDOW_ACTIVE_ICON},}#[fg=default]"

    PANE_SYNC_ICON="$(_iconified_option 'pane_sync_icon' '')"
    PANE_SYNC_SEGMENT="#{?pane_synchronized, ${PANE_SYNC_ICON},}"

    WINDOW_STATUS=" #I:#W ${WINDOW_LINKED_SEGMENT}${WINDOW_ZOOMED_SEGMENT}${WINDOW_SILENCED_SEGMENT}${WINDOW_LAST_SEGMENT}${WINDOW_ACTIVE_SEGMENT}#[fg=default]"
    CURRENT_WINDOW_STATUS="#I:#W ${PANE_SYNC_SEGMENT}${WINDOW_ZOOMED_SEGMENT}"


    tmux source-file "${CURRENT_DIR}/iconified_${flavour}.tmuxtheme"
    tmux set -g status-left "$(_iconified_option 'status_left' "${STATUS_LEFT}")"
    tmux set -g status-right "$(_iconified_option 'status_right' "${STATUS_RIGHT}")"
    tmux set -g window-status-format "${WINDOW_STATUS}"
    tmux set -g window-status-current-format "${CURRENT_WINDOW_STATUS}"
}

main
