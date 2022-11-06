#!/hint/bash
# vim:ft=bash:noet:ts=3:sw=3:
# man:bash(1)
# file:$HOME/.bashrc
#==============================================================================#


# prepare the environment
if [[ -r "$HOME/.bashenv" ]]; then
	source "$HOME/.bashenv"
fi


#==============================================================================#


# store the filename of the current terminal device
readonly TTY="$(tty)"

# man:gpg-agent(1)
export GPG_TTY="$TTY"
gpg-connect-agent UPDATESTARTUPTTY /bye &>/dev/null || : NOERR

# man:dircolors(1)
eval "$(dircolors -b -- "$XDG_CONFIG_HOME/dircolors.conf")"

# man:less(1)
if [[ "$PARENT_TERM" =~ (alacritty|foot) || "$TERM" =~ (alacritty|foot) ]]; then
	export LESS_TERMCAP_mb=$'\e[1;91m'
	export LESS_TERMCAP_md=$'\e[1;91m'
	export LESS_TERMCAP_so=$'\e[1;97;100m'
	export LESS_TERMCAP_us=$'\e[1;92m'
else
	export LESS_TERMCAP_mb=$'\e[1;31m'
	export LESS_TERMCAP_md=$'\e[1;31m'
	export LESS_TERMCAP_so=$'\e[30;47m'
	export LESS_TERMCAP_us=$'\e[1;32m'
fi

export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'


#==============================================================================#


# man:bash(1)
HISTSIZE=10000
HISTCONTROL="erasedups:ignoreboth"
MAILCHECK=0

# man:cd(1p)
CDPATH=".:..:$HOME"

# man:bash(1)
PROMPT_COMMAND=()
PROMPT_DIRTRIM=8


#==============================================================================#


# man:stty(1)
stty -ixon
stty start undef
stty stop  undef

# man:set(1p)
# man:bash(1)
set -bChm -o vi

# man:bash(1)
shopt -s autocd cdable_vars cdspell checkhash checkjobs direxpand dirspell extglob globstar histappend histreedit histverify hostcomplete lithist progcomp_alias
shopt -u promptvars

# command not found handler via `pacman
# $1: COMMAND
# man:bash(1)
function command_not_found_handle { local cmd="$1"
	local entries entry fields prev_pkg
	[[ -n "$cmd" ]] || return 2
	echo "bash: $cmd: command not found" >&2
	# (repo\ package\ version\ file,...)
	mapfile -t entries < \
		<(pacman -F --machinereadable -- "/usr/bin/$cmd" | tr "\0" ' ')
	if (("${#entries[@]}")); then
		printf "\e[1m%s\e[0m may be found in the following packages:\n" "$cmd"
		for entry in "${entries[@]}"; do
			# (repo,package,version,file)
			fields=($entry)
			if [[ "$prev_pkg" != "${fields[1]}" ]]; then
				printf "\e[1;35m%s/\e[0m\e[1m%s\e[0m \e[1;32m%s\e[0m\n" \
					"${fields[@]:0:3}"
			fi
			printf "    /%s\n" "${fields[3]}"
			prev_pkg="${fields[1]}"
		done
	fi
	return 127
}


#==============================================================================#
#                                    PROMPT                                    #
#==============================================================================#


# setup the prompts
# _error-code(): prints the exit code of the last command
if [[ "$PARENT_TERM" =~ (alacritty|foot) || "$TERM" =~ (alacritty|foot) ]]; then
	PS1="\[\e[96m\]󰃭\[\e[0m\] \[\e[1;96m\]\D{%Y-%m-%d}\[\e[0m\] \[\e[96m\]󰥔\[\e[0m\] \[\e[1;96m\]\D{%H:%M}\[\e[0m\] \[\e[93m\]\[\e[0m\] \[\e[1;93m\]\j\[\e[0m\]\n"
	((EUID)) && PS1+="\[\e[93m\]\[\e[0m\] \[\e[1;93m\]\u\[\e[0m\] " || PS1+="\[\e[91m\]\[\e[0m\] \[\e[1;91m\]\u\[\e[0m\] "
	PS1+="\[\e[91m\]\[\e[0m\] \[\e[1;91m\]\h\[\e[0m\] \[\e[95m\]\[\e[0m\] \[\e[1;95m\]${TTY/\/dev\/}\[\e[0m\] \[\e[94m\]\[\e[0m\] \[\e[1;94m\]\w\[\e[0m\]\n"
	if ((EUID)); then
		((SHLVL > 1)) && PS1+="\[\e[97m\]\[\e[0m\] " || PS1+="\[\e[97m\]\[\e[0m\] "
	else
		((SHLVL > 1)) && PS1+="\[\e[97m\]\[\e[0m\] " || PS1+="\[\e[97m\]\[\e[0m\] "
	fi
	PS2="\[\e[97m\]\[\e[0m\] "
	PS3="\[\e[35m\]\[\e[0m\] "
	function _error-code {
		printf "\e[91m\e[0m \e[1;91m%s\e[0m\n" "$?"
	}
