#!bash
# up.sh: Quickly traverse up the current working path.
# Author: Shannon Moeller <me@shannonmoeller.com>
# Source to use: [ -f /path/to/up.sh ] && . /path/to/up.sh

__upfind() {
	# find matching files and directories
	find "${__UPREPLY[0]}" -name "${__UPREPLY[1]#*/}*" -type $1 -follow -maxdepth 1 -mindepth 1 2> /dev/null | xargs printf "%s$2\n" | cut -b ${__UPREPLY[2]}-
}

__upnum() {
	# step up N directories
	[[ $1 =~ ^[0-9]+$ ]] && local p=$PWD i=$1 && while (( i-- )); do p=${p%/*}; done && ([[ -n $p ]] && echo $p || echo /)
}

__updir() {
	# step up until a match is found
	[[ -n $1 ]] && local p=$PWD && while [[ -n $p ]]; do p=${p%/*} && [[ $1 == ${p##*/} ]] && echo $p && return; done
}

__upgen() {
	# split on first /
	local w="${1//\\/}" && [[ $w == */* ]] && local a="${w%%/*}" b="/${w#*/}" || local a="$w" b=''

	# step up to dir|N
	local d="$(__updir "$a")" && [[ -n $d ]] || local d="$(__upnum "$a")"

	# add leading slash to filename
	local f="${b##*/}" && [[ -n $f ]] && f="/$f"

	# set reply
	local i="${d%/*}" && __UPREPLY=( [0]="$d${b%/*}" [1]="$f" [2]=$[${#i} + 2] )
}

_up() {
	# localize variables
	local w="${COMP_WORDS[COMP_CWORD]}" p="${PWD%/*}"

	# complete parent dir
	COMPREPLY=( $(compgen -S/ -W "${p//\// }" -- $w) ) && (( ${#COMPREPLY} > 0 )) && return

	# complete N or sub dir
	__upgen $w && [[ -n ${__UPREPLY[0]} ]] && COMPREPLY=( $(__upfind d / && __upfind f) )
}

up() {
	# up one dir
	(( ! $# )) && cd .. && return

	# up dir|N
	__upgen "$1" && local d="${__UPREPLY[0]}" && [[ -n $d ]] && cd "$d${__UPREPLY[1]}" && return

	# cd fallback
	[[ $1 == - || -d $1 ]] && cd $1 && return

	# usage
	echo -e "usage: up [dir|N]\npwd: $PWD"
}

# tab-completion
complete -o bashdefault -o default -o filenames -o nospace -F _up up
