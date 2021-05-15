#!/bin/bash
n=20
declare -A combinations 
declare -A coinsDict
declare -A doubletdict
declare -A tripletdict
for((i=1; i<=$n; i++))
do 
	coinFace=H
	Flip=$(($(($RANDOM%10))%2))
	Flip1=$(($(($RANDOM%10))%2))
	Flip2=$(($(($RANDOM%10))%2))
	if [ $Flip -eq 1 ]
	then
   	coinFace=H
	else
   	coinFace=T
	fi
	coinsDict[$coinFace]=$((${coinsDict[$coinFace]}+1))
	combinations[$coinFace]=$((${combinations[$coinFace]}+1))
	if [ $Flip1 -eq 1 ]
	then
		coinFace=$coinFace"H"
	else
		coinFace=$coinFace"T"
	fi
	doubletdict[$coinFace]=$((${doubletdict[$coinFace]}+1))
	combinations[$coinFace]=$((${combinations[$coinFace]}+1))
   if [ $Flip2 -eq 1 ]
   then
      coinFace=$coinFace"H"
   else
      coinFace=$coinFace"T"
   fi
	tripletdict[$coinFace]=$((${tripletdict[$coinFace]}+1))
	combinations[$coinFace]=$((${combinations[$coinFace]}+1))
done
echo "singlet"
for k in "${!coinsDict[@]}"
do
    echo $k ' - ' $((${coinsDict[$k]}*100/$n))"%"
done |
sort -rn -k3

echo "highest among singlet"
for k in "${!coinsDict[@]}"
do
    echo $k ' - ' $((${coinsDict[$k]}*100/$n))"%"
done |
sort -rn -k3 | head -1


echo "doublet"
for k in "${!doubletdict[@]}"
do
    echo $k ' - ' $((${doubletdict[$k]}*100/$n))"%"
done |
sort -rn -k3 

echo "highest among doublet"
for k in "${!doubletdict[@]}"
do
    echo $k ' - ' $((${doubletdict[$k]}*100/$n))"%"
done |
sort -rn -k3 | head -1


echo "triplet"
for k in "${!tripletdict[@]}"
do
    echo $k ' - ' $((${tripletdict[$k]}*100/$n))"%"
done |
sort -rn -k3 

echo "highest among triplet"
for k in "${!tripletdict[@]}"
do
    echo $k ' - ' $((${tripletdict[$k]}*100/$n))"%"
done |
sort -rn -k3 | head -1


echo "highest among all combinations"
for k in "${!combinations[@]}"
do

    echo $k ' - ' $((${combinations[$k]}*100/$n))"%"
done |
sort -rn -k3 | head -1
