#!/bin/bash
path=`pwd`
for i in *
do
  cd $path/$i
  pwd
  sed -i "4s/2/$i/" INCAR_ULR 
  sed -i "5s/2/$i/" INCAR_ULR 
  
  sed -i "4s/2/$i/" INCAR_UDOS 
  sed -i "5s/2/$i/" INCAR_UDOS
  
  sed -i "4s/2/$i/" INCAR_UBAND 
  sed -i "5s/2/$i/" INCAR_UBAND
  #bash DFTU.sh
  
done
