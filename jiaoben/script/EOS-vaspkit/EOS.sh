#!/bin/bash
path=`pwd`
for i in lattice_*
do
  cd $path/$i
#  cd $path/$i/dos/dos
  
  pwd
  mpirun -np 6 vasp > log

done
