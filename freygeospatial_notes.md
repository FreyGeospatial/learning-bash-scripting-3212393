To find out the current shell being used, and its version:
```bash
echo $SHELL # this will also work on zsh
bash --version
```

Piping:
```bash
# pipes send output from one func or program to another, like in R
cat lorem.txt | less # sends text to less command, which allows us to scroll output with arrowkeys like in a PDF
cat lorem.txt | wc # lines, words, character count
```

## Redirection
```bash
# sends streams (input, output, error) from one file to another, e.g.:
ls > list.txt # sends output of ls to new file.
ls 1>list.txt #same as above: standard output is defined by value '1'
cat lorem.txt >> list.txt # appends output to existing file

# redirect output and error to files
ls /notreal 1>output.txt 2>error.txt # no value in output.txt, but error is saved in error.txt

# redirect file as standard input for a command:
cat < list.txt

# using 'limit string':
cat << EndOfText
This is a 
multiline
text string
EndOfText
```

clear bash screen using `clear`

## commands and built-ins
There are some programs that are part of the system (commands) and are separate from bash, though we can access them in the bash shell (e.g., `ls`).

Other programs are 'built-ins'; that is, programs and commands that are built into bash.
  - Some of them have the same names as the system commands
  - can access the full list of built-ins in the bash manual

`echo` and `printf` are built-ins and also GNU Core Util commands, which makes them overlap.
- GNU Core Utilities are fundamental commands that are used on Unix operating systems
- notice a difference between `printf` and `echo`:
  - `echo` will output a newline character, while `printf` will not

we can specify whether to use a coreutil or a built-in command; useful if functionality is in some way different, though in the case of `echo`, output is the same.
- `command echo hello`
- `builtin echo hello`

to find out if command is a coreutil or a built-in using `-V`:
- `command -V df` --> this is a system program
- `command -V echo` --> this is a built-in


**If a command is a built-in, it will automatically run the built-in shell version UNLESS you specify otherwise.** Built-ins take precedence over system-commands.
- Specific built-ins can be disabled within a bash session, however, using the `-n` option.
- For example: `enable -n echo` 
- using just `enable -n` will show all disabled commands
- re-enable using `enable <command>`


use `help` to get manual.

## Expansions and substitutions:
- tilde expansion represents the user's $HOME environment variable. e.g., echo ~
- directory that you were just in: `echo ~-`

Brance expansion creates sets or ranges.
- `echo {1..10}` --> `1 2 3 4 5 6 7 8 9 10`
- `echo {10..1}` --> `10 9 8 7 6 5 4 3 2 1`

We can pad zeros too, to all contain same number of digits:
- `echo {01..100}` --> `001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025 026 027 028 029 030 031 032 033 034 035 036 037 038 039 040 041 042 043 044 045 046 047 048 049 050 051 052 053 054 055 056 057 058 059 060 061 062 063 064 065 066 067 068 069 070 071 072 073 074 075 076 077 078 079 080 081 082 083 084 085 086 087 088 089 090 091 092 093 094 095 096 097 098 099 100`

We can do intervals with stepping: ```echo {1..30..3}```

