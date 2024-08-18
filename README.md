# Bash Library

A library of bash functions to make scripting easier

**Contents**
- [stdlib.sh](## stdLib)
- [keyparser.sh](## Keyparser)
- [io.sh](## IO) (DEPRECIATED)
- [tests](## Tests)



## stdLib
---

**Variables**
- `BASH_LIBS`
Provides the path to the library folder (defaults to `/opt/bash-lib`)
- `self` (array)
0: Full path to the script
1: The directory where the script is stored
2: The name of the script

**Functions**
- `stdPath()`
Check if a command exists in a folder contained in `PATH`.
- `stdPager()`
Find and run an installed pager. Checks for the `bat(1)`, and `cat(1)` utilities.
- `stdLog()`
Write a log message of type (`debug`, `error`, `info`, `warn`) with a message to stdout.


## Keyparser
---

**Variables**
- `KEYCODE_NAME` (array)
Contains names for each keycode.
- `KEYCODE_HEX` (array)
Contains the hex code for each keycode.

**Functions**
- `readKey()`
Reads a keypress and converts to hex code.
- `parseKey()`
Converts a hex code to key name.


## IO
---

**Depreciated:** *Use `stdlib.sh` `stdPager()` and `stdLog()` instead*


## Tests
---

Scripts to test `stdlib.sh` and `keyparser.sh`
