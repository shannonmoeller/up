#!/usr/bin/env sh

# up.sh: Quickly traverse up the current working path.
# Author: Shannon Moeller <me@shannonmoeller.com>
# Source to use: [ -f /path/to/up.sh ] && . /path/to/up.sh

__updir() {
	if [[ "$1" == "/" || -z "$1" || -z "$2" ]]; then
		return
	fi

	local p="$(dirname "$1")"
	local a="$(basename "$p")"
	local b="$(basename "$2")"

	if [[ -z "$a" || -z "$b" ]]; then
		return
	fi

	if [[ "$a" == "$b"* ]]; then
		echo "$p"
		return
	fi

	__updir "$p" "$2"
}

__upnum() {
	if [[ -z "$1" || -z "$2" || ! "$2" =~ ^[0-9]+$ ]]; then
		return
	fi

	local p="$1"
	local i="$2"

	while (( i-- )); do
		p="$(dirname "$p")"
	done

	echo "$p"
}

_up() {
	local p="$(dirname $PWD)"
	local w="${COMP_WORDS[COMP_CWORD]}"

	COMPREPLY=( $(IFS=';' compgen -S/ -W "${p//\//;}" -- "$w") )
}

up() {
	# up one
	if (( ! $# )); then
		cd ..
		return
	fi

	# up dir
	local d="$(__updir "$PWD" "$1")"

	if [[ -d "$d" ]]; then
		cd "$d"
		return
	fi

	# up num
	local n="$(__upnum "$PWD" "$1")"

	if [[ -d "$n" ]]; then
		cd "$n"
		return
	fi

	# fallback
	if [[ $1 == - || -d $1 ]]; then
		cd $1
		return
	fi

	# usage
	echo -e "usage: up [dir|num|-]\npwd: $PWD"
}

# zsh compatibility
if [[ -n ${ZSH_VERSION-} ]]; then
	autoload -U +X bashcompinit && bashcompinit
fi

# tab-completion
complete -o nospace -F _up up
