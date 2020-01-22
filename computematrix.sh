#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J comMatrix
#SBATCH -o comMatrix.out
#SBATCH -e comMatrix.err
#SBATCH --mail-user feride_ayten.eren@med.lu.se
#SBATCH --mail-type=ALL

module purge
module load GCC/7.3.0-2.30
module load OpenMPI/3.1.1
module load deepTools/2.5.4-Python-3.6.6

computeMatrix scale-regions -S CR025_H3K4me3.bw CR028_H3K4me3.bw CR031_H3K4me3.bw CR034_H3K4me3.bw -R hg38_ucsc.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 300 --skipZeros -o matrix2.mat.gz


