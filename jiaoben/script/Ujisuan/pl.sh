#!/bin/bash
path=`pwd`
for i in *
do
  cd $path/$i
  pwd
  bash DFTU.sh
  
done
