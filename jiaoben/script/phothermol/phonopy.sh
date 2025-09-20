#!/bin/bash
#houchili pdos thermodynamic
phonopy -t mesh.conf -c POSCAR
phonopy-propplot --gnuplot thermal_properties.yaml > thermal.dat
phonopy-bandplot --gnuplot > phonopy.dat
phonopy -p pdos.conf -c POSCAR
