#! /bin/bash    

echo -e "Example 1 \n-------------"
echo "hello"

for i in {1,2,3,4}; do              #("for" starts the loop, "i" is the counter, "{1,2,3,4}" is the ammount of loops, "do" is the command to start the instruction)
    echo "hi there"
done                                #("done" closes the loop)
echo -e "\n-------------"
######################################################

echo -e "Example 2 \n -------------"
echo "hello again"

for i in {1,2,3,4}; do
    echo -e "hi there \n*************"
    ls 
done 
echo -e "\n-------------"

#######################################################
echo -e "Example 3 \n-------------"
echo "hello again"

for i in {1,2,3,4}; do
    echo -e "hi there \n*************"
    echo "the value of i is:    $i"             #(we can access the value of i within the loop)
done 
echo -e "\n-------------"

#######################################################
echo -e "Example 4 \n-------------"
echo "hello again"
for i in {a,b,c,d}; do                          #(The value of i doesn't have to be a number)
    echo -e "hi there \n*************"
    echo "the value of i is:    $i"             
done 
echo -e "\n-------------"

#######################################################
echo -e "Example 5 \n-------------"
echo "hello again"
for i in {"Fox","Chicken","Man","Grain"}; do                          #("i" will enter the loop assuming each value within the curly brackets until completed)
    echo -e "hi there \n*************"
    echo "the value of i is:    $i"             
done 
echo -e "\n-------------"

#######################################################
echo -e "Example 6 \n-------------"
echo "hello again"
for i in {"Fox","Chicken","Man","Grain"}; do                          
    echo -e "hi there \n*************"
#    touch "${i}.txt"                                                  #(this will create a txt file named the value of i for each time we loop i.e. Fox.txt, Chicken.txt, Man.txt, Grain.txt)
done 
echo -e "\n-------------"

#######################################################
echo -e "Example 7 \n-------------"
for i in {3..12}; do                                                    #(value of i becomes 3-12 at each loop)
    echo "the value of i is:    $i"   
done

#######################################################
echo -e "Example 8 \n-------------"
for i in {b..f}; do                                                    #(value of i becomes b-f at each loop)
    echo "the value of i is:    $i"   
done

#######################################################
echo -e "Example 9 \n-------------"
for i in {b..f}{1..3}_file; do                                                    #(value of i becomes "b1_file" - "f3_file" at each loop)
    echo "the value of i is:    $i"   
#    touch "${i}.txt"                                                  #(this will create a txt file named the value of i for each time we loop i.e. b1_file.txt - f3_file.txt)
done
echo -e "\n-------------"

###### Explaining "Break" #########

echo -e "Example 10 \n-------------"
echo "hello again"
for i in {"Fox","Chicken","BAD","Man","Grain"}; do                          
    echo -e "hi there \n*************"
    echo "the value of i is:    $i"  
    if [ "$i" == "BAD" ]; then
        echo "break the loop at BAD"
        break                                                           #("break" forces the loop to stop")
    fi
done 
echo -e "\n-------------"

#######################################################
echo -e "Example 11 \n-------------"
echo "hello again"
for i in ./* ; do                                                       #("./" is current directory, "*" means all, so this would echo each filename in the current directory)
    echo "the file is:   $i"
done
echo -e "\n-------------"

#######################################################
echo -e "Example 12 \n-------------"
echo "hello again"
for i in ./*.txt ; do                                                       #("./" is current directory, "*" means all, adding "".txt" specifies the file type, so this would echo each filename of txt files in the current directory)
    echo "the file is:   $i"
done
echo -e "\n-------------"

#### "i" is the commonly used variable for loops, however it doesn't have to be i ###

### Modern syntax for for loops with just numbers

echo -e "Example 13 \n-------------"
echo "hello again"

for (( i = 0; i < 25; i=i+1)); do                                           #(this version sets a starting valie of i (0), gives it a break condition (stop when i is no longer smaller than 25), and dictates the increment (1) to increase i before the loop starts again)
    echo "the value of i is:    $i"  
done

#######################################################
echo -e "Example 14 \n-------------"
echo "hello again"

for (( i = 0; i < 25; i=i+3)); do                                           #(this version sets a starting valie of i (0), gives it a break condition (stop when i is no longer smaller than 25), and dictates the increment (3) to increase i before the loop starts again)
    echo "the value of i is:    $i"  
done