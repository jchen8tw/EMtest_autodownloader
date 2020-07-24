#!/bin/zsh

#getting option
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -c | --chapter )
    shift;
    CHAPTER=$1
    ;;
  -u | --unit )
    shift; UNIT=$1
    ;;
  -e | --exams )
    shift; EXAM=$1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi


set -e

for i in {1..$EXAM}; do
    if (( i < 10)); then
        wget "http://em.emedu.org.tw/exam/0${UNIT}0${CHAPTER}/${UNIT}${CHAPTER}0${i}.png";
        wget "http://em.emedu.org.tw/exam/0${UNIT}0${CHAPTER}/${UNIT}${CHAPTER}0${i}_a.png";
    else
        wget "http://em.emedu.org.tw/exam/0${UNIT}0${CHAPTER}/${UNIT}${CHAPTER}${i}.png";
        wget "http://em.emedu.org.tw/exam/0${UNIT}0${CHAPTER}/${UNIT}${CHAPTER}${i}_a.png";
    fi

done
