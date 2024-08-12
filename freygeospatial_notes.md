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

Redirection
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

