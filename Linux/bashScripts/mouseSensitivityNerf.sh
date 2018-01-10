#! /bin/bash

while getopts i:d:s: option
do
        case "${option}"
        in
                i) INCREASE=${OPTARG};;
                d) DECREASE=${OPTARG};;
                s) SET=${OPTARG};;
        esac
done

ids=$(xinput --list --short | grep "Naga Epic Chroma" | grep "pointer" | cut -c55-57)

for id in ${ids[@]}; do

  if [[ "$INCREASE" -ne "" ]];
  then
    val=$( xinput --list-props $id | grep "(280)" | cut -c44-44)
    val=$(($val+$INCREASE))
    xinput --set-prop $id 280 $val
    notify-send -u normal -t 500 -i mouse "Mouse sensitivity is now : $val"
  fi

  if [[ "$DECREASE" -ne "" ]];
  then
    val=$( xinput --list-props $id | grep "(280)" | cut -c44-44)
    val=$(($val-$DECREASE))
    xinput --set-prop $id 280 $val
    notify-send -u normal -t 500 -i mouse "Mouse sensitivity is now : $val"
  fi

  if [[ "$SET" -ne "" ]];
  then
    xinput --set-prop $id 280 $SET
  fi

done
