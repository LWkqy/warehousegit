#!/bin/bash
#calculation for band and dos
cp INCAR_ULR INCAR
echo -e "1\n102\n2\n0.02" |vaspkit > log
pwd
 mpirun -np 10 vasp >> log
cp CONTCAR POSCAR
tail -3 OSZICAR | head -3

echo -e "1\n102\n2\n0.02" |vaspkit > log
 mpirun -np 10 vasp >> log
cp CONTCAR POSCAR
tail -3 OSZICAR | head -3

echo -e "1\n102\n2\n0.02" |vaspkit > log
 mpirun -np 10 vasp >> log
cp CONTCAR POSCAR
tail -3 OSZICAR | head -3

#U+dos
mkdir dos
cp * dos
cd dos
cp INCAR_UDOS INCAR
echo -e "1\n102\n2\n0.02" |vaspkit
pwd
mpirun -np 10 vasp > log
tail -3 OSZICAR | head -3

#U+BAND
mkdir band
cp * band
cd band
cp INCAR_UBAND INCAR
cp KPATH.in KPOINTS
pwd
mpirun -np 10 vasp > log
tail -3 OSZICAR | head -3


#chuli
echo -e "21\n211\n1" |vaspkit




#cp INCAR_EC INCAR
#vaspkit -task 201
#bash elasticvaspkit.sh

