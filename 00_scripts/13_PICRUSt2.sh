#!/usr/bin/env bash

###############
### For 16S ###
###############

WORKING_DIRECTORY=/scratch_vol1/fungi/BioIndic_La_Reunion_Island_Lagoon/05_QIIME2/Original_reads_16S
OUTPUT=/scratch_vol1/fungi/BioIndic_La_Reunion_Island_Lagoon/05_QIIME2/Original_reads_16S/visual

DATABASE=/scratch_vol1/fungi/BioIndic_La_Reunion_Island_Lagoon/98_database_files
TMPDIR=/scratch_vol1

cd $WORKING_DIRECTORY

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p q2-picrust2_output
mkdir -p export/q2-picrust2_output

# I'm doing this step in order to deal the no space left in cluster :
export TMPDIR='/scratch_vol1/fungi'
echo $TMPDIR

qiime picrust2 full-pipeline \
   --i-table core/RarRepSeq.qza \
   --i-seq core/RarTable.qza \
   --output-dir q2-picrust2_output \
   --p-placement-tool sepp \
   --p-threads 1 \
   --p-hsp-method pic \
   --p-max-nsti 2 \
   --verbose
   
qiime feature-table summarize \
  --i-table q2-picrust2_output/pathway_abundance.qza \
  --o-visualization q2-picrust2_output/pathway_abundance.qzv  
  
  
  
  
