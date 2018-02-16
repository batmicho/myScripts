#!/bin/bash

logs="./logs/*.log";
rdygz="./logs/*.*.gz";
    
    echo $logs;
    echo "-----";
    echo $rdygz;
    echo "--start--";  

     for fileName in $rdygz; 
        do  
             index="${fileName//[!1-9]/}"
             echo "------" 
             echo "this is index: $index" 
           
             if [ "$index" -le '11' ]; then 
                 newindex=$((index + 1)) 
                echo "this is newindex: $newindex"
                echo "this is fileName: $fileName"
                cp  "$fileName" "${fileName/\.[0-9]\./\.$newindex\.}" 
                echo "this is new newFileName: ${fileName/\.[0-9]\./\.$newindex\.}"
            else
                  echo "no number"
              fi
         done
    
    for new in $logs; do mv $new $new.1 && gzip $new.1 ; done

echo "-End-" ;

