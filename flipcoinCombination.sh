#!/bin/bash
Flip=$(($(($RANDOM%10))%2))
if [ $Flip -eq 1 ]
then
    echo "heads"
else
    echo "tails"
fi
