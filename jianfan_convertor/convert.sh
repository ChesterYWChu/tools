#!/bin/bash
#usage: ./convert.sh [directory]
#chat_text.html => chat_text_mid.html => chat_text_tw.html
for f in $1/*.html; do
  if  [[ $f == *_tw.html ]];
  then
    continue
  fi
  cmd="python langconv.py -e 'zh-tw' -f $f -t '${f%.html}_mid.html'"
  echo $cmd
  eval $cmd
done

for f in $1/*.html; do
  if  [[ $f == *_mid.html ]];
  then
    cmd="python langconv.py -e 'zh-hant' -f $f -t '${f%_mid.html}_tw.html'"
    echo $cmd
    eval $cmd
    cmd="rm $f"
    echo $cmd
    eval $cmd
  fi
done
