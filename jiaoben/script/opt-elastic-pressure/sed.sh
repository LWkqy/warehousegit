#!/bin/bash
#tihuan VPKIT 1-2
path=`pwd`
for i in s_*
do
  cd $path/$i
  pwd
  sed -i '1s/.*/2/g' VPKIT.in
  vaspkit -task 201 > el.dat
done

