# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# My command aliases :)

command -v nvim &>/dev/null && alias nv="nvim"
command -v bat &>/dev/null && alias cat="bat"
command -v lsd &>/dev/null && alias ls="lsd -lA"
command -v duf &>/dev/null && alias df="duf"
command -v fd &>/dev/null  && alias find="fd"

## Special Ones :)

command -v jq &>/dev/null && alias get-ip="curl --silent https://ipinfo.io/ | jq -r ".ip""

## Enabling fzf for Ctrl+R ;)

command -v fzf &>/dev/null && eval "$(fzf --bash)"




command -v code-insiders &>/dev/null && alias code=code-insiders
