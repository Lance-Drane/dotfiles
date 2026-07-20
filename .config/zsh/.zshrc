# 'man zshoptions' | https://zsh.sourceforge.io/Doc/Release/Options.html
setopt aliases
setopt always_to_end
setopt auto_cd
setopt auto_menu
setopt auto_param_slash
setopt auto_pushd
setopt c_bases
setopt extended_glob
setopt extended_history
setopt glob_dots
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_verify
setopt interactive_comments
setopt multios
setopt prompt_cr
setopt prompt_percent
setopt prompt_sp
setopt share_history
setopt typeset_silent
unsetopt auto_remove_slash
unsetopt beep
unsetopt bg_nice
unsetopt flow_control
unsetopt list_types
unsetopt prompt_bang
unsetopt prompt_subst

# History
HISTSIZE=8192
SAVEHIST=${HISTSIZE}
HISTFILE="${XDG_STATE_HOME}/zsh/history"

autoload -Uz colors && colors

# Basic auto/tab complete:
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # ignore case when globbing
zstyle ':completion:*' menu select
zmodload zsh/complist
fpath=( "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zfuncs" "${fpath[@]}" )
#autoload -Uz add-zsh-hook

# Common shell files - aliases, functions
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/theme-rc"
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/common-rc"

# need more timeout for fzf-git
# export ZVM_READKEY_ENGINE=zle
export KEYTIMEOUT=200  # hundreths of a second

# general terminal keybindings
bindkey '^[[H' beginning-of-line # Home key
bindkey '^[[F' end-of-line # End key
bindkey '^[[3~' delete-char # Del key
bindkey '^[[1;5C' forward-word # Ctrl + right arrow
bindkey '^[[1;5D' backward-word # Ctrl + left arrow
bindkey '^H' backward-kill-word # Ctrl + Backspace OR Ctrl + H
bindkey '^[[3;5~' kill-word # Ctrl + Delete

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# # Change cursor shape for different vi modes.
function zle-keymap-select {
    case $KEYMAP in
	vicmd) echo -ne '\e[1 q';;      # block
	viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle_highlight=('paste:none')
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line && zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[3~' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[3~' vi-delete

# FZF integration
# CTRL + R - paste selected command from history into command line
# ALT + C - cd into selected directory
# CTRL + T - paste selected file path(s) into command line
command -v fzf &>/dev/null && {
  {
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
  } || source <(fzf --zsh)
  source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/fzf-git.sh"
}

# prompt
command -v starship &>/dev/null && eval "$(starship init zsh)"

# Load syntax highlighting; should be last.
[ -f /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] && source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

