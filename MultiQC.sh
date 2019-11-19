#!/bin/bash
#SBATCH -n 10
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J multiQC
#SBATCH -o multiQC.out
#SBATCH -e multiQC.err

FASTQC_OUT= /projects/fs1/feride1/project/data/samples1_chimp/chimp_seq042_45/fastqc
ml load GCC/5.4.0-2.26 OpenMPI/1.10.3 git MultiQC
multiqc /projects/fs1/feride1/project/data/samples1_chimp/chimp_seq042_45/fastqc/*_fastqc.zip -o $FASTQC_OUT
