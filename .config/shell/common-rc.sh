# yazi wrapper which allows using 'q' to change to current working directory when exiting
# (use 'Q' to stay in directory where yazi was launched)
y() {
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

# flags to always include with common commands
alias ls='ls -haN --color=auto --hyperlink --group-directories-first'
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

# fix stupid variance between binary names across different Linux distros
command -v batcat >/dev/null && alias bat='batcat'
command -v fdfind >/dev/null && alias fd='fdfind'

# directory simplification
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'

# $HOME cleanup
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

# Make sure kitty can still ssh
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitten ssh"

### CUSTOM ALIASES ###

alias dotfiles='git --git-dir ~/.dotfiles-git --work-tree ~'

# yt-dlp dependencies needed: python, ffmpeg, ffprobe, python-mutagen
alias yt-video='yt-dlp -f bestvideo+bestaudio --embed-chapters --embed-metadata --embed-thumbnail --embed-subs --sub-langs "en.*"'
alias yt-music='yt-dlp -f bestaudio -x --embed-thumbnail --embed-metadata --audio-format mp3 --audio-quality 0 -o "%(album_artist)s/%(album)s/%(playlist_index)s_%(title)s.%(ext)s" --parse-metadata "%(album_artist,channel,creator,artist|Unknown)s:%(album_artist)s"'
alias yt-meta='yt-dlp --embed-metadata --skip-download --write-thumbnail'

[ -f "${XDG_CONFIG_HOME}/shell/common-rc.private.sh" ] && . "${XDG_CONFIG_HOME}/shell/common-rc.private.sh"
