#! /bin/bash


#Creation of a script that allows calculation from current bash shell without having to switch to a different bc environment
#Result will be "calc" command with two forms, standard calc will result in 3 decimal places e.g. calc 4+7
#or running calc -p followed by an integer, then the calculation required will set the precision to the given integer before calculation
#i.e. calc -p 4 1/3  will set precision to 4 (4 decimal places) before running the calculation

echo "****** Calculator Script ******"

if [ "$1" == "-p" ]; then               #if the first parameter of the calc command is -p i.e. precision is being manually set
    precision=$2                        #then the second parameter has to be the level of precision required
    shift 2                             #since parameters 1 + 2 are being used to set the precision level, we only want 
                                        #parameters 3 onwards to be considered part of the calculation
else
    precision=3                         #otherwise if no precision value is enterred, leave it at 3 D.P and take calculate from the first parameter enterred
fi

bc << _EOF_                             #redirrected bc command, sends the following input "document" to the bc environment without opening the bc environment
scale=$precision                        
$@                                      
_EOF_

#Above sets scale to the precision variable, then passes all remaining parameters of calc command into bc
#in order to be able to run "calc" instead of "calc.sh" we need to set an alias in .bashrc

#Create Alias "calc" to run the calc.sh script via source
#alias calc='source calc.sh'

#Path variable already updated as part of the "back" script