We can echo letters:
- `echo {a..z}` --> `a b c d e f g h i j k l m n o p q r s t u v w x y z`
- `echo {A..z}` --> ```A B C D E F G H I J K L M N O P Q R S T U V W X Y Z [  ] ^ _ ` a b c d e f g h i j k l m n o p q r s t u v w x y z```

`touch file_{01..12}{A..D}` will produce 48 files: `file_01A`, `file_01B`, `file_01C`, `file_01D`, `file_02A`... 

we can remove those files using `rm file_*`

we can get the `head` of multiple files: `head -n1 {dir1,dir2,dir3}/lorem.txt`, so brace expansion can act as an iterable in this case.

## variables
```bash
a = "hello world"
echo $a
echo ${a}
echo ${a:1:9}
echo ${a:2}
echo ${a/world}
echo ${a/world/REPLACEMENT}
echo ${a//l/_}
```

## command substitution... 
```bash
echo "the current kernel is $(uname -r)"
echo "the current python version is $(python --version)"
```

## arithmetic substitution...
```bash
echo $((2 + 2))
echo $(( 4 * 5))
echo $((4 / 5)) # yields 0, which is wrong. because bash can only handle integers
```

## running multiple commands
can use one-liners, which are multiple commands contained in one line separated by semi-colons:
```bash
echo hello; echo world!
```
they can be integrated with aliases, too.

Can also create bash scripts, which are multi-line bash commands, commonly with a `.sh` extension. You can run it like so:
```bash
bash run.sh
```
You can also use a 'shebang' line, which is a `#!` prefixed to a path of the shell. 
```bash
#!/usr/bin/env/ bash run.sh
```
If we don't use the shebang line, the default shell will be used to run a shell script
```bash
./run.sh
```

Can use `nano`, or another Linux text editor. In codespaces, we can just type `code` into the terminal to create a new text file: `code myscript.sh`

to make a file an executable, use `chmod +x myscript.sh`

## displaying text with echo
there is a difference in how bash will operate on no-quotes, single-quotes, and double-quotes
```bash
echo the kernel is $(uname -r). # this will work
echo the (kernel) is $(uname -r). # this will error
echo 'the (kernel) is $(uname -r).' # this will print *everything* out as a string literal
echo "the (kernel) is $(uname -r)." # this will perform command substition within the echo
```

## variables
never include spaces on either side of assignment character, e.g.: 
```bash
a="hello world"
echo $a

# vs.

b = "hello world" # no good, will error
echo $b
```

can make variables read-only/unnable to be reassigned
`declare -r myname="FreyGeospatial"`

can make a variable all lowercase
`declare -l lowercase_var="THIS WAS UPPERCASE!"`

conversely...
`declare -u uppercase_var="THIS WAS LOWERCASE!"`

`declare -p` will tell you what variables in session have been set.

`declare` doesn't need to be used to set variables, but it can make adding requirements ontop of variables easier.

## working with numbers
```bash
echo $((4+4))
echo $((2*3))
echo $(( (3+6) - 5 * (5*2) ))

a=3
((a+=3)) # must use this, as doing a+=3 yields 33 instead
echo $a # reviels that a == 6

((a++)) # yields 7
((a--)) # yields 6
```

Look at this other scenario, though: please look at and run my executable `./arithmetic.sh`

Remember also that bash does not work with decimals. `echo $((1/3))` will yield 0 instead of 0.333.... For more precise calculations, consider using `bc` or `awk`.

```bash
# using bc to perform decimal calculations
declare -i c=1
declare -i d=3

e=$(echo "scale=3; $c/$d" | bc)

echo $e # note that this result is returned text.
```

Creating a random integer between 0 and 32,767:
```bash
echo $RANDOM
# random number between 1 and 10
echo $(( 1 + RANDOM % 10 ))
# random number between 1 and 20
echo $(( 1 + RANDOM % 20 ))
```

## comparing values
```bash
# testing whether the home directory exists
[ -d ~ ]
```

The shell returns a status code after a command completes.
- 0 means success (true)
- 1 means failure (false)

It is important to remember that bash will treat 1 as false and 0 as true!! It's counter-intuitive.

To grab the last return status:
```bash
echo $?
```
Lets check for another directory:
```bash
[ -d /bin/bash ]; echo $?; # this will return false (1) since it is a file, not a directory
[ -d /bin ]; echo $?; # this will return true (0) since it is a directory
[ -a /bin/bash]; echo $?; # returns true (0) because -a is the file operator and bash is a file
[ "cat" == "dog" ]; echo $?; # note, we can use single equal sign, but why?
[ "cat" == "cat" ]; echo $?;

# we can use > or < symbols to compare text, but lt/gt are used for numeric comparison
[ 4 -lt 5 ]; echo $?
[ 5 -lt 5 ]; echo $?
[ 6 -ht 5 ]; echo $?
[ ! 4 -lt 5 ]; echo $? # negation
```
use `help test` to see full list of operators.

double bracket notation
```bash
[[ 4 -lt 3]];echo $?
[[ -d ~ && -a /bin/bash ]]; echo $?; # does home directory exist AND does bash file exist?
[[ -d ~ && -a /bin/mash ]]; echo $?; # does home directory exist AND does mash file exist?
[[ -d ~ || -a /bin/mash ]]; echo $?; # does home directory exist OR does mash file exist?
# only run echo if true:
[[ -d ~ ]] && echo "~ is a directory"
# only run echo if command ran successfully
ls && echo "listed the directory"

false && echo "success!" # does not return val
false && echo "success!" # does return val
```

## evaluate control or  escape characters
```bash
echo -e "Name \t\tNumber";echo -e "Scott\t\t123"
```
## using printf
```bash
echo "the results are: $(( 2 + 2 )) and $(( 3 / 1 ))"
printf "The results are: %d and %d\n" $(( 2 + 2 )) $(( 3 / 1 ))
printf "The result is: %d\n" $(( 2 + 2 )) $(( 3 / 1 ))
```

See printf script for more details.

## arrays
two types of arrays:
- indexed arrays
- asssociative arrays

There is no error by specifying index in array where no val exists

```bash
snacks=("apple" "orange" "honeydew") # indexed array
declare -a snacks=("apple" "orange" "honeydew") # same as above
echo ${snacks[2]}
snacks[5]="blueberries" # can set at specific index, even if value does not come before it
snacks+=("mango") # append
echo ${snacks[@]} # return the entire array on one line but does not show missing items
for i in {0..7}; do echo "$i: ${snacks[i]}"; done
for i in {0..15}; do echo "$i: ${snacks[i]}"; done
```

associative arrays (dictionaries)
```bash
declare -A office
office[city]="San Francisco"
office["building name"]="HQ West"
echo ${office["building name"]} is in ${office[city]}
```

neither indexed nor associative array allows for nesting!

## if statements
check `if.sh` for a look at how to write an if statement.

## loops
check `while.sh` and `for.sh`.

## functions
check `functions.sh`.