else
	PS1="\[\e[36m\][\[\e[0m\]\[\e[1;36m\]\D{%Y-%m-%d %H:%M}\[\e[0m\]\[\e[36m\]]\[\e[0m\] \[\e[36m\](\[\e[0m\]\[\e[1;33m\]\j\[\e[0m\]\[\e[36m\])\[\e[0m\]\n"
	((EUID)) && PS1+="\[\e[1;33m\]\u\[\e[0m\]" || PS1+="\[\e[1;31m\]\u\[\e[0m\]"
	PS1+="\[\e[36m\]@\[\e[0m\]\[\e[1;31m\]\h\[\e[0m\]\[\e[36m\]{\[\e[0m\]\[\e[1;35m\]${TTY/\/dev\/}\[\e[0m\]\[\e[36m\]}\[\e[0m\]\[\e[36m\]:\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\n"
	((SHLVL > 1)) && PS1+="\[\e[1m\]\$>\[\e[0m\] " || PS1+="\[\e[1m\]\$\[\e[0m\] "
	PS2="\[\e[1m\]>>\[\e[0m\] "
	PS3="\[\e[35m\]?\[\e[0m\] "
	function _error-code {
		printf "\e[36m<\e[0m\e[1;31m%s\e[0m\e[36m>\e[0m\n" "$?"
	}
fi

# run _error-code() on errors
trap _error-code ERR

# execution trace prompt
PS4="+ "


#==============================================================================#
#                                    HOOKS                                     #
#==============================================================================#


# random chance for a colored `fortune
function _fortune-cookie {
	local color msg
	local random="$RANDOM"
	if ((random > 31744)); then
		color="1;3$((random % 6 + 1))m"
		if ((random > 32512)); then
			msg="$(fortune -l)"
		else
			msg="$(fortune -s)"
		fi
		printf "\e[$color%s\e[0m\n" "$msg"
	fi
}
PROMPT_COMMAND+=(_fortune-cookie)

# setup the dynamic title
if [[ "$TERM" =~ (foot|xterm|tmux) ]]; then
	function _window-title {
		local title="\u@\h{${TTY/\/dev\/}}:\w"
		# user@host{tty}:cwd
		printf "\e]2;%s\a" "${title@P}"
	}
	PROMPT_COMMAND+=(_window-title)
fi


#==============================================================================#
#                               READLINE Tweaks                                #
#==============================================================================#


