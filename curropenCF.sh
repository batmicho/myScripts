#!/bin/bash

lsof | awk '{print $1 " || " $9}'


