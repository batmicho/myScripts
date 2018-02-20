#!/bin/bash

logs="./logs/*.log";
rdygz=$(ls -r ./logs/*.*.gz);
    
    echo $logs;
    echo "-----";
    echo $rdygz;
    echo "--start--";  

    for fileName in  $rdygz; 
        do  
		index="${fileName//[^0-9]/}"
             echo "------" 
             echo "this is index: $index" 
           
             if [ "$index" -le '9' ]; then 
                 newindex=$((index + 1)) 
                echo "this is newindex: $newindex"
                echo "this is fileName: $fileName"
		cp  "$fileName" "${fileName/[0-9]/$newindex}" 
		echo "this is new newFileName: ${fileName/[1-9]/$newindex}"
		
		elif [ "$index" -le '11' ]; then
			newindex=$((index + 1))
			echo "this is newidex: $newindex"
			echo "this is filename: $fileName"
			cp "$fileName" "${fileName/[1-9][0-9]/$newindex}"
			echo "this is newFileName: ${fileName/[1-9][0-9]/$newindex}"
		else 
			echo "Not a number from 1 - 12 "
              fi
         done
    
    for new in $logs; do mv $new $new.1 && gzip $new.1 ; done

echo "-End-" ;

