#!/hint/bash
# THIS FILE MUST BE SOURCED

## DEPRECIATED - Use stdlib.sh instead

function help_pager()
{
	printf '\e[1m\e[31mDEPRECIATED - Use stdlib.sh stdPager() function instead\e[0m\n'
	local pager pagerargs
	pager="bat"

	if type -f -p "$pager" &>/dev/null; then
	    pagerargs=('-p' '-l' '"Command Help"')
	else
	    pager="cat"
	    unset pagerargs
	fi

    eval "env $pager ${pagerargs[*]}"
    return 0
}

## Simple function to display log messages
## Usage: log <info|warn|error> <message>
function log()
{
	printf '\e[1m\e[31mDEPRECIATED - Use stdlib.sh stdLog() function instead\e[0m\n'
	type="${1:?Missing message type}"
	message="${2}"

	case $type in
	error)
		printf '\e[1m[\e[31mERROR\e[0m\e[1m]\t%s\e[0m\n' "$message"
		;;
	help)
		printf 'Usage: log <type> <message>\n'
		printf 'Write a log message of type containing the message to stdout.\n\n'
		printf 'Options:\n'
		printf '  <type>     The type of log message can be: info, warn, or error.\n'
		printf '  <message>  Specifies the message to accompany the type.\n'
		return 0
		;;
	info)
		printf '\e[1m[\e[30mINFO\e[0m\e[1m]\t%s\n' "$message"
		;;
	warn)
		printf '\e[1m[\e[33mWARN\e[0m\e[1m]\t%s\n' "$message"
		;;
	*)
		printf 'log: unrecognised message type '\''%s'\''\n' "$type"
		printf 'Try '\''log help'\'' for usage information.\n'
		return 1
		;;
	esac
}