# zsh-like run-help()
# [$*: TERMS (${READLINE_LINE%% *})]
function run-help { local terms
	local str
	# (term,...)
	(("$#")) && terms=("$@") || terms=("${READLINE_LINE%% *}")
	if [[ -n "${terms[*]}" ]]; then
		for str in "${terms[@]}"; do
			type "$str" || continue
			if help "$str" 2>/dev/null; then
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

if [[ "$PARENT_TERM" =~ (alacritty|foot) || "$TERM" =~ (alacritty|foot) ]]; then
	# ctrl-d -> `exit
	bind -m vi-insert -x '"\C-d": exit'
fi


#==============================================================================#
#                                   ALIASES                                    #
#==============================================================================#


# color
alias diff='command diff -Ndu --color=auto'
alias grep='command grep --color=auto'
alias ip='command ip -d -h -s --color=auto'
alias pacman='command pacman --color=auto'

# `ls
alias ls='command ls -bGv -F --color=auto'

alias dir='ls -lSrAh'
alias l='ls -l'
alias la='ls -lA'
alias lh='ls -hAl'
alias ll='ls -l'

# `vi -> `nvim
alias vi='nvim'
alias vibin='nvim -b'
alias vidiff='nvim -d'
alias vir='nvim -r'
alias vis='nvim -S'

# `vim -> `nvim
alias vim='nvim'
alias vimbin='nvim -b'
alias vimdiff='nvim -d'
alias vimr='nvim -r'
alias vims='nvim -S'

# interactive
alias cp='command cp -i --preserve=all --reflink=auto'
alias ln='command ln -i'
alias mv='command mv -i'
alias rm='command rm -I'

# logs
alias llog='journalctl -b'
alias paclog='paclog --color'
alias tlog='journalctl -fb'

# udiskie
alias mnt='udiskie-mount -r'
alias umnt='udiskie-umount -l'

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
alias dotfiles='git --bare --git-dir "$HOME/.dotfiles" --work-tree "$HOME"'
alias etcfiles='sudo -E git --bare --git-dir /etc/.etcfiles --work-tree /etc'

# `sudoedit and `nvim -d` for `pacdiff
alias pacdiff='DIFFPROG=sudoedit SUDO_EDITOR="nvim -d" command pacdiff'

# misc
alias mntls='findmnt --real'
alias dec='printf "%d\n"'
alias hex='printf "%x\n"'
alias oct='printf "%o\n"'
alias uncomment='grep -Ev "^\s*#.*$|^\s*$"'

# URL processing with `python
alias urldec='python -c "import sys, urllib.parse as ul; print(ul.unquote(sys.argv[1]))"'
alias urlenc='python -c "import sys, urllib.parse as ul; print(ul.quote(sys.argv[1]))"'


#==============================================================================#
#                                  FUNCTIONS                                   #
#==============================================================================#


# `cp then follow
# $@: ARGS
function cpf {
	(("$#")) || return 2
	cp "$@" && builtin cd -- "$_"
}

# `mv then follow
# $@: ARGS
function mvf {
	(("$#")) || return 2
	mv "$@" && builtin cd -- "$_"
}

# test internet connectivity
# `drill -> `ping -> `curl
# ipv4 -> ipv6
function pong {
	if drill -4DQ ping.archlinux.org A &>/dev/null; then
		if ping -4q -c1 -w5 ping.archlinux.org &>/dev/null; then
			curl -4qfs -o/dev/null --fail-early https://ping.archlinux.org ||
				echo "IPv4 route failure" >&2
		else
			echo "IPv4 ping failure" >&2
		fi
	else
		echo "IPv4 DNS failure" >&2
	fi
	if drill -6DQ ping.archlinux.org AAAA &>/dev/null; then
		if ping -6q -c1 -w5 ping.archlinux.org &>/dev/null; then
			curl -6qfs -o/dev/null --fail-early https://ping.archlinux.org ||
				echo "IPv6 route failure" >&2
		else
			echo "IPv6 ping failure" >&2
		fi
	else
		echo "IPv6 DNS failure" >&2
	fi
}

# get IP addresses
function ipls {
	local ipv4 ipv6
	ip -4 -br a |
		awk '($1)!="lo" {printf("\033[1m%s:\033[0m \033[35m%s\033[0m\n", $1, $3)}'
	ip -6 -br a |
		awk '($1)!="lo" {printf("\033[1m%s:\033[0m \033[34m%s\033[0m\n", $1, $3)}'
	ipv4="$(curl -4qsL am.i.mullvad.net 2>/dev/null)"
	if [[ -n "$ipv4" ]]; then
		echo -e "\e[1mexternal:\e[0m \e[35m$ipv4\e[0m"
	fi
	ipv6="$(curl -6qsL ipv6.am.i.mullvad.net 2>/dev/null)"
	if [[ -n "$ipv6" ]]; then
		echo -e "\e[1mexternal:\e[0m \e[34m$ipv6\e[0m"
	fi
}

# get MAC addresses
function macls {
	ip -br l | awk '($1)!~"(lo|wg[0-9])" {printf("\033[1m%s:\033[0m \033[33m%s\033[0m\n", $1, $3)}'
}

# try to remove the current dir
function rmwd {
	pushd .. &>/dev/null
	if rmdir -- "$OLDPWD"; then
		popd -n &>/dev/null
	else
		popd &>/dev/null
	fi
}

# `diff then `patch
# $1: OLD FILE
# $2: NEW FILE
function merge { local old="$1" new="$2"
	[[ -n "$old" && -n "$new" ]] || return 2
	diff -dNu -- "$old" "$new" | patch -bsu -- "$old"
}

# `tmux helper
# $@: [-I INSTANCE (graphical)] [-S SESSION (${1##*/)] [COMMAND... ($SHELL)]
function mux { local cmd args
	local session instance
	local OPT OPTARG OPTIND
	if [[ -n "$TMUX" ]]; then
		echo "refusing to nest tmux session, unset \$TMUX to force" >&2
		return 1
	fi
	while getopts ":I:S:" OPT; do
		case "$OPT" in
			'I') instance="$OPTARG" ;;
			'S') session="$OPTARG" ;;
			'?')
				echo "invalid option -- '$OPTARG'" >&2
				return 2
			;;
			':')
				echo "missing argument -- '$OPTARG'" >&2
				return 2
			;;
		esac
	done; shift "$((OPTIND - 1))"; cmd="$1" args=("${@:2}")
	: ${cmd:=$SHELL}
	: ${session:=${cmd##*/}}
	: ${instance:=graphical}
	if ! systemctl --user is-active "tmux-daemon@$instance.service" &>/dev/null; then
		systemctl --user start "tmux-daemon@$instance.service" &>/dev/null
		sleep 1
	fi
	tmux -S "$XDG_RUNTIME_DIR/tmux-$instance" \
		new-session -A -s "$session" -- \
			"$cmd" "${args[@]}"
}

# `vipe template to stdout
# [$1: FORMAT (txt)]
function template { local format="${1:-txt}"
	vipe <"$XDG_TEMPLATES_DIR/$format"
}

# `date with a different timezone
# [$1: TIMEZONE (UTC)]
function tzdate { local tz="${1:-UTC}"
	TZ="$tz" date
}

# list timezones
function tzls {
	echo -e "\e[1;34mTimezones\e[0m"
	tree -Cl --noreport /usr/share/zoneinfo | tail -n+2
}

# print unicode PUA block
# $1: NAME {bmp, spua-a, spua-b}
function unipua { local name="$1"
	case "$name" in
		bmp) printf "%b " $(printf "\\\u%.4x\n" {57344..63743}) ;;
		spua-a) printf "%b " $(printf "\\\U000f%.4x\n" {0..65535}) ;;
		spua-b) printf "%b " $(printf "\\\U0010%.4x\n" {0..65535}) ;;
		*) return 2 ;;
	esac
}

