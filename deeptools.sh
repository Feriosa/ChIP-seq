## QC of Bam files ##
## How similarly are the reads distributed in different sequencing samples##
##Correlation among samples (deepTools: multiBamSummary or multiBigwigSummary followed by plotCorrelation)##


#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A lsens2018-3-3
#SBATCH -p dell
#SBATCH -t 05:00:00
#SBATCH -J QC_alignment
#SBATCH -o QC_alignment.out
#SBATCH -e QC_alignment.err
#SBATCH --mail-user feride_ayten.eren@med.lu.se
#SBATCH --mail-type=ALL

module purge
module load GCC/7.3.0-2.30
module load OpenMPI/3.1.1
module load deepTools/2.5.4-Python-3.6.6

multiBamSummary bins --bamfiles CR023_wo_S14.sam.filtered.sorted.bam CR025_wo_S16.sam.filtered.sorted.bam -o /projects/fs1/feride1/project/QC_alignments/result_seq042.npz --labels CR023 CR025 --extendReads=110

plotCorrelation --corData /projects/fs1/feride1/project/QC_alignments/result_seq042.npz --corMethod spearman --whatToPlot heatmap --plotFile /projects/fs1/feride1/project/QC_alignments/seq042.pdf --outFileCorMatrix /projects/fs1/feride1/project/QC_alignments/seq042.txt

## How well did your ChIP experiment work? (deepTools: plotFingerprint) ##

plotFingerprint -b CR023_wo_S14.sam.filtered.sorted.bam CR025_wo_S16.sam.filtered.sorted.bam -plot /projects/fs1/feride1/project/QC_alignments/fingerprint_seq042.pdf --outRawCounts /projects/fs1/feride1/project/QC_alignments/fingerprint_seq042.tab --labels CR023 CR025

## Processing and normalizing alignment files ## 

bamCompare -b1 CR024_wo_S15.sam.filtered.sorted.bam -b2 CR023_wo_S14.sam.filtered.sorted.bam -o CR024_log2ratio.bw

## Bam to bigwig ##

bamCoverage -b CR024_wo_S15.sam.filtered.sorted.bam -o CR024.bw --binsize 20 --normalizeUsing RPKM --smoothLength 60 --extendReads 150 --centerReads 
