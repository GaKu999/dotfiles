#!/hint/bash
# vim:ft=bash:noet:ts=3:sw=3:
# man:bash(1)
# file:$HOME/.bashrc
#==============================================================================#


[[ "$-" == *i* ]] || return # not interactive
if ! shopt -q login_shell ; then # not sourced by login shell
	. "$HOME/.bashenv" || return # broken
fi

# defaults
export DIFFPROG="diff -dNu"
export EDITOR="vim"
export PAGER="less"
export VISUAL="vim"

# man:ls(1) man:dircolors(1)
# `dircolors -b -- "$XDG_CONFIG_HOME/dircolors.conf"`
export LS_COLORS="di=${_af[12]}:ln=target:pi=${_af[3]}:so=${_af[5]}:do=${_af[5]}:bd=${_af[3]}:cd=${_af[3]}:or=${_af[1]}:su=${_af[15]};${_ab[1]}:sg=${_af[15]};${_ab[3]}:tw=${_af[15]};${_ab[2]}:ow=${_af[12]};${_ab[2]}:st=${_af[15]};${_ab[4]}:ex=${_af[10]}:\
*.bash=${_af[10]}:*.bat=${_af[10]}:*.btm=${_af[10]}:*.cmd=${_af[10]}:*.com=${_af[10]}:*.csh=${_af[10]}:*.exe=${_af[10]}:*.job=${_af[10]}:*.js=${_af[10]}:*.lua=${_af[10]}:*.perl=${_af[10]}:*.py=${_af[10]}:*.sh=${_af[10]}:*.zsh=${_af[10]}:\
*.7z=${_af[9]}:*.Z=${_af[9]}:*.ace=${_af[9]}:*.alz=${_af[9]}:*.apk=${_af[9]}:*.arc=${_af[9]}:*.arj=${_af[9]}:*.bz=${_af[9]}:*.bz2=${_af[9]}:*.cab=${_af[9]}:*.cpio=${_af[9]}:*.crate=${_af[9]}:*.deb=${_af[9]}:*.drpm=${_af[9]}:*.dwm=${_af[9]}:*.dz=${_af[9]}:*.ear=${_af[9]}:*.egg=${_af[9]}:*.esd=${_af[9]}:*.gpg=${_af[9]}:*.gz=${_af[9]}:*.iso=${_af[9]}:*.jar=${_af[9]}:*.lha=${_af[9]}:*.lrz=${_af[9]}:*.lz=${_af[9]}:*.lz4=${_af[9]}:*.lzh=${_af[9]}:*.lzma=${_af[9]}:*.lzo=${_af[9]}:*.pyz=${_af[9]}:*.rar=${_af[9]}:*.rpm=${_af[9]}:*.rz=${_af[9]}:*.sar=${_af[9]}:*.sfs=${_af[9]}:*.swm=${_af[9]}:*.t7z=${_af[9]}:*.tZ=${_af[9]}:*.tar=${_af[9]}:*.taz=${_af[9]}:*.tbz=${_af[9]}:*.tbz2=${_af[9]}:*.tgz=${_af[9]}:*.tlz=${_af[9]}:*.txz=${_af[9]}:*.tz=${_af[9]}:*.tzo=${_af[9]}:*.tzst=${_af[9]}:*.udeb=${_af[9]}:*.war=${_af[9]}:*.whl=${_af[9]}:*.wim=${_af[9]}:*.xz=${_af[9]}:*.z=${_af[9]}:*.zip=${_af[9]}:*.zoo=${_af[9]}:*.zst=${_af[9]}:\
*.docx=${_af[9]}:*.odt=${_af[9]}:*.pdf=${_af[9]}:*.xcf=${_af[9]}:\
*.asf=${_af[11]}:*.avi=${_af[11]}:*.avif=${_af[11]}:*.bmp=${_af[11]}:*.cgm=${_af[11]}:*.dl=${_af[11]}:*.emf=${_af[11]}:*.flc=${_af[11]}:*.fli=${_af[11]}:*.flv=${_af[11]}:*.gif=${_af[11]}:*.gl=${_af[11]}:*.jpeg=${_af[11]}:*.jpg=${_af[11]}:*.jxl=${_af[11]}:*.m2v=${_af[11]}:*.m4v=${_af[11]}:*.mjpeg=${_af[11]}:*.mjpg=${_af[11]}:*.mkv=${_af[11]}:*.mng=${_af[11]}:*.mov=${_af[11]}:*.mp4=${_af[11]}:*.mp4v=${_af[11]}:*.mpeg=${_af[11]}:*.mpg=${_af[11]}:*.nuv=${_af[11]}:*.ogm=${_af[11]}:*.pbm=${_af[11]}:*.pcx=${_af[11]}:*.pgm=${_af[11]}:*.png=${_af[11]}:*.ppm=${_af[11]}:*.qt=${_af[11]}:*.rm=${_af[11]}:*.rmvb=${_af[11]}:*.svg=${_af[11]}:*.svgz=${_af[11]}:*.tga=${_af[11]}:*.tif=${_af[11]}:*.tiff=${_af[11]}:*.vob=${_af[11]}:*.webm=${_af[11]}:*.wmv=${_af[11]}:*.xbm=${_af[11]}:*.xcf=${_af[11]}:*.xpm=${_af[11]}:*.xwd=${_af[11]}:*.yuv=${_af[11]}:\
*.aac=${_af[14]}:*.au=${_af[14]}:*.flac=${_af[14]}:*.m4a=${_af[14]}:*.mid=${_af[14]}:*.midi=${_af[14]}:*.mka=${_af[14]}:*.mp3=${_af[14]}:*.mpc=${_af[14]}:*.oga=${_af[14]}:*.ogg=${_af[14]}:*.opus=${_af[14]}:*.ra=${_af[14]}:*.spx=${_af[14]}:*.wav=${_af[14]}:*.xspf=${_af[14]}:\
*.avi=${_af[13]}:*.mkv=${_af[13]}:*.mp4=${_af[13]}:*.mpg=${_af[13]}:*.ogv=${_af[13]}:*.ogx=${_af[13]}:\
*~=${_af[8]}:*#=${_af[8]}:*.bak=${_af[8]}:*.crdownload=${_af[8]}:*.dpkg-dist=${_af[8]}:*.dpkg-new=${_af[8]}:*.dpkg-old=${_af[8]}:*.dpkg-tmp=${_af[8]}:*.old=${_af[8]}:*.orig=${_af[8]}:*.pacsave=${_af[8]}:*.part=${_af[8]}:*.rej=${_af[8]}:*.rpmnew=${_af[8]}:*.rpmorig=${_af[8]}:*.rpmsave=${_af[8]}:*.swp=${_af[8]}:*.tmp=${_af[8]}:*.ucf-dist=${_af[8]}:*.ucf-new=${_af[8]}:*.ucf-old=${_af[8]}:"
# man:grep(1)
export GREP_COLORS="ms=${_af[10]}:mc=${_af[10]}:fn=${_af[15]}:ln=${_af[11]}:bn=${_af[13]}:se=${_af[15]}:"

