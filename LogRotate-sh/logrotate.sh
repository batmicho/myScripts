#!/bin/bash

logs="./logs/*.log";
rdygz="./logs/*.*.gz";
    
    echo $logs;
    echo "-----";
    echo $rdygz;
    echo "--start--";  

     for b in $rdygz; 
        do  
             index="${b//[!1-9]/}"
             echo "------" 
             echo "this is index: $index" 
           
             if [ "$index" -le '11' ]; then 
                 sum=$((index + 1)) 
                echo "this is sum: $sum"
                echo "this is b: $b"
                cp  "$b" "${b/\.[0-9]\./\.$sum\.}" 
            else
                  echo "no number"
              fi
         done
    
    for i in $logs; do mv $i $i.1 && gzip $i.1 ; done


echo "-End-" ;

