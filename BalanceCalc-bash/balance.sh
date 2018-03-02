#!/bin/bash

# 1.file to array | get last line for dateComapre | remove last line once dateCompare removed to have only amount,date. 
# 2. loop new balance array and compare dates in it with dateCompare, if match get the amount to new Array.
# 3. the new amount summed together and the date campared to is displayed with the sum of array elements.

newBalance=()
calcBalacne=()
dateFrom=()

while read balance
	do 
		echo "$balance"
		#echo "${#balance[@]}"	
		newBalance+=("$balance")	
				
	done < "${1:-/dev/stdin}"
	
# echo "${#newBalance[@]}" #array with all balance created.

dateFrom="${newBalance[-1]}"

dateCompare="$(echo "$dateFrom" | sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\)/\3-\2-\1/')" #reverting from date to proper format d-m-Y;

echo "$dateCompare"
echo "$dateFrom"

unset 'newBalance[${#newBalance[@]}-1]'
unset 'newBalance[${#newBalance[@]}-1]'

echo "--------"

for calcBalance in "${newBalance[@]}"; 
	do
		dates=$(echo "${calcBalance/*,/}" | sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\)/\3-\2-\1/') #reverting the date fromat from d-m-y to m-d-y;	
			echo "$dates"	
			
			if [ "$(date -d $dates "+%s")" -le "$(date -d $dateCompare "+%s")" ]; then

		        echo " only sum: ${calcBalance/,*/}"
			echo " only date: ${calcBalance/*,/}"
		
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

