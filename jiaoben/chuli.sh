#!/bin/bash




cd /home/chen/xu/XMnH3/rbmnh/1-scf/2-hsescf/optic

#tdos  
#echo -e "11\n111\n1" |vaspkit

#pdos
#echo -e "11\n113\nall\n1" |vaspkit
  
  
  
  
#optical
echo -e "71\n711\n1\n1" |vaspkit  >> log
echo -e "71\n711\n1\n2" |vaspkit  >> log
echo -e "71\n711\n1\n3" |vaspkit  >> log
echo -e "71\n711\n1\n4" |vaspkit  >> log
echo -e "71\n711\n1\n5" |vaspkit  >> log
