#!/bin/bash
path=`pwd`
for i in s_*
do
  cd $path/$i
  pwd
  bash opt.sh
done
