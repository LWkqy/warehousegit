#!/bin/bash
path=`pwd`
for i in lattice_*
do
  cd $path/$i
  pwd
  mpirun -np 14 vasp
done
