# Bash Library

**!!Depriciation!!**: The `self` array has been depriciated and will be removed in a future release.

A library of bash functions to make scripting easier

## stdLib

### Variables

- **BASH_LIBS**

Provides the path to the library folder (defaults to `/opt/bash-lib`)

- **_SELF** *(associative array)*
	- `PATH`: Full path to the script
	- `DIR`: The directory where the script is stored
	- `NAME`: The name of the script

- **(DEPRECIATED) self** *(array)*
	- 0: Full path to the script **(Replaced by `${_SELF[PATH]}`)**
	- 1: The directory where the script is stored **(Replaced by `${_SELF[DIR]}`)**
	- 2: The name of the script **(Replaced by `${_SELF[NAME]}`)**

### Functions

- **stdPath()**

Check if a command exists in a folder contained in `PATH`.

- **stdPager()**

Find and run an installed pager. Checks for the `bat(1)`, and `cat(1)` utilities.

- **stdLog()**

Write a log message of type (`debug`, `error`, `info`, `warn`) with a message to stdout.

## Keyparser

### Variables

- **KEYCODE_NAME** *(array)*

Contains names for each keycode.

- **KEYCODE_HEX** *(array)*

Contains the hex code for each keycode.

### Functions

- **readKey()**

Reads a keypress and converts to hex code.

- **parseKey()**

Converts a hex code to key name.

## Tests

Scripts to test `stdlib.sh` and `keyparser.sh`
