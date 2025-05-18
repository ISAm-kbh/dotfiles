#!/usr/bin/env zsh
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/tsessionizer"
CONFIG_FILE="$CONFIG_DIR/tsessionizer.conf"

# Variables derived from config file:
# 1. TS_SEARCH_PATHS
#   ex. TS_SEARCH_PATHS=(~/ ~/MadLab)
#   The paths to search through with the specified max depth
# 2. TS_MAX_DEPTH
#   ex. TS_MAX_DEPTH=2
#   Max depth to search into the paths for directories
# 3. TS_EXTRA_SEARCH_PATHS
#   ex. TS_EXTRA_SEARCH_PATHS=(~/.config:1)
#   Paths that can have their own search depths specified, which can be different
#   from the max depth

# Source the config file if found
if [[ -f $CONFIG_FILE ]]; then
    source $CONFIG_FILE
fi

# Check if tmux & fzf exist
# void
dep_check() {
    if ! command -v tmux &> /dev/null; then
        echo "tmux is not installed"
        exit 1
    fi

    if ! command -v fzf &> /dev/null; then
        echo "fzf is not installed"
        exit 1
    fi
}

# Actually step into the tmux session
# 1 - session name
switch_to() {
    if [[ -z  $TMUX ]]; then
        tmux attach-session -t $1
    else
        tmux switch-client -t $1
    fi
}

# Returns whether or not the session exists already
# 1 - session name
has_session() {
    tmux list-sessions | grep -q "^$1:"
}

# Sources a script in the project dir, or uses the default script to run setup commands
# on the terminal environment within the session
# 1 - session name
# 2 - session directory
setup_session() {
    if [[ -f "$2/.tsess" ]]; then
        tmux send-keys -t $1 "source $2/.tsess" Enter
    elif [[ -f "$HOME/.tsess" ]]; then
        tmux send-keys -t $1 "source $HOME/.tsess" Enter
    fi
}

dep_check

# Define config variables if they are not found
if [[ -z $TS_SEARCH_PATHS ]]; then
    TS_SEARCH_PATHS=(~/)
fi

if [[ $#TS_EXTRA_SEARCH_PATHS -gt 0 ]]; then
    TS_SEARCH_PATHS+=$TS_EXTRA_SEARCH_PATHS
fi

# Utility function that finds directories, by searching through the search paths
# and also listing currently opened sessions
# The whole list goes to the functions outstream
# Void
find_dirs() {
    # List tmux sessions
    # Maybe remove this idk if this is wanted
    if [[ -n $TMUX ]]; then
        current_session=$(tmux display-message -p '#S')
        tmux list-sessions -F "[TMUX] #{session_name}" 2>/dev/null | grep -vfx "[TMUX] $current_session"
    else
        tmux list-sessions -F "[TMUX] #{session_name}" 2>/dev/null
    fi

    # Search paths, if there is a :number after the path search using the number. If not,
    # use default search depth
    for entry in $TS_SEARCH_PATHS; do
        if [[ $entry =~ '^([^:]+):([0-9]+)$' ]]; then
            dir_path=$match[1]
            depth=$match[2]
        else
            dir_path=$entry
        fi

        if [[ -d $dir_path ]]; then
            find $dir_path -mindepth 1 -maxdepth "${depth:-${TS_MAX_DEPTH:-1}}" -path '*/.git' -prune -o -type d -print
        fi
    done
}

# Pull up fzf if the script isnt ran with a name already
if  [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find_dirs | fzf)
fi

# If we cancel our search in fzf, it will return nothing. Then we quit as well
if [[ -z $selected ]]; then
    exit 0
fi

# If what we selected is a open tmux session, trim out the prefix
if [[ $selected =~ '^\[TMUX\]\ (.+)$' ]]; then
    selected=$match[1]
    echo $match[1]
fi

# Get the name of the session via trimming the fluff of the path
selected_name=$(basename $selected | tr . _)
tmux_running=$(pgrep tmux)

# Setup the session if tmux isn't currently running
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -ds $selected_name -c $selected
    setup_session $selected_name $selected
fi

# Similarly, if the session isn't already opened, set it up
if ! has_session $selected_name; then
    tmux new-session -ds $selected_name -c $selected
    setup_session $selected_name $selected
fi

# Send it!
switch_to $selected_name
