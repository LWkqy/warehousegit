#!/bin/bash
#calculation for E-V curse
cp INCAR_LR INCAR
 mpirun -np 14 vasp >> log
cp CONTCAR POSCAR
rm WAVECAR
cp INCAR_SR INCAR
 mpirun -np 14 vasp >> log
