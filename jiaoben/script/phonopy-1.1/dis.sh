#!/bin/bash
path=`pwd`
for i in dis-00*
do
  cd $path/$i
  pwd
  mv POSCAR-001 POSCAR & echo -e "1\n102\n2\n0.02" |vaspkit
  mv POSCAR-002 POSCAR & echo -e "1\n102\n2\n0.02" |vaspkit
  mv POSCAR-003 POSCAR & echo -e "1\n102\n2\n0.02" |vaspkit
  mpirun -np 14 vasp
done
