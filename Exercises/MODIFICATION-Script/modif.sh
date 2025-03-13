#! /bin/bash

#Creation of a script that allows a user to trend which hours of the day are most active for the modification
#of files in a given directory

dir="$1"                                                                    #Stores parameter one of the command as variable "dir" i.e. the directory of analysis

if [ ! -d $dir ]; then                                                      #if the parameter entered isn't a directory then
    echo "NOT DIR"                                                          #echo error message
    exit                                                                    #exit script
fi 

if [[ "$OSTYPE" == "linux-gnu" ]]; then                                     #Check the operating system variable to see if we are in linux
    echo "We are in a Linux environment"                                    #echo confirmation
    file_times=$(stat -c %y $dir/* | cut -c 12-13)                          #cut the hour value of most recent modifcation time from the stat block of each file in
                                                                            #the directory and store them as variable file_times using linux syntax
elif [[ "$OSTYPE" == "darwin"* ]]; then                                     #Check the operating system variable to see if we are in mac
    echo "We are in a MAC environment"                                      #echo confirmation
    file_times=$(stat -f %Sm $dir/* | cut -c 08-09)                         #cut the hour value of most recent modifcation time from the stat block of each file in
fi                                                                          #the directory and store them as variable file_times using mac syntax
                          

                                                                            #Array Initialisation: We want to count the ammount of times 
                                                                            #files in the directory were modified at each hour of the day 
                                                                            #Therefore We need to create an array containing indexes for each hour of the day,
                                                                            #0-23, setting each value to an initial count of 0
for k in {0..23}; do                                                        
    hour_count[$k]=0;
done
                                                                            #Populating the Array: Now that we have a zeroed array containing hour indexes 0-23
                                                                            #We want to access each value in the file_times variable, for each timestamp from the
                                                                            #files, we want to increase the corressponding hour_count value by one

for i in $file_times; do                                                    #For loop, i enters each value of the file_times variable
    (( hour_count[i]=${hour_count[i]} +1 ))                                 #increase the value of index i in the hours_count array by 1
done

echo "******************************************"
echo -e "HOURS \t FILES \t\t HOURS \t FILES "                               #echo basic table formatting where \t creates a tab output
echo -e "----- \t ----- \t\t ----- \t -----"

                                                                            #Displaying the array: We have already populated the hour_count array
                                                                            #i.e. We have stored the tally of which files were accessed at what hours
                                                                            #We could easily display the data as two columns, however this is a large ammount of data
                                                                            #instead we can for loop the first 12 hours, 00-11 as variable k, then create a second 
                                                                            #variable m for the following 12 hours, 12-23
for k in {0..11}; do                                                        #For loop, k enters each value of 0-11
    m=$(($k +12))                                                           #New variable m is equal to the value of k + 12 
    echo -e "$k \t ${hour_count[$k]} \t\t $m \t ${hour_count[$m]}"          #display the value of k and the hour_count value (i.e. the first 12 hours and count)
done                                                                        #then display the value of m and the hour_count value (i.e. the first 1 hours and count)

echo "******************************************"


#BUG FIXING: In Francesco's example, he had an issue regarding lines XX-XX
#The issue was that since the value of i is being taken from the variable $file_times, for hours before 10am
#the value of i was being proceeded by a zero i.e. 01, 02, 03 ... 09
#because of this, when we used i as an index in the hour_count array, the index value wasn't being seen as 01, 02 etc 
#but instead was being read as a hexadecimal value. 
#Fortunately in my version this issue hasn't arisen, however below is how he fixed it for learning purposes:

#for i in $file_times; do                           For loop, i becomes each value of variable $file_times
#    j=${i#0}                                       New variable j is equal to the variable i where, if there is a proceeding 0, the 0 is removed, otherwise j=i
#    (( hour_count[j]=${hour_count[j]} +1 ))        j replaces i as the index value in the hour_count array
#done

#It is important to note that the # in the line j=${i#0} will only strip away a PROCEEDING 0, so we don't have to worry about hours 10 and 20 for example. 
#The value after the # can also be changed depending on the proceeding number you want to remove, I have tested both of these cases via the following:

#num_test=(10 11 01 0100 10100)

#echo -e "Original Number \t Updated Number"
#echo -e "--------------- \t --------------"

#for a in {0..4}; do
#    new_num=${num_test[a]#0}
#    echo -e "${num_test[a]} \t \t \t \t $new_num"
#done 

#Which gave the following output:

#Original Number 	 Updated Number                 As we can see, only proceeding zeroes were removed
#--------------- 	 --------------
#10 	 	 	 	 10
#11 	 	 	 	 11
#01 	 	 	 	 1
#0100 	 	 	 	 100
#10100 	 	 	 	 10100

#I then changed the value being stripped from 0 to 1 which gave me thhe following output:

#Original Number 	 Updated Number                 As we can see, this time only proceeding ones were removed, the zeroes remained, good to know
#--------------- 	 --------------
#10 	 	 	 	 0
#11 	 	 	 	 1
#01 	 	 	 	 01
#0100 	 	 	 	 0100
#10100 	 	 	 	 0100