# man-db
# man:man(1)
# export MANROFFOPT="-c"
# export MANWIDTH=80

# mandoc
# hack for `zsh completion for `man so it doesn't choke on nonexistent `manpath
# man:man(1) man:mandoc(1) man:man.conf(5)
# function manpath { man -w ; }

# man:less(1)
export LESS="-RinF -x3 -~ --wordwrap --incsearch --mouse --no-histdups"
export LESSHISTSIZE=10000
export LESS_TERMCAP_mb="${setaf[11]}"
export LESS_TERMCAP_md="${setaf[11]}"
export LESS_TERMCAP_me="${terminfo[sgr0]}"
export LESS_TERMCAP_so="${setaf[9]}${setab[0]}"
export LESS_TERMCAP_se="${terminfo[sgr0]}"
export LESS_TERMCAP_us="${setaf[9]}"
export LESS_TERMCAP_ue="${terminfo[sgr0]}"

# man:bash(1)
HISTSIZE=10000
HISTCONTROL="erasedups:ignoreboth"
MAILCHECK=0

# man:cd(1p)
CDPATH=".:..:$HOME"

# man:bash(1)
PROMPT_DIRTRIM=8


# man:stty(1)
stty -ixon
stty start undef
stty stop undef

# man:set(1p) man:bash(1)
set -bChm -o vi

# man:bash(1)
shopt -s autocd cdable_vars cdspell checkhash checkjobs direxpand dirspell extglob globstar nullglob histappend histreedit histverify hostcomplete lithist progcomp_alias
shopt -u promptvars


#==============================================================================#
#                                    PROMPT                                    #
#==============================================================================#


