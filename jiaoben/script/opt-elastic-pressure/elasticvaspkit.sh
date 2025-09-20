#!/bin/bash
root_path=`pwd`
for cij in `ls -F | grep /$`
do
  cd ${root_path}/$cij
  for s in strain_*
  do
    cd ${root_path}/$cij/$s
    echo `pwd`
    P_016_1
    mpirun -np 14 vasp
  done
done
