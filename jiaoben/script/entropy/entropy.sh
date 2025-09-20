#!/bin/bash
for pressure in 0.001 100 200 300 400 500 600  
do
cat > INCAR << EOF
SYSTEM = Various- local optimisation
PREC = Accurate
ENCUT = 600
EDIFF = 1e-6
IBRION = 2
ISIF =3 
NSW = 200
ISMEAR = 0
SIGMA = 0.05
POTIM = 0.1
#LVDW = .TRUE.
#No writing charge density and wavefunction
LCHARG = FALSE
LWAVE = FALSE
#Target Pressure
PSTRESS = $pressure
#Finer optimization
#EDIFFG = 1e-3
#Parallelisation
EDIFFG = -0.015
KSPACING = 0.2
NCORE = 2
NELMIN = 4
ALGO = N
EOF
mpirun -np 14 vasp > log
#mpiexec   -n 8 /share/apps/vasp/bin/vaspmpi_mkl10_O1 > log
cp OUTCAR OUTCAR-$pressure
cp CONTCAR CONTCAR-$pressure
cp CONTCAR POSCAR
done
