#!/usr/bin/env bash
#shellcheck disable=SC2119

source "../stdlib.sh"

function checkError
{
	local execCMD errorCode
	execCMD="$1"
	errorCode="$2"

	if [[ $errorCode -ne 0 ]]; then
		printf 'ERROR(%s): Returned code "%s"\n' "$execCMD" "$errorCode"
		exit 1
	fi

	printf '\e[1m\e[30mINFO(%s): Exited successfully (return code: "%s")\e[0m\n' "$execCMD" "$errorCode"
	return 0
}





printf '\n\e[1m\e[33m####################################################################################################\e[0m\n'
printf '\e[1m\e[33mTesting stdLog()\e[0m\n'
stdLog 'info' "Log message"
checkError "stdLog" "$?"

printf '\n\e[1m\e[33m####################################################################################################\e[0m\n'
printf '\e[1m\e[33mTesting stdPath()\e[0m\n'
stdPath bat
checkError "isInstalled" "$?"

printf '\n\e[1m\e[33m####################################################################################################\e[0m\n'
printf '\e[1m\e[33mTesting stdPager()\e[0m\n'
stdPager help <<EOF
Usage:
 test [-h]

 A test of the stdPager function.

Options:
 -h  example options

EOF

checkError "stdPager" "$?"

printf '\n\e[1m\e[33m####################################################################################################\e[0m\n'
