#! /bin/bash

#Logic Conditions

numb=4;

if [ $numb -gt 3 -a $numb -lt 10 ]; then                        #("-a" creates an AND condition, i.e. greater than 3 AND lower than 10)
    echo "number is greater than 3 and lower than 10"
fi

if [ $numb -lt 3 -o $numb -gt 10 ]; then                        #("-o" creates an OR condition, i.e. lower than 3 OR greater than 10)
    echo "number is lower than 3 or greater than 10"
fi

#Example with files: to look for a file that is executable and NON-Empty

myfile="Frank.sh"

if [ -s "$myfile" -a -x "$myfile" ]; then
    echo "$myfile is NON-Empty and Executable"
fi

#Modern If Functions syntax

#Use double square brackets: [[ ]]
#Use && for AND operators
#Use || for OR operators
#So re-writing the above:

numb=12;

if [[ $numb -gt 3 && $numb -lt 10 ]]; then                        #("-a" creates an AND condition, i.e. greater than 3 AND lower than 10)
    echo "number is greater than 3 and lower than 10"
fi

if [[ $numb -lt 3 || $numb -gt 10 ]]; then                        #("-o" creates an OR condition, i.e. lower than 3 OR greater than 10)
    echo "number is lower than 3 or greater than 10"
fi

#Example with files: to look for a file that is executable and NON-Empty

myfile="Frank.sh"

if [[ -s "$myfile" && -x "$myfile" ]]; then
    echo "$myfile is NON-Empty and Executable"
fi
