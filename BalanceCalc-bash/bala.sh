#!/bin/bash

#Balance calculation provided from a file.

newBalance=()
calcBalacne=()
dateFrom=()

while read balance
	do 
	newBalance+=("$balance")	
				
	done < "${1:-/dev/stdin}"
	
dateFrom="${newBalance[-1]}"

dateCompare="$(echo "$dateFrom" | sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\)/\3-\2-\1/')" #reverting from date to proper format d-m-Y;

unset 'newBalance[${#newBalance[@]}-1]'
unset 'newBalance[${#newBalance[@]}-1]'

for calcBalance in "${newBalance[@]}"; 
	do
		dates=$(echo "${calcBalance/*,/}" | sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\)/\3-\2-\1/') #reverting the date fromat from d-m-y to m-d-y;	
					
			if [ "$(date -d $dates "+%s")" -le "$(date -d $dateCompare "+%s")" ]; then

			sumBal+="${calcBalance/,*/}"
			sumAl=0
			for element in ${#sumbBal};do
				sumAl=$(( $sumAl + ${sumBal[$element]} ))	
			done			
		  else 
			  echo "not a number to add"
		  fi

	done
	
	echo "$sumAl" "$dateFrom"

