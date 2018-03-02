#!/bin/bash

echo '--------------------- Sorted Check by M -------------------' > sortedCheck.txt

VARIABLES=('error ips' 'error hostname' 'error os' 'error name' 'error diff ips' 'error vps status' 'error plan' 'vpses no longer exists' 'vps is not')

NOEDIT=('ids' 'moreids')

for (( i= 0; i < ${#VARIABLES[@]}; i++))
do
	cat vps-consistency.txt | grep "${VARIABLES[$i]}" >> sortedCheck.txt
	echo '----------------------------------------------' >> sortedCheck.txt
done

for (( i= 0; i < ${#NOEDIT[@]}; i++))
do
	 sed -i "/${NOEDIT[$i]}/d" sortedCheck.txt
done

echo '-------=======---------- NOT FOR EDIT  -----===========-----' >> sortedCheck.txt

for (( i= 0; i < ${#NOEDIT[@]}; i++))
do
	cat vps-consistency.txt | grep "${NOEDIT[$i]}" >> sortedCheck.txt
done
