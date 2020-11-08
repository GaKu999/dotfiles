#!/hint/bash
# ${XDG_LIB_DIR}/bash/bwrap.bash
# vim:ft=bash:fenc=utf-8:noet:ts=3:sw=3:

_unshare_user() {
	if [[ "${1:-false}" == true ]]; then
		echo '--unshare-user-try'
	else
		echo '--unshare-user'
	fi
}

_share_user() {
	echo '--share-user'
}

_unshare_ipc() {
	echo '--unshare-ipc'
}

_share_ipc() {
	echo '--share-ipc'
}

_unshare_pid() {
	echo '--unshare-pid'
}

_share_pid() {
	echo '--share-pid'
}

_unshare_net() {
	echo '--unshare-net'
}

_share_net() {
	echo '--share-net'
}

_unshare_uts() {
	echo '--unshare-uts'
}

_share_uts() {
	echo '--share-uts'
}

_unshare_cgroup() {
	if [[ "${1:-false}" == true ]]; then
		echo '--unshare-cgroup-try'
	else
		echo '--unshare-cgroup'
	fi
}

_share_cgroup() {
	echo '--share-cgroup'
}

_unshare_all() {
	echo '--unshare-all'
}

_share_all() {
	echo '--share-all'
}

_chdir() {
	: ${1:?}
	echo "--chdir "${1}""
}

_setenv() {
	: ${1:?} ${2:?}
	echo "--setenv "${1}" "${2}""
}

_unsetenv() {
	: ${1:?}
	echo "--unsetenv "${1}""
}

_bind() {
	if [[ "${1:-false}" == true ]]; then
		: ${2:?}
		echo "--bind-try "${2}" "${3:-${2}}""
	else
		: ${1:?}
		echo "--bind "${1}" "${2:-${1}}""
	fi
}

_dev_bind() {
	if [[ "${1:-false}" == true ]]; then
		: ${2:?}
		echo "--dev-bind-try "${2}" "${3:-${2}}""
	else
		: ${1:?}
		echo "--dev-bind "${1}" "${2:-${1}}""
	fi
}

_ro_bind() {
	if [[ "${1:-false}" == true ]]; then
		: ${2:?}
		echo "--ro-bind-try "${2}" "${3:-${2}}""
	else
		: ${1:?}
		echo "--ro-bind "${1}" "${2:-${1}}""
	fi
}

_remount_ro() {
	: ${1:?}
	echo "--remount-ro "${1}""
}

_proc() {
	: ${1:?}
	echo "--proc "${1}""
}

_dev() {
	: ${1:?}
	echo "--dev "${1}""
}

_tmpfs() {
	: ${1:?}
	echo "--tmpfs "${1}""
}

_mqueue() {
	: ${1:?}
	echo "--mqueue "${1}""
}

_dir() {
	: ${1:?}
	echo "--dir "${1}""
}

_symlink() {
	: ${1:?} ${2:?}
	echo "--symlink "${1}" "${2}""
}

_new_session() {
	echo '--new-session'
}

_die_with_parent() {
	echo '--die-with-parent'
}

_as_pid_1() {
	echo '--as-pid-1'
}
