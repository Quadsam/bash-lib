#!/usr/bin/env bash
source '/opt/bash-lib/stdlib.sh'
option=long
paging=true

while getopts ':hlps' OPT; do
	case $OPT in
	h)
		stdPager help <<EOF
Usage:
 ${self[2]} [-hlps] <COMMAND [-- ARGS]>

 Show the help for the specified COMMAND. Some commands accept additional
 arguments to the help (-h|--help) argument and can be passed as ARGS.

Options:
 -l  pass '--help' to the COMMAND (default)
 -p  disable paging
 -s  pass '-h' to the COMMAND

 -h  show this help

EOF
		exit 0
		;;
	l)
		option=long
		;;
	p)
		paging=false
		;;
	s)
		option=short
		;;
	\?)
		stdLog error "Unrecognised argument -- '$OPTARG'" >&2
		stdLog info 'Use "-h" to show usage'
		exit 1
		;;
	:)
		stdLog error "Missing argument to option -- '$OPTARG'" >&2
		stdLog info 'Use "-h" to show usage'
		exit 1
		;;
	esac
done
shift $((OPTIND-1))

stdLog info "Option: '$option'"
stdLog info "Paging: '$paging'"
stdLog info "Remaining Arguments: '$*'"
