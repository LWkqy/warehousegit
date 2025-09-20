#!/bin/bash
for pressure in 0.001 100 200 300 400 500 600 700 800 900 1000    
do
cat > INCAR_LR << EOF
Global Parameters
ISTART =  0            (Read existing wavefunction, if there)
LREAL  = .FALSE.       (Projection operators: automatic)
ENCUT  =  750        (Cut-off energy for plane wave basis set, in eV)
LWAVE  = F        (Write WAVECAR or not)
LCHARG = F        (Write CHGCAR or not)
ADDGRID= .TRUE.        (Increase grid, helps GGA convergence) 
Lattice Relaxation
NSW    =  300          (number of ionic steps)
ISMEAR =  0            (gaussian smearing method )
SIGMA  =  0.05         (please check the width of the smearing)
IBRION =  2            (Algorithm: 0-MD, 1-Quasi-New, 2-CG)
ISIF   =  3            (optimize atomic coordinates and lattice parameters)
EDIFFG = -1E-03      (Ionic convergence, eV/A)
PREC   =  Accurate     (Precision level)
EDIFF = 1E-08
NCORE = 2
ALGO = N
NELMIN = 4
KSPACING = 0.2
GGA = PS
PSTRESS = $pressure
EOF
mkdir s_$pressure
cp INCAR_LR s_$pressure
done


for pressure in 0.001 100 200 300 400 500 600 700 800 900 1000 
do
cat > INCAR_SR << EOF
Global Parameters
ISTART =  0            (Read existing wavefunction, if there)
LREAL  = .FALSE.       (Projection operators: automatic)
ENCUT  =  750        (Cut-off energy for plane wave basis set, in eV)
LWAVE  = F        (Write WAVECAR or not)
LCHARG = F        (Write CHGCAR or not)
ADDGRID= .TRUE.        (Increase grid, helps GGA convergence)


Lattice Relaxation
NSW    =  300          (number of ionic steps)
ISMEAR =  0            (gaussian smearing method )
SIGMA  =  0.05         (please check the width of the smearing)
IBRION =  2            (Algorithm: 0-MD, 1-Quasi-New, 2-CG)
ISIF   =  2            (optimize atomic coordinates and lattice parameters)
EDIFFG = -1E-03      (Ionic convergence, eV/A)
EDIFF = 1E-08
PREC   =  Accurate     (Precision level)
NCORE = 2
ALGO = N
NELMIN = 4
KSPACING = 0.2
GGA = PS
PSTRESS = $pressure
EOF
cp INCAR_SR s_$pressure
cp INCAR_EC s_$pressure
cp VPKIT.in s_$pressure
cp opt.sh s_$pressure
cp POSCAR s_$pressure
cp POTCAR s_$pressure
cp elasticvaspkit.sh s_$pressure
done








#mpiexec   -n 8 /share/apps/vasp/bin/vaspmpi_mkl10_O1 > log
#cp OUTCAR OUTCAR-$pressure
#cp CONTCAR CONTCAR-$pressure
#cp CONTCAR POSCAR
