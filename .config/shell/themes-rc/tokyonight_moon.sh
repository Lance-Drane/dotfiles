# see https://draculatheme.com/spec as an example of colors

# ANSI escape codes - Select Graphic Rendition subset

# types of files from running stat - see https://github.com/coreutils/coreutils/blob/952435f0799e440165f97108531c4fb5741fa583/src/ls.c#L4930
# files
export DF_THEME_SETUID='38;2;200;211;245;48;2;255;117;127'
export DF_THEME_SETGID='38;2;27;29;43;48;2;255;199;119'
export DF_THEME_CAPABILITY='00'
export DF_THEME_EXECUTABLE='01;38;2;195;232;141'
export DF_THEME_MULTIHARDLINK='01;38;2;255;199;119'
# directories
export DF_THEME_DIRECTORY='01;38;2;130;170;255'
export DF_THEME_STICKY='38;2;200;211;245;48;2;130;170;255'
export DF_THEME_OW='38;2;130;170;255;48;2;195;232;141'
export DF_THEME_STICKY_OW='38;2;27;29;43;48;2;195;232;141'
# special files
export DF_THEME_SYMLINK='01;38;2;101;188;255'
export DF_THEME_FIFO='48;2;27;29;43;38;2;255;199;119'
export DF_THEME_SOCKET='01;38;2;192;153;255'
export DF_THEME_BLOCK='38;2;27;29;43;48;2;255;184;108'
export DF_THEME_CHARACTER='38;2;200;211;245;48;2;255;199;119'
export DF_THEME_DOOR='01;38;2;192;153;255'
export DF_THEME_ORPHAN='48;2;27;29;43;38;2;255;117;127;01' # nonexistent files i.e. symlink to nowhere

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
export LS_COLORS="rs=0:mi=00:su=${DF_THEME_SETUID}:sg=${DF_THEME_SETGID}:ca=${DF_THEME_CAPABILITY}:ex=${DF_THEME_EXECUTABLE}:mh=${DF_THEME_MULTIHARDLINK}:di=${DF_THEME_DIRECTORY}:st=${DF_THEME_STICKY}:ow=${DF_THEME_OW}:tw=${DF_THEME_STICKY_OW}:ln=${DF_THEME_SYMLINK}:pi=${DF_THEME_FIFO}:so=${DF_THEME_SOCKET}:bd=${DF_THEME_BLOCK}:cd=${DF_THEME_CHARACTER}:do=${DF_THEME_DOOR}:or=${DF_THEME_ORPHAN}:*.tar=01;38;2;255;117;127:*.tgz=01;38;2;255;117;127:*.arc=01;38;2;255;117;127:*.arj=01;38;2;255;117;127:*.taz=01;38;2;255;117;127:*.lha=01;38;2;255;117;127:*.lz4=01;38;2;255;117;127:*.lzh=01;38;2;255;117;127:*.lzma=01;38;2;255;117;127:*.tlz=01;38;2;255;117;127:*.txz=01;38;2;255;117;127:*.tzo=01;38;2;255;117;127:*.t7z=01;38;2;255;117;127:*.zip=01;38;2;255;117;127:*.z=01;38;2;255;117;127:*.dz=01;38;2;255;117;127:*.gz=01;38;2;255;117;127:*.lrz=01;38;2;255;117;127:*.lz=01;38;2;255;117;127:*.lzo=01;38;2;255;117;127:*.xz=01;38;2;255;117;127:*.zst=01;38;2;255;117;127:*.tzst=01;38;2;255;117;127:*.bz2=01;38;2;255;117;127:*.bz=01;38;2;255;117;127:*.tbz=01;38;2;255;117;127:*.tbz2=01;38;2;255;117;127:*.tz=01;38;2;255;117;127:*.deb=01;38;2;255;117;127:*.rpm=01;38;2;255;117;127:*.jar=01;38;2;255;117;127:*.war=01;38;2;255;117;127:*.ear=01;38;2;255;117;127:*.sar=01;38;2;255;117;127:*.rar=01;38;2;255;117;127:*.alz=01;38;2;255;117;127:*.ace=01;38;2;255;117;127:*.zoo=01;38;2;255;117;127:*.cpio=01;38;2;255;117;127:*.7z=01;38;2;255;117;127:*.rz=01;38;2;255;117;127:*.cab=01;38;2;255;117;127:*.wim=01;38;2;255;117;127:*.swm=01;38;2;255;117;127:*.dwm=01;38;2;255;117;127:*.esd=01;38;2;255;117;127:*.avif=01;38;2;192;153;255:*.jpg=01;38;2;192;153;255:*.jpeg=01;38;2;192;153;255:*.mjpg=01;38;2;192;153;255:*.mjpeg=01;38;2;192;153;255:*.gif=01;38;2;192;153;255:*.bmp=01;38;2;192;153;255:*.pbm=01;38;2;192;153;255:*.pgm=01;38;2;192;153;255:*.ppm=01;38;2;192;153;255:*.tga=01;38;2;192;153;255:*.xbm=01;38;2;192;153;255:*.xpm=01;38;2;192;153;255:*.tif=01;38;2;192;153;255:*.tiff=01;38;2;192;153;255:*.png=01;38;2;192;153;255:*.svg=01;38;2;192;153;255:*.svgz=01;38;2;192;153;255:*.mng=01;38;2;192;153;255:*.pcx=01;38;2;192;153;255:*.mov=01;38;2;192;153;255:*.mpg=01;38;2;192;153;255:*.mpeg=01;38;2;192;153;255:*.m2v=01;38;2;192;153;255:*.mkv=01;38;2;192;153;255:*.webm=01;38;2;192;153;255:*.webp=01;38;2;192;153;255:*.ogm=01;38;2;192;153;255:*.mp4=01;38;2;192;153;255:*.m4v=01;38;2;192;153;255:*.mp4v=01;38;2;192;153;255:*.vob=01;38;2;192;153;255:*.qt=01;38;2;192;153;255:*.nuv=01;38;2;192;153;255:*.wmv=01;38;2;192;153;255:*.asf=01;38;2;192;153;255:*.rm=01;38;2;192;153;255:*.rmvb=01;38;2;192;153;255:*.flc=01;38;2;192;153;255:*.avi=01;38;2;192;153;255:*.fli=01;38;2;192;153;255:*.flv=01;38;2;192;153;255:*.gl=01;38;2;192;153;255:*.dl=01;38;2;192;153;255:*.xcf=01;38;2;192;153;255:*.xwd=01;38;2;192;153;255:*.yuv=01;38;2;192;153;255:*.cgm=01;38;2;192;153;255:*.emf=01;38;2;192;153;255:*.ogv=01;38;2;192;153;255:*.ogx=01;38;2;192;153;255:*.aac=00;38;2;101;188;255:*.au=00;38;2;101;188;255:*.flac=00;38;2;101;188;255:*.m4a=00;38;2;101;188;255:*.mid=00;38;2;101;188;255:*.midi=00;38;2;101;188;255:*.mka=00;38;2;101;188;255:*.mp3=00;38;2;101;188;255:*.mpc=00;38;2;101;188;255:*.ogg=00;38;2;101;188;255:*.ra=00;38;2;101;188;255:*.wav=00;38;2;101;188;255:*.oga=00;38;2;101;188;255:*.opus=00;38;2;101;188;255:*.spx=00;38;2;101;188;255:*.xspf=00;38;2;101;188;255:*~=00;38;2;68;74;115:*#=00;38;2;68;74;115:*.bak=00;38;2;68;74;115:*.crdownload=00;38;2;68;74;115:*.dpkg-dist=00;38;2;68;74;115:*.dpkg-new=00;38;2;68;74;115:*.dpkg-old=00;38;2;68;74;115:*.dpkg-tmp=00;38;2;68;74;115:*.old=00;38;2;68;74;115:*.orig=00;38;2;68;74;115:*.part=00;38;2;68;74;115:*.rej=00;38;2;68;74;115:*.rpmnew=00;38;2;68;74;115:*.rpmorig=00;38;2;68;74;115:*.rpmsave=00;38;2;68;74;115:*.swp=00;38;2;68;74;115:*.tmp=00;38;2;68;74;115:*.ucf-dist=00;38;2;68;74;115:*.ucf-new=00;38;2;68;74;115:*.ucf-old=00;38;2;68;74;115:"
# man 5 eza_colors
#export EZA_COLORS='uu=36:uR=31:un=35:gu=37:da=2;34:ur=34:uw=95:ux=36:ue=36:gr=34:gw=35:gx=36:tr=34:tw=35:tx=36:xx=95:'
# mt = match , fn = filename, ln = line number, bn = byte offset, se=separators
export GREP_COLORS='mt=1;38;2;255;117;127:fn=38;2;192;153;255:ln=38;2;195;232;141:bn=38;2;195;232;141:se=38;2;101;188;255'
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:-} --color=fg:#c8d3f5,bg:#1e2030,hl:#65bcff --color=fg+:#c8d3f5,bg+:#2d3f76,hl+:#65bcff --color=border:#589ed7,gutter:#1e2030,header:#ff966c,info:#545c7e,marker:#ff007c,pointer:#ff007c,prompt:#65bcff,query:#c8d3f5:regular,scrollbar:#589ed7,separator:#ff966c,spinner:#ff007c"
