#!/bin/bash
n=20 
declare -A coinsDict
for((i=1; i<=$n; i++))
do 
	coinFace=HH
	Flip=$(($(($RANDOM%10))%2))
	Flip1=$(($(($RANDOM%10))%2))
	if [ $Flip -eq 1 ]
	then
   	coinFace=H
	else
   	coinFace=T
	fi
	if [ $Flip1 -eq 1 ]
	then
		coinFace=$coinFace"H"
	else
		coinFace=$coinFace"T"
	fi
	coinsDict[$coinFace]=$((${coinsDict[$coinFace]}+1))
done
for coins in ${!coinsDict[@]}
do
	echo $coins $((${coinsDict[$coins]}*100/$n))"%"
done
