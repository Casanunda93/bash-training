#! /bin/bash 

#Creation of a script that allows you to run the command "back" with an 
#integer parameter to move back the specified number of directory steps 
#replaces "cd .."

#First step, save the parameter number enterred after the back command as a variable

max="$1";

for (( i = 1; i <= $max; i=i+1)); do                #Starting at i=0, to a max of i=max, increase i by 1 and repeat
    echo "Moving Back $i Folder(s)"                 #print the movement value
    cd ../                                          #move back a directory
done

echo "Present Directory: $(pwd)"

#This script runs in the subshell, this is usual, however in this case we want it working in the CURRENT shell
#Needs to be run with the source command
#Create Alias "back" to run the back.sh script via source
#alias back='source back.sh'

#However, In order to make back.sh visable to the .bashrc file, we have to add it's location to the $PATH variable
#We can do this by manipulating the $PATH variable within the .bashrc file

#i.e. we update $PATH variable to include new folder location for personal scripts
#PATH="/home/adam/PersonalScripts:${PATH}"
#export PATH
