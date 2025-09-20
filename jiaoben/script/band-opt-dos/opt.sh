#!/bin/bash
#calculation for E-V curse
cp INCAR_LR INCAR
 mpirun -np 14 vasp >> log
cp CONTCAR POSCAR
rm WAVECAR
echo -e "1\n102\n1\n0.02" |vaspkit
cp INCAR_SR INCAR
 mpirun -np 14 vasp >> log
cp CONTCAR POSCAR
mkdir dos
cp * dos
cd dos
cp INCAR_DOS INCAR
mpirun -np 14 vasp
mkdir band
cp * band
cd band
cp INCAR_BAND INCAR
cp KPATH.in KPOINTS
mpirun -np 14 vasp
#cp INCAR_EC INCAR
#vaspkit -task 201
#bash elasticvaspkit.sh

