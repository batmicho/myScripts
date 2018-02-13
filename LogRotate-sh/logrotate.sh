#!/bin/bash

logs="./logs/*.log";
rdygz="./logs/*.*.gz";
    
    echo $logs;
    echo "-----";
    echo $rdygz;
    echo "----";
    # echo ${rdygz[@]};
    echo "----";

#     for b in $rdygz; 
#         do  
#            echo $b
#         done
    
#  for i in $logs; do mv $i $i.1 && gzip $i.1 ; done

echo "----" ;

#    find . -type f -exec rm {} \;