# search on yt
# $*: SEARCH TERMS
function yts { local terms="$*"
	local template
	[[ -n "$terms" ]] || return 2
	template=$'\e[1;33m'"%(title)s"$'\e[0m\n'
	template+=$'\e[1;31m'"@%(channel)s"$'\e[0m '
	template+=$'\e[1;36m'"(%(upload_date)s)"$'\e[0m '
	template+=$'\e[1;35m'"[%(duration_string)s]"$'\e[0m\n'
	template+=$'\e[1;34m'"https://youtu.be/%(id)s"$'\e[0m\n'
	template+="%(description)s"
	yt-dlp -i --no-warnings --max-downloads 10 --print "$template" "ytsearchall:$terms" || : NOERR
}

# knock on an IPv4 host
# $@: HOST
function knock4 { local host="$1"
	local port; shift
	for port; do
		nmap -4 -Pn -n --host-timeout 10 --max-retries 0 -p "$port" "$host"
	done >&/dev/null
}

# knock on an IPv6 host
# $@: HOST
function knock6 { local host="$1"
	local port; shift
	for port; do
		nmap -6 -Pn -n --host-timeout 10 --max-retries 0 -p "$port" "$host"
	done >&/dev/null
}


#==============================================================================#
#                                   EXECUTE                                    #
#==============================================================================#


if [[ "$PARENT_TERM" =~ (alacritty|foot) || "$TERM" =~ (alacritty|foot) ]]; then
	ponysay -Xo 2>/dev/null
fi

_TODOS="$(todos)"
if [[ -n "$_TODOS" ]]; then
	if [[ "$PARENT_TERM" =~ (alacritty|foot) || "$TERM" =~ (alacritty|foot) ]]; then
		printf "\e[93m\e[0m\n%s\n" "$_TODOS"
	else
		printf "\e[1;33mTodos:\e[0m\n%s\n" "$_TODOS"
	fi
fi; unset -v _TODOS


#==============================================================================#
#                                 END OF FILE                                  #
#==============================================================================#
