#! /bin/bash

read -p "give me a filename " myfile            #(Print the quotation and then store the following input as variable myfile)
echo "-----------------------"

if [ -e "$myfile" ]; then                       #("-e" checks to see if a file exists)
    echo "the file exists"
else
    echo "The file doesn't exist"
fi

if [ -d "$myfile" ]; then                       #("-d" checks to see if a file exists and is a directory)
    echo "The file exists and is a directory"
fi

if [ -f "$myfile" ]; then                       #("-d" checks to see if a file exists and is a regular file)
    echo "The file exists and is a regular file"
fi

if [ -s "$myfile" ]; then                       #("-s" checks to see if a file exists and is not empty i.e. length greater than 0)
    echo "The file exists and has a length greater than 0"
fi

if [ -r "$myfile" ]; then                       #("-r" checks to see if a file exists and is readable)
    echo "The file exists and is readable"
fi

if [ -w "$myfile" ]; then                       #("-w" checks to see if a file exists and is writable)
    echo "The file exists and is writable"
fi

if [ -x "$myfile" ]; then                       #("-x" checks to see if a file exists and is executable)
    echo "The file exists and is executable"
fi

# remember, we can use the negate syntax, "!" to invert any of the above queries