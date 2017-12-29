#!/bin/bash 

echo '--------------------- Sorted Check by Michkata -------------------' > sortedCheck.txt 

VARIABLES=('error ips' 'error hostname' 'error os' 'error name' 'error diff ips' 'error vps is' 'error vps status' 'error plan' 'vpses no longer exists' 'vps is not')

for (( i= 0; i < ${#VARIABLES[@]}; i++))
do
	cat vps-consistency.txt | grep "${VARIABLES[$i]}" >> sortedCheck.txt
	echo '----------------------------------------------' >> sortedCheck.txt
done




