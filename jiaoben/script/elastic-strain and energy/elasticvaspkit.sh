#!/bin/bash
root_path=`pwd`
for cij in `ls -F | grep /$`
do
  cd ${root_path}/$cij
  for s in strain_*
  do
    cd ${root_path}/$cij/$s
    echo `pwd`
    
    mpirun -np 14 vasp > log
    tail -3 OSZICAR | head -3
  done
done
