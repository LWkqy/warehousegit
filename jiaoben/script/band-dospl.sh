#!/bin/bash
root_path=`pwd`
for cij in `ls -F | grep /$`
do
  cd ${root_path}/$cij
    cd ${root_path}/$cij/band
    echo `pwd`
#    P_016_1
    mpirun -np 14 vasp
#cp KPATH.in KPOINTS
  done

