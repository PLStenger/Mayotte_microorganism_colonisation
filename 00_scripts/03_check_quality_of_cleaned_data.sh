#!/usr/bin/env bash

# installing FastQC from https://www.bioinformatics.babraham.ac.uk/projects/download.html
# FastQC v0.11.9 (Mac DMG image)

# Correct tool citation : Andrews, S. (2010). FastQC: a quality control tool for high throughput sequence data.

## WORKING_DIRECTORY=/scratch_vol1/fungi/Mayotte_microorganism_colonisation/03_cleaned_data/Original_reads_TUFA
## OUTPUT=/scratch_vol1/fungi/Mayotte_microorganism_colonisation/04_quality_check/Original_reads_TUFA
## 
## # Make the directory (mkdir) only if not existe already(-p)
## mkdir -p $OUTPUT
## 
## eval "$(conda shell.bash hook)"
## conda activate fastqc
## 
## cd $WORKING_DIRECTORY
## 
## for FILE in $(ls $WORKING_DIRECTORY/*.fastq.gz)
## do
##       fastqc $FILE -o $OUTPUT
## done ;
## 
## conda deactivate fastqc
## conda activate multiqc
## 
## # Run multiqc for quality summary
## 
## multiqc $OUTPUT
## 
## 
WORKING_DIRECTORY=/scratch_vol1/fungi/Mayotte_microorganism_colonisation/03_cleaned_data/Original_reads_16S_ITS_18S
OUTPUT=/scratch_vol1/fungi/Mayotte_microorganism_colonisation/04_quality_check/Original_reads_16S_ITS_18S

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

eval "$(conda shell.bash hook)"
conda activate fastqc

cd $WORKING_DIRECTORY

for FILE in $(ls $WORKING_DIRECTORY/*.fastq.gz)
do
      fastqc $FILE -o $OUTPUT
done ;

conda deactivate fastqc
conda activate multiqc

# Run multiqc for quality summary

multiqc $OUTPUT
