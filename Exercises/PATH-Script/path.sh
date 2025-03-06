#! /bin/bash 

echo "***** PATH SCRIPT *****"

#Creation of a script that allows the user to perform three actions:
#1) display all directories in the Path Variable in a formatted layout
#2) search each directory in the path variable to see if a specific command is present and display which directories they are present in
#3) check to see if a specific directory is present within the path variable

#The Path variable uses colon as its field seperator so we need to manipulate IFS in this script

old_IFS=$IFS;                                                           #stores standard IFS as variable
IFS=":";

#Action 3) Check to see if a specific variable is present within the path variable

if [ "$1" == "-d" ]; then                                               #if the first parameter entered after the path command is "-d"
    my_dir="$2";                                                        #set the variable "my_dir" to the 2nd parameter i.e. the directory search term
    dir_found="0"                                                       #set variable "dir_found" to 0 i.e. directory not found at this point
    for dir in $PATH; do                                                #for loop: "dir" is the counter, loops for each directory in the path variable 
        if [ "$my_dir" == "$dir" -o "$my_dir" == "$dir/" ]; then        # -o is the syntax for OR, accounts for / at the end of the directory search term
            echo "Directory found in Path: " $dir                       #if the search term directory is equal to the directory we are in, returns confirmation message
            dir_found="1"                                               #sets "dir_found" to 1
        fi
    done
    if [ "$dir_found" == "0" ]; then                                    #"dir_found" will remain zero unless the directory is found in the previous if function
        echo "***** Directory not found in Path *****"                  #otherwise returns negative confirmation
    fi
fi

#Action 2) Search each directory in the path variable to see if a specific command is present and display which directories they are present in

if [ "$1" == "-c" ]; then                                               #if the first parameter entered after the path command is "-c" then
    my_com="$2";                                                        #set the variable "my_com" to the 2nd parameter i.e. the command search term
    com_found="0";                                                      #set variable "com_found" to 0 i.e. command not found at this point
    for dir in $PATH; do                                                #for loop: "dir" is the counter, loops for each directory in the path variable 
        if [ -e "$dir/$my_com" ]; then                                  #if the command exists in the current directory of the loop
            echo "Command Present in Path: $dir/$my_com"                #return confirmation message and location of the command
            com_found="1"                                               #set "com_found" to 1
        fi
    done
    if [ "$com_found" == "0" ]; then                                    #"com_found" will remain 0 unless the command is found in the previous if function
        echo "***** Command Not Found in Path *****"                    #otherwise returns negative confirmation
    fi
fi    

#Action 1) Display all directories in the Path Variable in a formatted layout
if [ -z "$1" ]; then                                                    #if no parameter is entered after the path command
echo -e "The following directories are stored in PATH:\n"               #Print message
    for dir in $PATH; do                                                #for loop: "dir" is the counter, loops for each directory in the path variable 
        echo "$dir"                                                     #print the current directory of the loop in the Path variable
    done 
echo -e
fi

IFS="$old_IFS"                                                          #Revert IFS back to starting conditions

#Create Alias "path" to run the path.sh script via source in .bashrc
#alias path='source path.sh'
