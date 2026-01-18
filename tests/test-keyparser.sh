#!/usr/bin/env bash

source '../stdlib.sh'

while getopts ':h' OPT; do
	case $OPT in
	h)
		stdPager help <<EOF
Usage:
 ${self[2]} [-h]

 Template bash script.

Options:
 -h  show this help

EOF
		exit 0
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

#		) echo "KEY_";;
running=true
while $running; do
	if read -rsN1 key; then
		while read -rsN1 -t0.1 key1; do key="$key$key1"; done
		hexkey="$(printf '%s' "$key" | xxd -ps)"
		case $hexkey in
		09)		echo "KEY_TAB";;
		0a)		echo "KEY_ENTER";;
		1b)		echo "KEY_ESC";;
		20)		echo "KEY_SPACE";;
		21)		echo "KEY_EXCLAMATION";;
		22)		echo "KEY_DOUBLE_QUOTE";;
		23)		echo "KEY_HASH";;
		24)		echo "KEY_DOLLAR";;
		25)		echo "KEY_PERCENT";;
		26)		echo "KEY_AMPERSAND";;
		27)		echo "KEY_QUOTE";;
		28)		echo "KEY_OPEN_PAREN";;
		29)		echo "KEY_CLOSE_PAREN";;
		2a)		echo "KEY_STAR";;
		2b)		echo "KEY_PLUS";;
		2c)		echo "KEY_COMMA";;
		2d)		echo "KEY_MINUS";;
		2e)		echo "KEY_PERIOD";;
		2f)		echo "KEY_SLASH";;
		30)		echo "KEY_0";;
		31)		echo "KEY_1";;
		32)		echo "KEY_2";;
		33)		echo "KEY_3";;
		34)		echo "KEY_4";;
		35)		echo "KEY_5";;
		36)		echo "KEY_6";;
		37)		echo "KEY_7";;
		38)		echo "KEY_8";;
		39)		echo "KEY_9";;
		3a)		echo "KEY_COLON";;
		3b)		echo "KEY_SEMI_COLON";;
		3c)		echo "KEY_LESS";;
		3d)		echo "KEY_EQUAL";;
		3e)		echo "KEY_MORE";;
		3f)		echo "KEY_QUESTION";;
		40)		echo "KEY_AT";;
		41)		echo "KEY_A";;
		42)		echo "KEY_B";;
		43)		echo "KEY_C";;
		44)		echo "KEY_D";;
		45)		echo "KEY_E";;
		46)		echo "KEY_F";;
		47)		echo "KEY_G";;
		48)		echo "KEY_H";;
		49)		echo "KEY_I";;
		4a)		echo "KEY_J";;
		4b)		echo "KEY_K";;
		4c)		echo "KEY_L";;
		4d)		echo "KEY_M";;
		4e)		echo "KEY_N";;
		4f)		echo "KEY_O";;
		50)		echo "KEY_P";;
		51)		echo "KEY_Q";;
		52)		echo "KEY_R";;
		53)		echo "KEY_S";;
		54)		echo "KEY_T";;
		55)		echo "KEY_U";;
		56)		echo "KEY_V";;
		57)		echo "KEY_W";;
		58)		echo "KEY_X";;
		59)		echo "KEY_Y";;
		5a)		echo "KEY_Z";;
		5b)		echo "KEY_OPEN_BRACKET";;
		5c)		echo "KEY_BACKSLASH";;
		5d)		echo "KEY_CLOSE_BRACKET";;
		5e)		echo "KEY_CARROT";;
		5f)		echo "KEY_UNDERSCORE";;
		60)		echo "KEY_TILDE";;
		61)		echo "KEY_a";;
		62)		echo "KEY_b";;
		63)		echo "KEY_c";;
		64)		echo "KEY_d";;
		65)		echo "KEY_e";;
		66)		echo "KEY_f";;
		67)		echo "KEY_g";;
		68)		echo "KEY_h";;
		69)		echo "KEY_i";;
		6a)		echo "KEY_j";;
		6b)		echo "KEY_k";;
		6c)		echo "KEY_l";;
		6d)		echo "KEY_m";;
		6e)		echo "KEY_n";;
		6f)		echo "KEY_o";;
		70)		echo "KEY_p";;
		71)		echo "KEY_q"; running=false;;
		72)		echo "KEY_r";;
		73)		echo "KEY_s";;
		74)		echo "KEY_t";;
		75)		echo "KEY_u";;
		76)		echo "KEY_v";;
		77)		echo "KEY_w";;
		78)		echo "KEY_x";;
		79)		echo "KEY_y";;
		7a)		echo "KEY_z";;
		7b)		echo "KEY_OPEN_CURLY";;
		7c)		echo "KEY_PIPE";;
		7d)		echo "KEY_CLOSE_CURLY";;
		7e)		echo "KEY_BACKTICK";;
		7f)		echo "KEY_BACKSPACE";;
		1b4f*) # Special Keys
			specialkey=$(printf '%s' "$hexkey" | sed -r 's/1b4f//')
			case $specialkey in
			50)		echo "KEY_FUNC_1";;
			51)		echo "KEY_FUNC_2";;
			52)		echo "KEY_FUNC_3";;
			53)		echo "KEY_FUNC_4";;
			*)		printf 'Special Key: "%s"\n' "$specialkey";;
			esac
			;;
		1b5b*) # Special Keys
			specialkey=$(printf '%s' "$hexkey" | sed -r 's/1b5b//')
			case $specialkey in
			41)		echo "KEY_ARROW_UP";;
			42)		echo "KEY_ARROW_DOWN";;
			43)		echo "KEY_ARROW_RIGHT";;
			44)		echo "KEY_ARROW_LEFT";;
			45)		echo "SPECIAL UNKNOWN (45)";;
			46)		echo "KEY_END";;
			47)		echo "SPECIAL UNKNOWN (47)";;
			48)		echo "KEY_HOME";;
			31357e)	echo "KEY_FUNC_5";;
			31377e)	echo "KEY_FUNC_6";;
			31387e)	echo "KEY_FUNC_7";;
			31397e)	echo "KEY_FUNC_8";;
			32307e)	echo "KEY_FUNC_9";;
			32317e)	echo "KEY_FUNC_10";;
#			XXXXXX)	echo "KEY_FUNC_11";;
			32347e)	echo "KEY_FUNC_12";;
			327e)	echo "KEY_INSERT";;
			337e)	echo "KEY_DELETE";;
			357e)	echo "KEY_PAGE_UP";;
			367e)	echo "KEY_PAGE_DOWN";;
			*)		printf 'Special Key: "%s"\n' "$specialkey";;
			esac
			;;
		*)	printf 'Key: "%s"\n' "$hexkey";;
		esac
	fi
done
#printf '\n\n'