# prompt hooks
# pre -> hook -> post
declare -a _prompt_hooks_pre
declare -a _prompt_hooks
declare -a _prompt_hooks_post
function _run-prompt-hooks {
	local pre_fun fun post_fun
	for pre_fun in "${_prompt_hooks_pre[@]}" ; do
		[[ -n "$pre_fun" && "$( type -t -- "$pre_fun" )" == function ]] || continue
		$pre_fun
	done
	for fun in "${_prompt_hooks[@]}" ; do
		[[ -n "$fun" && "$( type -t -- "$fun" )" == function ]] || continue
		$fun
	done
	for post_fun in "${_prompt_hooks_post[@]}" ; do
		[[ -n "$post_fun" && "$( type -t -- "$post_fun" )" == function ]] || continue
		$post_fun
	done
}

# $@: TARGET FUNCTION
function add-prompt-hook { local target="$1" hook="$2"
	[[ -n "$target" && -n "$hook" && "$( type -t -- "$hook" )" == function ]] || return 2
	case "$target" in
		prompt-pre ) _prompt_hooks_pre+=( "$hook" ) ;;
		prompt ) _prompt_hooks+=( "$hook" ) ;;
		prompt-post ) _prompt_hooks_post+=( "$hook" ) ;;
	esac
}

# man:bash(1)
PROMPT_COMMAND=( _run-prompt-hooks )

# prompt token definitions
# pre -> token -> post
declare -A _prompt_tokens_pre
_prompt_tokens_pre=(
	at "\[${setaf[6]}\]"
	datetime "\[${setaf[6]}\][\[${terminfo[sgr0]}\]\[${setaf[14]}\]"
	dollar ''
	host "\[${setaf[9]}\]"
	in "\[${setaf[6]}\]"
	jobs ''
	newline ''
	path "\[${setaf[12]}\]"
	rc ''
	tty "\[${setaf[6]}\]{\[${terminfo[sgr0]}\]\[${setaf[13]}\]"
	user ''
	vcs ''
	venv ''
)
declare -A _prompt_tokens
_prompt_tokens=(
	at '@'
	datetime "\D{%Y-%m-%d %H:%M}" # 󰃭 󰥔
	dollar '' #    
	host "\h" # 
	in ':'
	jobs '' # 
	newline $'\n'
	path "\w " # 
	rc '' # 
	tty "${TTY/\/dev\/}" # 
	user '' # 
	vcs '' # 
	venv '' # 󰨾
)
declare -A _prompt_tokens_post
_prompt_tokens_post=(
	at "\[${terminfo[sgr0]}\]"
	datetime "\[${terminfo[sgr0]}\]\[${setaf[6]}\]]\[${terminfo[sgr0]}\] "
	dollar ''
	host "\[${terminfo[sgr0]}\]"
	in "\[${terminfo[sgr0]}\]"
	jobs ''
	newline ''
	path "\[${terminfo[sgr0]}\]"
	rc ''
	tty "\[${terminfo[sgr0]}\]\[${setaf[6]}\]}\[${terminfo[sgr0]}\]"
	user ''
	vcs ''
	venv ''
)

# prompt token handlers
# _dollar_prompt(): info for dollar via `bash \$@P and $SHLVL
# _jobs_prompt(): info for jobs via `bash \j@P
# _rc_prompt(): info for rc via $_ERR
# _user_prompt(): info for user via `bash \u@P and $EUID
# _venv_prompt(): info for venv via $VIRTUAL_ENV
# _vcs_prompt(): info for vcs via git-prompt.sh
function _dollar_prompt {
	if (( SHLVL > 1 )) ; then
		REPLY="\$> "
	else
		REPLY="\$ "
	fi
}
function _jobs_prompt {
	local j="\j" ; j="${j@P}"
	(( j )) || return
	REPLY="\[${setaf[6]}\](\[${terminfo[sgr0]}\]\[${setaf[11]}\]$j\[${terminfo[sgr0]}\]\[${setaf[6]}\])\[${terminfo[sgr0]}\] "
}
function _rc_prompt {
	(( _ERR )) || return
	REPLY="${_ERR:+\[${setaf[6]}\]<\[${terminfo[sgr0]}\]\[${setaf[9]}\]$_ERR\[${terminfo[sgr0]}\]\[${setaf[6]}\]>\[${terminfo[sgr0]}\] }"
	_ERR=0
}
function _user_prompt {
	if (( EUID )) ; then
		REPLY="\[${setaf[11]}\]\u\[${terminfo[sgr0]}\]"
	else
		REPLY="\[${setaf[9]}\]\u\[${terminfo[sgr0]}\]"
	fi
}
if [[ -r /usr/share/git/git-prompt.sh ]] ; then
	. /usr/share/git/git-prompt.sh
	function _vcs_prompt {
		REPLY="$(__git_ps1 "\[${setaf[6]}\](\[${terminfo[sgr0]}\]git\[${setaf[6]}\]/\[${terminfo[sgr0]}\]\[${setaf[10]}\]%s\[${terminfo[sgr0]}\]\[${setaf[6]}\])\[${terminfo[sgr0]}\] ")"
	}
