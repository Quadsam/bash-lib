#!/hint/bash

# List of key names
KEYCODE_NAME=("KEY_TAB" "KEY_ENTER" "KEY_ESC" "KEY_SPACE" "KEY_EXCLIMATION" "KEY_DOUBLE_QUOTE" "KEY_HASH" "KEY_DOLLAR" "KEY_PERCENT" "KEY_AMPERSAND" "KEY_QUOTE" "KEY_OPEN_PAREN" "KEY_CLOSE_PAREN" "KEY_STAR" "KEY_PLUS" "KEY_COMMA" "KEY_MINUS" "KEY_PERIOD" "KEY_SLASH" "KEY_0" "KEY_1" "KEY_2" "KEY_3" "KEY_4" "KEY_5" "KEY_6" "KEY_7" "KEY_8" "KEY_9" "KEY_COLON" "KEY_SEMI_COLON" "KEY_LESS" "KEY_EQUAL" "KEY_MORE" "KEY_QUESTION" "KEY_AT" "KEY_A" "KEY_B" "KEY_C" "KEY_D" "KEY_E" "KEY_F" "KEY_G" "KEY_H" "KEY_I" "KEY_J" "KEY_K" "KEY_L" "KEY_M" "KEY_N" "KEY_O" "KEY_P" "KEY_Q" "KEY_R" "KEY_S" "KEY_T" "KEY_U" "KEY_V" "KEY_W" "KEY_X" "KEY_Y" "KEY_Z" "KEY_OPEN_BRACKET" "KEY_BACKSLASH" "KEY_CLOSE_BRACKET" "KEY_CARROT" "KEY_UNDERSCORE" "KEY_TILDE" "KEY_a" "KEY_b" "KEY_c" "KEY_d" "KEY_e" "KEY_f" "KEY_g" "KEY_h" "KEY_i" "KEY_j" "KEY_k" "KEY_l" "KEY_m" "KEY_n" "KEY_o" "KEY_p" "KEY_q" "KEY_r" "KEY_s" "KEY_t" "KEY_u" "KEY_v" "KEY_w" "KEY_x" "KEY_y" "KEY_z" "KEY_OPEN_CURLY" "KEY_PIPE" "KEY_CLOSE_CURLY" "KEY_BACKTICK" "KEY_BACKSPACE" "KEY_FUNC_1" "KEY_FUNC_2" "KEY_FUNC_3" "KEY_FUNC_4" "KEY_ARROW_UP" "KEY_ARROW_DOWN" "KEY_ARROW_RIGHT" "KEY_ARROW_LEFT" "KEY_END" "KEY_HOME" "KEY_FUNC_5" "KEY_FUNC_6" "KEY_FUNC_7" "KEY_FUNC_8" "KEY_FUNC_9" "KEY_FUNC_10" "KEY_FUNC_12" "KEY_INSERT" "KEY_DELETE" "KEY_PAGE_UP" "KEY_PAGE_DOWN")

# List of key hex codes
KEYCODE_HEX=("09" "0a" "1b" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "2a" "2b" "2c" "2d" "2e" "2f" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "3a" "3b" "3c" "3d" "3e" "3f" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49" "4a" "4b" "4c" "4d" "4e" "4f" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "5a" "5b" "5c" "5d" "5e" "5f" "60" "61" "62" "63" "64" "65" "66" "67" "68" "69" "6a" "6b" "6c" "6d" "6e" "6f" "70" "71" "72" "73" "74" "75" "76" "77" "78" "79" "7a" "7b" "7c" "7d" "7e" "7f" "1b4f50" "1b4f51" "1b4f52" "1b4f53" "1b5b41" "1b5b42" "1b5b43" "1b5b44" "1b5b46" "1b5b48" "1b5b31357e" "1b5b31377e" "1b5b31387e" "1b5b31397e" "1b5b32307e" "1b5b32317e" "1b5b32347e" "1b5b327e" "1b5b337e" "1b5b357e" "1b5b367e")

# Description: Reads a keypress and converts to hex code
# Exports: readKey_val (key hex code)
function readKey()
{
	local key key1
	if read -rsN1 key; then
		while read -rsN1 -t0.1 key1; do key="$key$key1"; done
		readKey_val=$(printf '%s' "$key" | xxd -ps)
		export readKey_val
	fi
	return 0
}

# Description: Converts a hex code to key name
# Exports: parseKey_val (key name)
function parseKey()
{
	local i keyhex
	for ((i=0; i<${#KEYCODE_NAME[@]}; i++)); do
		keyhex="${KEYCODE_HEX[$i]}"
		if [[ $1 == "$keyhex" ]]; then
			parseKey_val="${KEYCODE_NAME[$i]}"
			break
		fi
	done
	if [[ -z $parseKey_val ]]; then
		parseKey_val="KEY_UNKNOWN"
	fi
	export parseKey_val
	return 0
}
