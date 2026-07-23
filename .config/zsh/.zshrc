# make sure required directories exist if they don't
[[ ! -e "${XDG_STATE_HOME:=$HOME/.local/state}/zsh" ]] && mkdir -p "${XDG_STATE_HOME}/zsh"
[[ ! -e "${XDG_CACHE_HOME:=$HOME/.cache}/zsh" ]] && mkdir -p "${XDG_CACHE_HOME}/zsh"

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
unsetopt case_glob
unsetopt flow_control
unsetopt list_types
unsetopt prompt_bang
unsetopt prompt_subst

# History
HISTSIZE=8192
SAVEHIST=${HISTSIZE}
HISTFILE="${XDG_STATE_HOME}/zsh/history"

# Common shell files - aliases, functions, themes
source "${XDG_CONFIG_HOME:=$HOME/.config}/shell/theme-rc.sh"
source "${XDG_CONFIG_HOME}/shell/common-rc.sh"

autoload -Uz colors && colors

# Basic auto/tab complete
# zstyle completion rules: :completion:<function>:<completer>:<command>:<argument>:<tag>
fpath=( "${XDG_CONFIG_HOME}/zsh/zfuncs" "${fpath[@]}" )  # TODO consider putting these completion files in dotfiles version control
autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}"
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME}/zsh/zcompcache"
zstyle ':completion:*' use-cache 'true'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # case-insensitive completion
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true  # rehash automatically if adding new executables in $PATH
zstyle ':completion:*' sort false  # sort options appear in the order defined in the completion file
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*:*:-command-:*' group-order builtins functions aliases commands

zmodload zsh/complist
autoload -Uz add-zsh-hook

# colored completion listings, see "Standard Tags" section of "man zshcompsys" | https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Standard-Tags
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:aliases' list-colors '=*=38;5;128' # purple
zstyle ':completion:*:builtins' list-colors '=*=38;5;51' # cyan
zstyle ':completion:*:commands' list-colors "=*=${DF_THEME_EXECUTABLE}"
zstyle ':completion:*:directory-stack' list-colors "=(#b) #([0-9]#)*( *)==38;5;33=${DF_THEME_DIRECTORY}" # purple on left, blue on right (used with cd -0, for example)
zstyle ':completion:*:functions' list-colors '=*=38;5;134' # purple
zstyle ':completion:*:manuals' list-colors '=*=38;5;34' # darker green
zstyle ':completion:*:options' list-colors '=^(-- *)=38;5;71' # dark green on left, white on right
zstyle ':completion:*:parameters' list-colors '=*=38;5;28' # dark green
zstyle ':completion:*:reserved-words' list-colors '=*=31' # red
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# prettier kill
zstyle ':completion:*:processes' command 'ps -au $LOGNAME -o pid,ppid,cmd'
zstyle ':completion:*:*:kill:*' list-colors "=(#b) #([0-9]#) #([0-9]#)*=${DF_THEME_EXECUTABLE}=38;5;124=34" # pid in red, parent pid in blue
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single
zstyle ':completion:*:*:killall:*:processes-names' list-colors "=*=${DF_THEME_EXECUTABLE}"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:*:killall:*' force-list always

# man page completion
zstyle ':completion:*:manuals'    separate-sections true
#zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

# if hosts are listed in ~/.ssh/config , improve completions for ssh
zstyle ':completion:*:ssh:argument-1:'       tag-order  hosts users
zstyle ':completion:*:ssh:argument-1:*'      sort       'true'
zstyle ':completion:*:scp:argument-rest:'    tag-order  hosts files users
zstyle ':completion:*:scp:argument-rest:'    sort       'true'
zstyle ':completion:*:(ssh|scp|rdp):*:hosts' hosts

# better git completions
zstyle ':completion:*:git-*:argument-rest:heads'           ignored-patterns '(FETCH_|ORIG_|*/|)HEAD'
zstyle ':completion:*:git-*:argument-rest:heads-local'     ignored-patterns '(FETCH_|ORIG_|)HEAD'
zstyle ':completion:*:git-*:argument-rest:heads-remote'    ignored-patterns '*/HEAD'
zstyle ':completion:*:git-*:argument-rest:commits'         ignored-patterns '*'
zstyle ':completion:*:git-*:argument-rest:commit-objects'  ignored-patterns '*'
zstyle ':completion:*:git-*:argument-rest:recent-branches' ignored-patterns '*'

# for certain commands, don't do duplicate completions
zstyle ':completion:*:(rm|kill|diff):*' ignore-line "other"
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# increase KEYTIMEOUT for some other functions
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

bindkey -M menuselect '^xi' vi-insert  # Ctrl+x , i - switch to interactive mode in completion menu

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
  if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
  else
    source <(fzf --zsh)
  fi
  # CTRL + G , then '?' , gives the keybinding list
  source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/lib/fzf-git.sh"
}

# prompt
command -v starship >/dev/null && eval "$(starship init zsh)"

# Load autosuggestions
_personal_zsh_autosuggestions_loaded=''
if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  _personal_zsh_autosuggestions_loaded='1'
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  _personal_zsh_autosuggestions_loaded='1'
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
[[ -n $_personal_zsh_autosuggestions_loaded ]] && {
  bindkey '^ ' autosuggest-accept  # Ctrl + Space - accepts the suggestion, but does not execute
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)  # autosuggest history first, then try a completion
}
unset _personal_zsh_autosuggestions_loaded

# Load syntax highlighting; must be after everything else.
[[ -f /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]] && source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