else
	function _vcs_prompt { : ; }
fi
function _venv_prompt {
	REPLY="${VIRTUAL_ENV:+\[${setaf[6]}\]{\[${terminfo[sgr0]}\]\[${setaf[13]}\]${VIRTUAL_ENV##*/}\[${terminfo[sgr0]}\]\[${setaf[6]}\]\}\[${terminfo[sgr0]}\] }"
}

declare -A _prompt_functions
_prompt_functions=(
	dollar _dollar_prompt
	jobs _jobs_prompt
	rc _rc_prompt
	user _user_prompt
	vcs _vcs_prompt
	venv _venv_prompt
)

# setup $PS1
declare -a _prompt_ps1
_prompt_ps1=(
	venv jobs rc tty in path vcs newline
	dollar
)
function _set_ps1 {
	local token fun
	PS1=''
	for token in "${_prompt_ps1[@]}" ; do
		fun="${_prompt_functions[$token]}"
		if [[ -n "$fun" && "$( type -t -- "$fun" )" == function ]] ; then
			REPLY='' ; $fun
			if [[ -n "$REPLY" ]] ; then
				PS1+="$REPLY"
			fi
		else
			PS1+="${_prompt_tokens_pre[$token]}${_prompt_tokens[$token]}${_prompt_tokens_post[$token]}"
		fi
	done
}
declare -i _ERR
trap '_ERR="$?"' ERR
add-prompt-hook prompt _set_ps1

PS2=">> " # 
PS3="? " # 
PS4="+ "


#==============================================================================#
#                                    HOOKS                                     #
#==============================================================================#


if [[ "$TERM" =~ (alacritty|foot|konsole|tmux|xterm) ]] ; then
	# setup the dynamic title
	function _window-title {
		local -r title="\u@\h{${TTY/\/dev\/}}:\w"
		# user@host{tty}:cwd
		printf "\e]2;%s\a" "${title@P}"
	}
	add-prompt-hook prompt-post _window-title
fi


#==============================================================================#
#                               READLINE Tweaks                                #
#==============================================================================#


# cursor configuration
if [[ "$TERM" =~ linux ]] ; then
	bind 'set vi-cmd-mode-string "\1\e[?8c\2"'
	bind 'set vi-ins-mode-string "\1\e[?0c\2"'
else
	bind 'set vi-cmd-mode-string "\1\e[1 q\2"'
	bind 'set vi-ins-mode-string "\1\e[5 q\2"'
fi

# _reset-cursor(): restore the cursor shape before each prompt
function _reset-cursor { echo -ne "${terminfo[cnorm]}\e[5 q" ; }
add-prompt-hook prompt-post _reset-cursor

# zsh-like run-help()
# [$*: TERMS (${READLINE_LINE%% *})]
function run-help { local -a terms
	local str
	# (term,...)
	if (( "$#" )) ; then
		terms=( "$@" )
	else
		terms=( "${READLINE_LINE%% *}" )
	fi
	if [[ -n "${terms[*]}" ]] ; then
		for str in "${terms[@]}" ; do
			type "$str" || continue
			if help "$str" 2> /dev/null ; then
				break
			else
				man "$str" || : NOERR
			fi
		done
	else
		help
	fi
}

# alt-h -> run-help()
bind -m vi-insert -x '"\eh": run-help'

if [[ "$TERM" =~ (alacritty|foot|konsole) ]] ; then
	# ctrl-d -> `exit
	bind -m vi-insert -x '"\C-d": exit'
fi


#==============================================================================#
#                                   ALIASES                                    #
#==============================================================================#


# color
alias diff='command diff -Ndu --color=auto'
alias grep='command grep --color=auto'

# `ls
alias ls='command ls -bv -F --color=auto'

alias dir='ls -lSrAh'
alias l='ls -l'
alias la='ls -lA'
alias lh='ls -hAl'
alias ll='ls -l'

# `vim
alias vi='vim'
alias vibin='vim -b'
alias vidiff='vim -d'
alias vir='vim -r'
alias vis='vim -S'

