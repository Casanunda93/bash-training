#! /bin/bash

read -p "give me a number " numb
echo "-----------------------"

if [ $numb -eq 18 ]; then 
    echo "It is 18"
else 
    echo "not 18"
fi

if [ $numb -ne 18 ]; then 
    echo "Really not 18"
fi

if [ $numb -lt 18 ]; then 
    echo "It is lower than 18"
fi

if [ $numb -gt 18 ]; then 
    echo "It is greater than 18"
fi

if [ $numb -le 18 ]; then 
    echo "It is lower than or equal to 18"
fi

if [ $numb -ge 18 ]; then 
    echo "It is greater than or equal to 18"
fi