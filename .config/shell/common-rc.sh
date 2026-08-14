### This file is meant to have common configuration across all POSIX shells. It gets sourced early in the main RC file but after the theme file.

# yazi wrapper which allows using 'q' to change to current working directory when exiting
# (use 'Q' to stay in directory where yazi was launched)
yazi() {
	set -- "$@" --cwd-file "$(mktemp -t yazi-cwd.XXXXXX)"
	command yazi "$@"
	shift $(($# - 1))
	set -- "$(
		command cat <"$1"
		printf .
		command rm -f -- "$1"
	)"
	set -- "${1%.}"
	if [ "$1" != "$PWD" ] && [ -d "$1" ]; then cd -- "$1" || printf '%s\n' "directory $1 does not exist (was it removed?)" >&2; fi
}
alias y='yazi'

# flags to always include with common commands
alias ls='ls -haN --color=auto --hyperlink=auto --group-directories-first'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias mkdir='mkdir -p'
alias tree='tree -a -I .git -I .venv -I node_modules -I target'
alias eza='eza -agX --icons --hyperlink --group-directories-first -I .git -I .venv -I node_modules -I target'
alias bc='bc -lq'

# set up nohup so it can deal with an argument that is an alias name - from POSIX 'alias' page examples
alias nohup="nohup "

# FD, remember to never use the ubuntu version because it's out of date and is called 'fdfind'
alias fd='fd --hyperlink=auto'

# FZF
export FZF_CTRL_R_OPTS="--bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort' --color header:italic --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_ALT_C_OPTS="--walker-skip .git,node_modules,target,.venv --preview 'tree -C {}'"
export FZF_CTRL_T_OPTS="--walker-skip .git,node_modules,target,.venv --preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# directory simplification
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'

# $HOME cleanup
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

# configure kitty extensions
[ "$TERM" = "xterm-kitty" ] && {
	# Make sure kitty can still ssh
	alias ssh="kitten ssh"
	# note that rg only gives hyperlinks for the numbers but allows hyperlinks in the rest of the line, kitty forces the whole line to link to the file
	alias rg="rg --hyperlink-format=kitty"
}

### CUSTOM ALIASES ###

alias dotfiles='git --git-dir ~/.dotfiles-git --work-tree ~'

# yt-dlp dependencies needed: python, ffmpeg, ffprobe, python-mutagen
alias yt-video='yt-dlp -f bestvideo+bestaudio --embed-chapters --embed-metadata --embed-thumbnail --embed-subs --sub-langs "en.*"'
alias yt-music='yt-dlp -f bestaudio -x --embed-thumbnail --embed-metadata --audio-format mp3 --audio-quality 0 -o "%(album_artist)s/%(album)s/%(playlist_index)s_%(title)s.%(ext)s" --parse-metadata "%(album_artist,channel,creator,artist|Unknown)s:%(album_artist)s"'
alias yt-meta='yt-dlp --embed-metadata --skip-download --write-thumbnail'

[ -f "${XDG_CONFIG_HOME}/shell/common-rc.private.sh" ] && . "${XDG_CONFIG_HOME}/shell/common-rc.private.sh"
