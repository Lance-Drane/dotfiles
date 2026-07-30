# see https://draculatheme.com/spec as an example of colors

# ANSI escape codes - Select Graphic Rendition subset

# types of files from running stat - see https://github.com/coreutils/coreutils/blob/952435f0799e440165f97108531c4fb5741fa583/src/ls.c#L4930
# files
export DF_THEME_SETUID='01;38;2;248;248;242;48;2;255;85;85'
export DF_THEME_SETGID='01;38;2;33;34;44;48;2;241;250;140'
export DF_THEME_CAPABILITY='04'
export DF_THEME_EXECUTABLE='01;03;38;2;80;250;123'
export DF_THEME_MULTIHARDLINK='01;38;2;255;184;108'
# directories
export DF_THEME_DIRECTORY='01;38;2;189;147;249'
export DF_THEME_STICKY='38;2;248;248;242;48;2;189;147;249'
export DF_THEME_OW='38;2;189;147;249;48;2;80;250;123'
export DF_THEME_STICKY_OW='38;2;33;34;44;48;2;80;250;123'
# special files
export DF_THEME_SYMLINK='01;04;38;2;139;233;253'
export DF_THEME_FIFO='04;48;2;33;34;44;38;2;241;250;140'
export DF_THEME_SOCKET='01;04;38;2;255;121;198'
export DF_THEME_BLOCK='04;38;2;33;34;44;48;2;255;184;108'
export DF_THEME_CHARACTER='04;38;2;248;248;242;48;2;255;184;108'
export DF_THEME_DOOR='01;04;38;2;255;121;198'
export DF_THEME_ORPHAN='04;48;2;33;34;44;38;2;255;85;85;01' # nonexistent files i.e. symlink to nowhere
# media types
export DF_THEME_ARCHIVE='03;38;2;255;85;85'
export DF_THEME_AUDIO='03;38;2;139;233;253'
export DF_THEME_BACKUP='00;38;2;98;114;164'
export DF_THEME_IMAGE='03;38;2;255;121;198'

# colored man pages, see https://unix.stackexchange.com/questions/119/colors-in-man-pages
export LESS="-R --use-color"
#export MANPAGER="less -s -M -Dd+g -Du+b"
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER="less -s -M +Gg"
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;34m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;45;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;36m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1
#export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

