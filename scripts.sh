#!/bin/bash

function print_ip() {
    IP=$(
        ip ${1} | \
        grep "inet " | \
        awk '{print $2}'
)  
    echo ${IP}
}
