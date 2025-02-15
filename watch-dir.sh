#!/usr/bin/bash
set -x

# Rebuild project if a source file is modified or added to the current directory:

while sleep 1; 
do 
    find . -name '*.py' | ( entr -d make || true )
done