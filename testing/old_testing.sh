#!/usr/bin/env bash

# @iversion & @Andreas_Spindler
while getopts ":hd:R:" OPT; do
	printf '\e[01;30mParsing:\e[00m\n'
	printf '\t\e[01;30mOPT: "%s"\e[00m\n' "$OPT"
	printf '\t\e[01;30mOPTARG: "%s"\e[00m\n' "$OPTARG"
	case $OPT in
	h)
		echo "usage"
		exit 0
		;;
	d)
		dir="$OPTARG"
		;;
	R)
		if [[ -z $OPTARG ]]; then
			level=1
		elif [[ $OPTARG =~ ^[0-9]+$ ]]; then
			level="$OPTARG"
		fi
#		if [[ $OPTARG =~ ^[0-9]+$ ]];then
#			level="$OPTARG"
#		else
#			level=1
#		fi
		;;
	\?)
		printf 'Unrecognised argument -- "%s"\n' "$OPTARG"
		exit 1
		;;
	:)
		printf 'Missing argument to option -- "%s"\n' "$OPTARG"
		exit 1
		;;
	esac
done

printf 'Dir:   "%s"\n' "$dir"
printf 'Level: "%s"\n' "$level"
printf 'Remaining:\n'
printf '\t"%s"\n' "$@"
