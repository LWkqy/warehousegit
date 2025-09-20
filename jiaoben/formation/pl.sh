#!/bin/bash
path=`pwd`
for i in in #s_*
do
  cd $path/$i
  pwd   
  
#  mkdir PS
#  cp POSCAR PS
#  cp INCAR_formation PS
#  cd PS/

    echo -e "1\n102\n2\n0.02" |vaspkit >> log
    cp INCAR_formation INCAR
    mpirun -np 2 vasp

  
 
done
