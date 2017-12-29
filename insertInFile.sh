#!/bin/bash

ARG=${1}
FILE=${2}

echo ${ARG} >> ${FILE}

echo ${ARG} 'inserted on the last line' ${FILE}
