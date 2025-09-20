#!/bin/bash
#calculation for band and dos
cp INCAR_LR INCAR
pwd
mpirun -np 14 vasp >> log
cp CONTCAR POSCAR
tail -3 OSZICAR | head -3
rm WAVECAR
echo -e "1\n102\n2\n0.02" |vaspkit >>log
pwd
mpirun -np 14 vasp >> log
cp CONTCAR POSCAR
tail -3 OSZICAR | head -3


scf
mkdir 1-scf
cp * 1-scf
cd 1-scf
cp INCAR_scf INCAR
echo -e "1\n102\n2\n0.02" |vaspkit >log
pwd
mpirun -np 14 vasp >>log
tail -3 OSZICAR | head -3

#hsescf
mkdir 2-hsescf
cp * 2-hsescf
cd 2-hsescf
cp INCAR_scfhse INCAR
#cp KPATH.in KPOINTS
pwd
echo -e "1\n102\n2\n0.03" |vaspkit >log
mpirun -np 14 vasp > log
tail -3 OSZICAR | head -3


#hse band calculation
mkdir 3-hseband
cp * 3-hseband
cd 3-hseband
cp KPATH.in KPOINTS
echo -e "25\n251\n2\n0.03\n0.04" |vaspkit >log
cp INCAR_bandhse INCAR
pwd
mpirun -np 14 vasp >>log
tail -3 OSZICAR | head -3

#chuli
echo -e "25\n252\n1" |vaspkit >hsebandchuli.dat





#cp INCAR_EC INCAR
#vaspkit -task 201
#bash elasticvaspkit.sh

