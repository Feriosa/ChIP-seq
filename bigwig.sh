### Creating a bigwig file from input bam and histone modifications bam #######

#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J bw
#SBATCH -o bw.out
#SBATCH -e bw.err
#SBATCH --mail-user feride_ayten.eren@med.lu.se
#SBATCH --mail-type=ALL

module purge
module load GCC/7.3.0-2.30
module load OpenMPI/3.1.1
module load deepTools/2.5.4-Python-3.6.6

bamCompare -b1 CR024_wo_S15.sam.filtered.sorted.bam -b2 CR023_wo_S14.sam.filtered.sorted.bam -o CR024_H3K4me1.bw