### CLI utils ###
# unused codes, or consistent codes:
# lc = LEFT, rc = RIGHT, ec = END, rs = reset color, no = normal, fi = regular file, cl = CLR_TO_EOL
export LS_COLORS="rs=0:mi=00:su=${DF_THEME_SETUID}:sg=${DF_THEME_SETGID}:ca=${DF_THEME_CAPABILITY}:ex=${DF_THEME_EXECUTABLE}:mh=${DF_THEME_MULTIHARDLINK}:di=${DF_THEME_DIRECTORY}:st=${DF_THEME_STICKY}:ow=${DF_THEME_OW}:tw=${DF_THEME_STICKY_OW}:ln=${DF_THEME_SYMLINK}:pi=${DF_THEME_FIFO}:so=${DF_THEME_SOCKET}:bd=${DF_THEME_BLOCK}:cd=${DF_THEME_CHARACTER}:do=${DF_THEME_DOOR}:or=${DF_THEME_ORPHAN}:*.tar=${DF_THEME_ARCHIVE}:*.tgz=${DF_THEME_ARCHIVE}:*.arc=${DF_THEME_ARCHIVE}:*.arj=${DF_THEME_ARCHIVE}:*.taz=${DF_THEME_ARCHIVE}:*.lha=${DF_THEME_ARCHIVE}:*.lz4=${DF_THEME_ARCHIVE}:*.lzh=${DF_THEME_ARCHIVE}:*.lzma=${DF_THEME_ARCHIVE}:*.tlz=${DF_THEME_ARCHIVE}:*.txz=${DF_THEME_ARCHIVE}:*.tzo=${DF_THEME_ARCHIVE}:*.t7z=${DF_THEME_ARCHIVE}:*.zip=${DF_THEME_ARCHIVE}:*.z=${DF_THEME_ARCHIVE}:*.dz=${DF_THEME_ARCHIVE}:*.gz=${DF_THEME_ARCHIVE}:*.lrz=${DF_THEME_ARCHIVE}:*.lz=${DF_THEME_ARCHIVE}:*.lzo=${DF_THEME_ARCHIVE}:*.xz=${DF_THEME_ARCHIVE}:*.zst=${DF_THEME_ARCHIVE}:*.tzst=${DF_THEME_ARCHIVE}:*.bz2=${DF_THEME_ARCHIVE}:*.bz=${DF_THEME_ARCHIVE}:*.tbz=${DF_THEME_ARCHIVE}:*.tbz2=${DF_THEME_ARCHIVE}:*.tz=${DF_THEME_ARCHIVE}:*.deb=${DF_THEME_ARCHIVE}:*.rpm=${DF_THEME_ARCHIVE}:*.jar=${DF_THEME_ARCHIVE}:*.war=${DF_THEME_ARCHIVE}:*.ear=${DF_THEME_ARCHIVE}:*.sar=${DF_THEME_ARCHIVE}:*.rar=${DF_THEME_ARCHIVE}:*.alz=${DF_THEME_ARCHIVE}:*.ace=${DF_THEME_ARCHIVE}:*.zoo=${DF_THEME_ARCHIVE}:*.cpio=${DF_THEME_ARCHIVE}:*.7z=${DF_THEME_ARCHIVE}:*.rz=${DF_THEME_ARCHIVE}:*.cab=${DF_THEME_ARCHIVE}:*.wim=${DF_THEME_ARCHIVE}:*.swm=${DF_THEME_ARCHIVE}:*.dwm=${DF_THEME_ARCHIVE}:*.esd=${DF_THEME_ARCHIVE}:*.avif=${DF_THEME_IMAGE}:*.jpg=${DF_THEME_IMAGE}:*.jpeg=${DF_THEME_IMAGE}:*.mjpg=${DF_THEME_IMAGE}:*.mjpeg=${DF_THEME_IMAGE}:*.gif=${DF_THEME_IMAGE}:*.bmp=${DF_THEME_IMAGE}:*.pbm=${DF_THEME_IMAGE}:*.pgm=${DF_THEME_IMAGE}:*.ppm=${DF_THEME_IMAGE}:*.tga=${DF_THEME_IMAGE}:*.xbm=${DF_THEME_IMAGE}:*.xpm=${DF_THEME_IMAGE}:*.tif=${DF_THEME_IMAGE}:*.tiff=${DF_THEME_IMAGE}:*.png=${DF_THEME_IMAGE}:*.svg=${DF_THEME_IMAGE}:*.svgz=${DF_THEME_IMAGE}:*.mng=${DF_THEME_IMAGE}:*.pcx=${DF_THEME_IMAGE}:*.mov=${DF_THEME_IMAGE}:*.mpg=${DF_THEME_IMAGE}:*.mpeg=${DF_THEME_IMAGE}:*.m2v=${DF_THEME_IMAGE}:*.mkv=${DF_THEME_IMAGE}:*.webm=${DF_THEME_IMAGE}:*.webp=${DF_THEME_IMAGE}:*.ogm=${DF_THEME_IMAGE}:*.mp4=${DF_THEME_IMAGE}:*.m4v=${DF_THEME_IMAGE}:*.mp4v=${DF_THEME_IMAGE}:*.vob=${DF_THEME_IMAGE}:*.qt=${DF_THEME_IMAGE}:*.nuv=${DF_THEME_IMAGE}:*.wmv=${DF_THEME_IMAGE}:*.asf=${DF_THEME_IMAGE}:*.rm=${DF_THEME_IMAGE}:*.rmvb=${DF_THEME_IMAGE}:*.flc=${DF_THEME_IMAGE}:*.avi=${DF_THEME_IMAGE}:*.fli=${DF_THEME_IMAGE}:*.flv=${DF_THEME_IMAGE}:*.gl=${DF_THEME_IMAGE}:*.dl=${DF_THEME_IMAGE}:*.xcf=${DF_THEME_IMAGE}:*.xwd=${DF_THEME_IMAGE}:*.yuv=${DF_THEME_IMAGE}:*.cgm=${DF_THEME_IMAGE}:*.emf=${DF_THEME_IMAGE}:*.ogv=${DF_THEME_IMAGE}:*.ogx=${DF_THEME_IMAGE}:*.aac=${DF_THEME_AUDIO}:*.au=${DF_THEME_AUDIO}:*.flac=${DF_THEME_AUDIO}:*.m4a=${DF_THEME_AUDIO}:*.mid=${DF_THEME_AUDIO}:*.midi=${DF_THEME_AUDIO}:*.mka=${DF_THEME_AUDIO}:*.mp3=${DF_THEME_AUDIO}:*.mpc=${DF_THEME_AUDIO}:*.ogg=${DF_THEME_AUDIO}:*.ra=${DF_THEME_AUDIO}:*.wav=${DF_THEME_AUDIO}:*.oga=${DF_THEME_AUDIO}:*.opus=${DF_THEME_AUDIO}:*.spx=${DF_THEME_AUDIO}:*.xspf=${DF_THEME_AUDIO}:*~=${DF_THEME_BACKUP}:*#=${DF_THEME_BACKUP}:*.bak=${DF_THEME_BACKUP}:*.crdownload=${DF_THEME_BACKUP}:*.dpkg-dist=${DF_THEME_BACKUP}:*.dpkg-new=${DF_THEME_BACKUP}:*.dpkg-old=${DF_THEME_BACKUP}:*.dpkg-tmp=${DF_THEME_BACKUP}:*.old=${DF_THEME_BACKUP}:*.orig=${DF_THEME_BACKUP}:*.part=${DF_THEME_BACKUP}:*.rej=${DF_THEME_BACKUP}:*.rpmnew=${DF_THEME_BACKUP}:*.rpmorig=${DF_THEME_BACKUP}:*.rpmsave=${DF_THEME_BACKUP}:*.swp=${DF_THEME_BACKUP}:*.tmp=${DF_THEME_BACKUP}:*.ucf-dist=${DF_THEME_BACKUP}:*.ucf-new=${DF_THEME_BACKUP}:*.ucf-old=${DF_THEME_BACKUP}:"
# man 5 eza_colors
export EZA_COLORS='uu=36:uR=31:un=35:gu=37:da=2;34:ur=34:uw=95:ux=36:ue=36:gr=34:gw=35:gx=36:tr=34:tw=35:tx=36:xx=95:'
# mt = match , fn = filename, ln = line number, bn = byte offset, se=separators
export GREP_COLORS='mt=1;38;2;255;85;85:fn=38;2;255;121;198:ln=38;2;80;250;123:bn=38;2;80;250;123:se=38;2;139;233;253'
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:-} --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
