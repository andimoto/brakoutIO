#!/bin/bash

#====================================================================================================
# NOTE:  the following menu entries are for simple example.  You can change and/or add to them
#        whatever you need to do.   For instance you could create a Menu Entry (the first text before
#        vertical bar/pipe symbol "|".   The "action" is what follows the vertical bar/pipe symbol
#        and that could be a command like I show below using "sudo apt-get install" or it could be
#        a Bash script, Python program etc.
#
#        To use this script you **must** install YAD on your system first.   On a Debian based system
#        like Ubuntu this is installed using:  $ sudo apt-get install yad

menu=(  "Set C0|python3 ft232hIO.py C0 out high" "Reset C0|python3 ft232hIO.py C0 out low"
        "Set C1|python3 ft232hIO.py C1 out high" "Reset C1|python3 ft232hIO.py C1 out low"
        "Set C2|python3 ft232hIO.py C2 out high" "Reset C2|python3 ft232hIO.py C2 out low"
        "Set C3|python3 ft232hIO.py C3 out high" "Reset C3|python3 ft232hIO.py C3 out low"
        "Set C4|python3 ft232hIO.py C4 out high" "Reset C4|python3 ft232hIO.py C4 out low"
        "Set C5|python3 ft232hIO.py C5 out high" "Reset C5|python3 ft232hIO.py C5 out low"
        "Set C6|python3 ft232hIO.py C6 out high" "Reset C6|python3 ft232hIO.py C6 out low"
        "Set C7|python3 ft232hIO.py C7 out high" "Reset C7|python3 ft232hIO.py C7 out low"
        "Set C8|python3 ft232hIO.py C8 out high" "Reset C8|python3 ft232hIO.py C8 out low"
        "Set C9|python3 ft232hIO.py C9 out high" "Reset C9|python3 ft232hIO.py C9 out low"
        "Set D4|python3 ft232hIO.py D4 out high" "Reset D4|python3 ft232hIO.py D4 out low"
        "Set D5|python3 ft232hIO.py D5 out high" "Reset D5|python3 ft232hIO.py D5 out low"
        "Set D6|python3 ft232hIO.py D6 out high" "Reset D6|python3 ft232hIO.py D6 out low"
        "Set D7|python3 ft232hIO.py D7 out high" "Reset D7|python3 ft232hIO.py D7 out low"
       )

yad_opts=( --form
           --title="Breakout IO"
           --text="Set/Reset IO")

for m in "${menu[@]}"
do
  yad_opts+=( --field="${m%|*}:CHK" )
done

while [ 1 ]
do
	IFS='|' read -ra ans < <( yad "${yad_opts[@]}" )

	for i in "${!ans[@]}"
	do
  		if [[ ${ans[$i]} == TRUE ]]
  	then
    		m=${menu[$i]}
    		name=${m%|*}
    		cmd=${m#*|}
    		echo "selected: $name ($cmd)"
    		$cmd
  	fi
	done
done
exit 0
