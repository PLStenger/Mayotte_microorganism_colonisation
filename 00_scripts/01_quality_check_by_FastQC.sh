#!/usr/bin/env bash

# installing FastQC from https://www.bioinformatics.babraham.ac.uk/projects/download.html
# FastQC v0.11.9 (Mac DMG image)

# Correct tool citation : Andrews, S. (2010). FastQC: a quality control tool for high throughput sequence data.

######################################################################################################################################################
######################################################################################################################################################
###### 16S ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/01_raw_data/V34/2_Filtered/Original_reads
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/02_quality_check/16S

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

######################################################################################################################################################
######################################################################################################################################################
###### ITS ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/01_raw_data/ITS2_custom/2_Filtered/Original_reads
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/02_quality_check/ITS

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

######################################################################################################################################################
######################################################################################################################################################
###### TUFA ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/01_raw_data/tufA/2_Filtered/Original_reads
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/02_quality_check/TUFA

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

######################################################################################################################################################
######################################################################################################################################################
###### 18S ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/01_raw_data/18SV4/2_Filtered/Original_reads
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/02_quality_check/18S

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

