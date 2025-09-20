#!/bin/bash
pwd
echo -e "1\n102\n2\n0.02" |vaspkit 
cp INCAR_eos INCAR
echo -e "2\n205" |vaspkit 
path=`pwd`
for i in lattice_*
do
  cd $path/$i
#  cd $path/$i/dos/dos
  
  pwd
  mpirun -np 14 vasp 

done
