#!/bin/bash
path=`pwd`
for i in s-*
do
  cd $path/$i
  pwd
# opt add elastic  
  echo -e "1\n102\n2\n0.02" |vaspkit > log
  cp INCAR_LR INCAR
  mpirun -np 14 vasp >> log
  cp CONTCAR POSCAR
  echo -e "1\n102\n2\n0.02" |vaspkit >> log
  mpirun -np 14 vasp >> log
  cp CONTCAR POSCAR
  mkdir elastic
  cp * elastic
  cd elastic
  cp INCAR_elastic INCAR
  mpirun -np 14 vasp 
  echo -e "2\n203" |vaspkit > el.dat
  #vaspkit -task 103
  #echo -e "1\n102\n2\n0.02" |vaspkit
  #mpirun -np 14 vasp
  #cp * band
  #cp /home/xu/xunanls/linih3/INCAR_pho .
  #vaspkit -task 103
  
  
  
 # cp INCAR_LR INCAR
 # mpirun -np 14 vasp
 # cp CONTCAR POSCAR
 # mpirun -np 14 vasp
 # cp CONTCAR POSCAR
 
 # mpirun -np 14 vasp
 # cp CONTCAR POSCAR
 # mpirun -np 14 vasp
 # cp CONTCAR POSCAR
 # mpirun -np 14 vasp
 # cp CONTCAR POSCAR
 # phonopy -f dis-001/vasprun.xml dis-002/vasprun.xml dis-003/vasprun.xml 
 # phonopy -p -s band.conf
  #bash dis.sh
  
  
  
  
 #cp INCAR_pho INCAR
 #mkdir pho
 #cp * pho
 #cd pho 
 #phonopy -d --dim="2 2 2"
 #mkdir dis-001
 #mkdir dis-002
 #mkdir dis-003
 #cp INCAR dis-001 & cp INCAR dis-002 & cp INCAR dis-003
 #cp POTCAR dis-001 & cp POTCAR dis-002 & cp POTCAR dis-003
 #cp POSCAR-001 dis-001
 #cp POSCAR-002 dis-002
 #cp POSCAR-003 dis-003
 #bash dis.sh  
  #mv POSCAR-001 POSCAR & echo -e "1\n102\n2\n0.02" |vaspkit
  #mv POSCAR-002 POSCAR & echo -e "1\n102\n2\n0.02" |vaspkit
  #mv POSCAR-003 POSCAR & echo -e "1\n102\n2\n0.02" |vaspkit
  
  
  #mkdir pho
  #cp * pho
  #cp INCAR_pho INCAR
  #cp CONTCAR POSCAR
  #phonopy -d --dim="2 2 2"
  #cp INCAR_LR INCAR
  #mpirun -np 14 vasp
#phonopy 
 #mkdir pho
 #cp * pho
 #cd pho
 # phonopy --symmetry
  #cp BPOSCAR POSCAR
  #mv POSCAR POSCAR-unitcell
  #phonopy -d --dim="2 2 2" -c POSCAR-unitcell
  #cp SPOSCAR POSCAR
  #echo -e "1\n102\n1\n0.02" |vaspkit
  #cp INCAR_pho INCAR
  #mpirun -np 14 vasp
 
  
  #phonopy postcaculation
  #phonopy --fc vasprun.xml
  #phonopy -c POSCAR-unitcell band.conf -p -s
  
  #vaspkit generate bandgap postcaculation
  #echo -e "21\n211\n1" |vaspkit
  
  #opt for caculation
  #bash opt.sh
 
 # DOS and band pbesol
  #mkdir dos
  #cp INCAR_DOS INCAR
  #cp * dos
  #cd dos
  #mpirun -np 14 vasp
  #cp INCAR_BAND INCAR
  #cp KPATH.in KPOINTS
  #mkdir band
  #cp * band
  #cd band
  #mpirun -np 14 vasp
  #echo -e "21\n211\n1" |vaspkit
  #mpirun -np 14  vasp
  #cd dos
  #cp INCAR_DOS INCAR
  #mpirun -np 14 vasp
  #mkdir band
  #cp * band
  #cp INCAR_BAND INCAR
  #cp KPATH.in KPOINTS
 # mpirun -np 14 vasp
 
 # generate POTCAR
 # vaspkit -task 103
 
 #generate KPOINTS
 # echo -e "1\n102\n2\n0.02" |vaspkit
done
