#!/hint/bash
#shellcheck disable=SC2034  # Declared variables should be used in scripts sourcing this file
#shellcheck disable=SC2119  # Most functions don't require arguments (handeled by function if it does)

################################################################################
## Written by Quadsam <https://www.quadsam.com/bash>
##
## stdlib.sh - A bash(1) standard library
##
## THIS FILE MUST BE SOURCED
################################################################################

# Folder contaning bash libraries
BASH_LIBS='/opt/bash-lib'

# Array of script file path information
self=(
	"$(realpath "$0")"                # [0]: Full Path
	"$(dirname "$(realpath "$0")")"   # [1]: Containing Directory
	"$(basename "$(realpath "$0")")"  # [2]: Script Name
)

## Usage: stdPath <command>
## Description: Check if a command exists in a folder contained in PATH.
## Returns:
##  0 - Installed
##  1 - Not Found
##  2 - Error
function stdPath()
{
	if [[ -z $1 ]]; then
		# No argument provided
		printf 'ERROR(std.sh:stdPath): Missing argument to function\n'
		return 2
	fi
	if ! type -fp "$1" &>/dev/null; then
		# Not found
		return 1
	else
		# Installed
		return 0
	fi
}


## Usage: stdPager
## Description: Find and run an installed pager. Checks for the bat(1), and
##              cat(1) utilities
## Returns:
##  0 - Success
##  1 - Unused
##  2 - Error
function stdPager()
{
	local batArgs i pagerArgs pagerCMD pagerList syntax
	syntax='txt'
	if [[ $# -ne 0 ]]; then
		# Additional arguments provided (only used with bat)
		if [[ -n $1 ]]; then
			# A syntax was provided (only for bat)
			syntax="$1"
			shift
		fi
		batArgs=("$@")
	fi
	pagerList=("bat" "cat")
	pagerArgs=(
		"'-p' '-l' '$syntax' ${batArgs[*]}"  # bat
		""              # cat
	)
	# Iterate thru pagers
	for ((i=0; i<${#pagerList[@]}; i++)); do
		if stdPath "${pagerList[$i]}"; then
			# Pager is installed, append arguments, and break out of loop
			pagerCMD=("${pagerList[$i]}" "${pagerArgs[$i]}")
			break
		fi
		if [[ $i -eq $((${#pagerList[@]}-1)) ]]; then
			# List of pagers was exhasted
			printf 'ERROR(std.sh:stdPager): No pagers found\n'
			return 2
		fi
	done
	# Run pager and check for errors
	if ! eval "${pagerCMD[*]}"; then
		printf 'ERROR(std.sh:stdPager:%s): Pager encountered an error\n' "${pagerCMD[0]}"
		return 2
	fi
	return 0
}


## Usage: stdLog <type> <message>
## Description: Write a log message of type (debug, error, info, warn) with a
##              message to stdout.
## Returns:
##  0 - Success
##  1 - Unused
##  2 - Error
function stdLog()
{
	local type message
	if [[ -z $1 ]]; then
		# Log type not provided
		printf 'ERROR(std.sh:stdLog): Missing log type\n'
		return 2
	elif [[ -z $2 ]]; then
		# Log message not provided
		printf 'ERROR(std.sh:stdLog): Missing log message\n'
		return 2
	fi
	type="$1"
	message="$2"
	# Check the type of message
	case $type in
	debug) # [{grey}DEBUG{reset}]{tab}<MESSAGE>
		printf '\e[1m[\e[30mDEBUG\e[0m\e[1m]\t%s\e[0m\n' "$message"
		return 0
		;;
	error) # [{red}ERROR{reset}]{tab}<MESSAGE>
		printf '\e[1m[\e[31mERROR\e[0m\e[1m]\t%s\e[0m\n' "$message"
		return 0
		;;
	info) # [{green}INFO{reset}]{tab}<MESSAGE>
		printf '\e[1m[\e[32mINFO\e[0m\e[1m]\t%s\e[0m\n' "$message"
		return 0
		;;
	warn) # [{yellow}WARN{reset}]{tab}<MESSAGE>
		printf '\e[1m[\e[33mWARN\e[0m\e[1m]\t%s\e[0m\n' "$message"
		return 0
		;;
	*)
		printf 'ERROR(std.sh:stdLog): Invalid message type "%s"\n' "$type"
		return 2
		;;
	esac
}
