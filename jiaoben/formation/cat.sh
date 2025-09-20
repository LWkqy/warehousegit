#!/bin/bash

path=`pwd`
for i in s_*
do
  cd $path/$i
  pwd 

#cp * POSCAR
#ls
 #  grep without OUTCAR
  
  cat POSCAR
  # tail -n 1 OSZICAR
#  tail -n 5 POSCAR
 
  #vaspkit -task 103
 #   echo -e "1\n102\n2\n0.02" |vaspkit >> log
 #   mpirun -np 4 vasp
  #cp * band


 
 
done
