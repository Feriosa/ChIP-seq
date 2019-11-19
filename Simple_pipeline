## Paired-end alignment with bowtie2 ##

#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J alignment
#SBATCH -o alignment.out
#SBATCH -e alignment.err
#SBATCH --mail-user feride_ayten.eren@med.lu.se
#SBATCH --mail-type=ALL

module load GCC/5.4.0-2.26
module load OpenMPI/1.10.3
module load Bowtie2/2.3.2

bowtie2 -x hg38 -1 CR025_wo_S16_R1_001.fastq.gz -2 CR025_wo_S16_R2_001.fastq.gz -S CR025_wo_S16.sam

## Sam files to Bam files ##

#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J SAMtoBAM
#SBATCH -o SAMtoBAM.out
#SBATCH -e SAMtoBAM.err
#SBATCH --mail-user feride_ayten.eren@med.lu.se
#SBATCH --mail-type=ALL

module purge
module load GCC/4.9.3-binutils-2.25
module load OpenMPI/1.8.8
module load SAMtools/1.3

samtools view -S -b CR025_wo_S16.sam > CR025_wo_S16.sam.bam

## Keep best unique alignment ## 

#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J mapq10
#SBATCH -o mapq10.out
#SBATCH -e mapq10.err
#SBATCH --mail-user feride_ayten.eren@med.lu.se
#SBATCH --mail-type=ALL

module purge
module load GCC/4.9.3-binutils-2.25
module load OpenMPI/1.8.8
module load SAMtools/1.3

samtools view -b -q 10 CR025_wo_S16.sam.bam > CR025_wo_S16.sam.filtered.bam

## Sort and Index Bam files ##

#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J sort_index
#SBATCH -o sort_index.out
#SBATCH -e sort_index.err
#SBATCH --mail-user feride_ayten.eren@med.lu.se
#SBATCH --mail-type=ALL

module purge
module load GCC/4.9.3-binutils-2.25
module load OpenMPI/1.8.8
module load SAMtools/1.3

samtools sort CR025_wo_S16.sam.filtered.bam -o CR025_wo_S16.sam.filtered.sorted.bam
samtools index CR025_wo_S16.sam.filtered.sorted.bam

## Calling peaks with MACS2 ##

#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J peakcalling
#SBATCH -o macs2.out
#SBATCH -e macs2.err
#SBATCH --mail-user feride_ayten.eren@med.lu.se
#SBATCH --mail-type=ALL

module purge
module load GCC/4.9.3-2.25 
module load OpenMPI/1.10.2
module load MACS2/2.1.0.20150731-Python-2.7.11

macs2 callpeak -t CR025_wo_S16.sam.filtered.sorted.bam -c CR023_wo_S14.sam.filtered.sorted.bam -f BAM -g 2.7e+9 --broad -n CR025 --outdir /projects/fs1/feride1/project/macs2 2> CR024.log

## Cross Correlation ##

#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J CrossCorrelation
#SBATCH -o CrossCorrelation.out
#SBATCH -e CrossCorrelation.err
#SBATCH --mail-user feride_ayten.eren@med.lu.se
#SBATCH --mail-type=ALL

module purge 
module load GCC/7.3.0-2.30
module load OpenMPI/3.1.1
module load R/3.5.1

Rscript /projects/fs1/feride1/project/macs2/CR025_model.r






