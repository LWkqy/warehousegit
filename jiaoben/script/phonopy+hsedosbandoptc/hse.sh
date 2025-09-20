#!/bin/bash
#calculation for band and dos
cp INCAR_LR INCAR
 mpirun -np 14 vasp >> log
cp CONTCAR POSCAR
rm WAVECAR
echo -e "1\n102\n1\n0.02" |vaspkit
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

#hse calculation
mkdir hse
cp * hse
cd hse
echo -e "25\n251\n1\n0.04\n0.04" |vaspkit
cp INCAR_hband INCAR
mpirun -np 14 vasp
#chuli
echo -e "25\n252\n1" |vaspkit




#cp INCAR_EC INCAR
#vaspkit -task 201
#bash elasticvaspkit.sh

