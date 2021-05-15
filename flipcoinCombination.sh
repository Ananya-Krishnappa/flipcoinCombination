#!/bin/bash
n=20 
declare -A coinsDict
for((i=1; i<=$n; i++))
do 
	coinFace=Head
	Flip=$(($(($RANDOM%10))%2))
	if [ $Flip -eq 1 ]
	then
   	coinFace=Head
	else
   	coinFace=Tail
	fi
	coinsDict[$coinFace]=$((${coinsDict[$coinFace]}+1))
done
for coins in ${!coinsDict[@]}
do
	echo $coins $((${coinsDict[$coins]}*100/$n))"%"
done
