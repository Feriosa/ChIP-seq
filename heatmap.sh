#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J heatmap
#SBATCH -o heatmap.out
#SBATCH -e heatmap.err
#SBATCH --mail-user feride_ayten.eren@med.lu.se
#SBATCH --mail-type=ALL

module purge
module load GCC/7.3.0-2.30
module load OpenMPI/3.1.1
module load deepTools/2.5.4-Python-3.6.6

plotHeatmap -m matrix2.mat.gz -out heatmap.png


