#! /bin/bash

echo "***** MAX STRING Script *****"

#Creation of a script that counts the character length of each string in a given file and outputs the longest string and the length of that string

file_name="$1"                                                  #Store first parameter as variable "file_name"

echo "The selected file is: $file_name"

if [ -r "$file_name" ]; then                                    #If the file exists and is readable then proceed

    s=$(strings "$file_name");                                  #stores each string in the file as variable s

    ref_word='';                                                #sets reference word (ref_word) to blank
    max_len=0;                                                  #sets largest character count (max_len) to 0

    for i in $s; do                                             #for loop through each string in variable s

        len=$(echo "$i" | wc -c);                               #pipes the current string into the character count and stores as variable "len", character count
                                                                #adds one to the actual legnth of the word so has to be adjusted i.e. subtract 1 
        len=$(bc <<< "$len -1")                                 #if we could call our alias "calc" into the script the line would look like this: len=$(calc $len -1)
                                                                #However it is just as effective to redirect "$len -1" via "here string" into the bc environment and
                                                                #overwrite the value of $len
                                                                #There is a built in shell operation to count the character length of a variable: len=${#i} which is 
                                                                #significantly faster to run than the manual way we have done here
        echo "$i ---> $len"                                     #echoes the current string and its length

        if [ $len -gt $max_len ]; then                          #if the length of the current string is greater than the value of "max_len"
            max_len=$len                                        #set the value of max_len to this new longest length
            ref_word=$i                                         #set the value of ref_word to this new longest word
        fi
     
    done
    echo "***************************"
    echo "Max length is: $max_len"
    echo "Longest Word is: $ref_word"   
else                                                            #If the file is not readable or doesn't exist, print negative confirmation
    echo "File not readable/non-existent"                       
fi

#The script as written does not account for multiple strings of the same longest legnth, something to consider for later projects