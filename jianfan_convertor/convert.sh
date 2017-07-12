#!/bin/bash
#usage: ./convert.sh [directory]
for f in $1/*.html; do
  if  [[ $f == *_tw.html ]];
  then
    continue
  fi
  cmd="python  langconv.py -e 'zh-hant' -f $f -t '${f%.html}_tw.html'"
  echo $cmd
  eval $cmd
done
