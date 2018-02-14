#!/bin/bash

logs="./logs/*.log";
rdygz="./logs/*.*.gz";
    
    echo $logs;
    echo "-----";
    echo $rdygz;
    echo "----";  

     for b in $rdygz; 
         do  
            prefix="${b//[!1-9]/}"
            #echo "$prefix" 
            echo "------"
            if [ -z $prefix ]; then 
                 echo $prefix 
             else
                 echo "no number"
             fi
         done
    
#  for i in $logs; do mv $i $i.1 && gzip $i.1 ; done

echo "----" ;

#    find . -type f -exec rm {} \;
