#! /bin/bash  

read -p "say something to greet me! " d
echo "----------------------"

if [ "$d" == "hello" ]; then
    echo "Hello To You"
elif [ "$d" == "good morning" ]; then
    echo "Good Morning To You"
elif [ "$d" == "good afternoon" ]; then
    echo "Good Afternoon To You"
elif [ "$d" == "good evening" ]; then
    echo "Good Evening To You"
elif [ "$d" == "goodbye" ]; then
    echo "Goodbye To You"
else 
    echo "Have a Nice Day"
fi

echo -e "\nThe Program Continues"
