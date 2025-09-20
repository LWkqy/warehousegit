#!/bin/bash
#houchili pdos thermodynamic
phonopy -f dis-001/vasprun.xml dis-002/vasprun.xml dis-003/vasprun.xml
phonopy -p -s band.conf
phonopy -t mesh.conf -c POSCAR
phonopy-propplot --gnuplot thermal_properties.yaml > thermal.dat
phonopy-bandplot --gnuplot > phonopy.dat
phonopy -p pdos.conf -c POSCAR
