#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J fastqc
#SBATCH -o fastqc.out
#SBATCH -e fastqc.err
#SBATCH --mail-user feride_ayten.eren@med.lu.se
#SBATCH --mail-type=ALL

module purge
module load fastqc/0.11.3

FASTQC_OUT=/projects/fs1/feride1/project/data/samples1_chimp/chimp_seq042_45/fastqc

fastqc -f fastq /projects/fs1/feride1/project/data/samples1_chimp/chimp_seq042_45/CR029_wo_S4/*.fastq.gz /projects/fs1/feride1/project/data/samples1_chimp/chimp_seq042_45/CR030_wo_S5/*.fastq.gz /projects/fs1/feride1/project/data/samples1_chimp/chimp_seq042_45/CR031_wo_S6/*.fastq.gz /projects/fs1/feride1/project/data/samples1_chimp/chimp_seq042_45/CR032_wo_S7/*.fastq.gz /projects/fs1/feride1/project/data/samples1_chimp/chimp_seq042_45/CR033_wo_S8/*.fastq.gz /projects/fs1/feride1/project/data/samples1_chimp/chimp_seq042_45/CR034_wo_S9/*.fastq.gz -o $FASTQC_OUT