# interactive
alias cp='command cp -i --preserve=all --reflink=auto'
alias ln='command ln -i'
alias mv='command mv -i'
alias rm='command rm -I'

# `rsync
alias cpr='rsync -ahh -@1 --partial --info=stats1,progress2'
alias mvr='rsync -ahh -@1 --partial --info=stats1,progress2 --remove-source-files'

# `du
alias du='command du -h'
alias da='du -cs'
alias ds='du -ms -- * | sort -n | tail'

# `df
alias df='command df -h'
alias dfs='df -xefivarfs -xdevtmpfs -xtmpfs'
alias di='df -i'
alias dis='df -i -xefivarfs -xdevtmpfs -xtmpfs'

# config management
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
alias etcfiles='git --git-dir="$PREFIX/etc/.etcfiles" --work-tree="$PREFIX/etc"'

# misc
alias dec='printf "%d\n"'
alias hex='printf "%x\n"'
alias oct='printf "%o\n"'
alias uncomment='grep -Ev "^\s*#.*$|^\s*$"'


#==============================================================================#
#                                  FUNCTIONS                                   #
#==============================================================================#


# `cp then follow
# $@: ARGS
function cpf {
	(( "$#" )) || return 2
	cp "$@" && builtin cd -- "$_"
}

# `mv then follow
# $@: ARGS
function mvf {
	(( "$#" )) || return 2
	mv "$@" && builtin cd -- "$_"
}

# test internet connectivity
function pong {
	if drill -4DQ ping.archlinux.org A &> /dev/null ; then
		if ping -4q -c1 -w5 ping.archlinux.org &> /dev/null ; then
			curl -4qfs -o /dev/null --fail-early https://ping.archlinux.org ||
				echo "IPv4 route failure" >&2
		else
			echo "IPv4 ping failure" >&2
		fi
	else
		echo "IPv4 DNS failure" >&2
	fi
	if drill -6DQ ping.archlinux.org AAAA &> /dev/null ; then
		if ping -6q -c1 -w5 ping.archlinux.org &> /dev/null ; then
			curl -6qfs -o /dev/null --fail-early https://ping.archlinux.org ||
				echo "IPv6 route failure" >&2
		else
			echo "IPv6 ping failure" >&2
		fi
	else
		echo "IPv6 DNS failure" >&2
	fi
}

# try to remove the current dir
function rmwd {
	pushd .. &> /dev/null
	if rmdir -- "$OLDPWD" ; then
		popd -n &> /dev/null
	else
		popd &> /dev/null
	fi
}

# `diff then `patch
# $1: OLD FILE
# $2: NEW FILE
function merge { local -r old="$1" new="$2"
	[[ -n "$old" && -f "$old" && -n "$new" && -f "$new" ]] || return 2
	diff -dNu -- "$old" "$new" | patch -bsu -- "$old"
}


# `date with a different timezone
# [$1: TIMEZONE (UTC)]
function tzdate { local -r tz="${1:-UTC}"
	TZ="$tz" date
}

# print color test
function prcolors {
	local -i i
	for (( i=0 ; i < "${#setab[@]}" ; i++ )) ; do
		printf "|${setab[$i]}%3d${terminfo[sgr0]}" "$i"
		if (( i == 7 || i == 15 || i > 15 && ( i - 15 ) % 6 == 0 )) ; then
			echo '|'
		fi
	done
}

# print unicode block
# $@: FIRST LAST [MOD]
function prublk { local -ir first="$1" last="$2" ; local -r mod="$3"
	[[ -n "$first" && -n "$last" ]] || return 2
	printf '%b ' $( printf "\\\U%.8x$mod\n" $( seq -s ' ' "$first" "$last" ) ) | fold ; echo
}

# port knocker
# $@: HOST PORT...
function knock { local -r host="$1" ; local -air ports=( "${@:2}" )
	local -i port
	[[ -n "$host" ]] && (( "${#ports[@]}" )) || return 2
	for port in "${ports[@]}" ; do
		nmap -Pn -n --host-timeout=10 --max-retries=0 -p "$port" "$host"
	done &> /dev/null
}


#==============================================================================#
#                                   EXECUTE                                    #
#==============================================================================#


IFS='' read -r -d '' _TODOS < <( todos ) || : EOF # 
if [[ -n "$_TODOS" ]] ; then
	printf "${setaf[11]}Todos:${terminfo[sgr0]}\n%b" "$_TODOS"
fi ; unset -v _TODOS


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
