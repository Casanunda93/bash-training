#! /bin/bash  

read -p "Please Enter Your First Name: " F                          #Print the quotation and then store the following input as variable F
echo "----------------------"

read -p "Please Enter Your Original Surname: " S                    #Print the quotation and then store the following input as variable S
echo "----------------------"

hello2(){                                                           #Function name: hello2
    echo "First Name: $1 "                                          #Echos first parameter given to function at point of running
    echo "Surname: $2 "                                             #Echos second parameter given to function at point of running
    echo "Greetings $1 $2 "                                         #Echos both parameters given to function at point of running
}

hello2 $F $S                                                        #Runs function setting variable F as parameter 1 and variable S as parameter 2

echo "*********************************************"

read -p "Please Enter Your Wife's First Name: " WF                  #Print the quotation and then store the following input as variable WF  
echo "----------------------"

read -p "Please Enter Your Wife's Original Surname: " WS            #Print the quotation and then store the following input as variable WS       
echo "----------------------"

hello2 $WF $WS                                                      #Runs function setting variable WF as parameter 1 and variable WS as parameter 2
