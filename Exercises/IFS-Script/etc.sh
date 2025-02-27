#! /bin/bash

#Creation of a script that allows the user to search the file /etc/passwd for specific usernames and output the data as seperate fields
#The file uses colon as its field seperator so we need to manipulate IFS in this script

FILE=/etc/passwd                                                    #sets file directory as variable FILE

read -p "Enter the name of the Username: " username                 #outputs quote then stores following input as variable username

info=$(grep "$username" $FILE)                                      #greps the username variable into the file variable and stores as info variable 
                                                                    #(searches file for username)
echo "$info"

old_IFS=$IFS                                                        #stores standard IFS as variable
IFS=":"                                                             #changes IFS to :

if [ -n "$info" ]; then                                             #If the info variable is NOT empty (the username was found in the file)then
    read user pw uid gid full home shell <<< "$info"                #Here string redirect the info variable into the read command as the 7 new variables and echo
    echo "User: $user" 
    echo "Pass: $pw" 
    echo "UID: $uid" 
    echo "GID: $gid"
    echo "Name: $full" 
    echo "Home: $home"
    echo "Shell: $shell"
else                                                                #Otherwise if the info variable is empty (the username was not found in the file) then
    echo "User Not Found"
fi 

IFS=$old_IFS                                                        #Revert IFS back to starting conditions
