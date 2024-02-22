#!/usr/bin/env bash

# trimmomatic version 0.39
# trimmomatic manual : http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf

####################################################
# Cleaning step
####################################################

######################################################################################################################################################
######################################################################################################################################################
###### 16S ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/01_raw_data/V34/2_Filtered/Original_reads
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/03_cleaned_data/16S

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

ADAPTERFILE=/scratch_vol1/fungi/Mayotte_microorganism_colonisation/99_softwares/adapters_sequences.fasta

# Arguments :
# ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150

eval "$(conda shell.bash hook)"
conda activate trimmomatic

cd $WORKING_DIRECTORY


for FILE in $(ls $WORKING_DIRECTORY/*_R1_001.fastq.gz)
do
	withpath="${FILE}"
	filename=${withpath##*/}
	base="${filename%*_*.fastq.gz}"
	echo "${base}"
	
	trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/"${base}"*_R1.fastq.gz $WORKING_DIRECTORY/"${base}"*_R2.fastq.gz $OUTPUT/"${base}"*_R1.paired.fastq.gz $OUTPUT/"${base}"*_R1.single.fastq.gz $OUTPUT/"${base}"*_R2.paired.fastq.gz $OUTPUT/"${base}"*_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
	
done ;


######################################################################################################################################################
######################################################################################################################################################
###### ITS ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/01_raw_data/ITS2_custom/2_Filtered/Original_reads
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/03_cleaned_data/ITS

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

ADAPTERFILE=/scratch_vol1/fungi/Mayotte_microorganism_colonisation/99_softwares/adapters_sequences.fasta

# Arguments :
# ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150

eval "$(conda shell.bash hook)"
conda activate trimmomatic

cd $WORKING_DIRECTORY


for FILE in $(ls $WORKING_DIRECTORY/*_R1_001.fastq.gz)
do
	withpath="${FILE}"
	filename=${withpath##*/}
	base="${filename%*_*.fastq.gz}"
	echo "${base}"
	
	trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/"${base}"*_R1.fastq.gz $WORKING_DIRECTORY/"${base}"*_R2.fastq.gz $OUTPUT/"${base}"*_R1.paired.fastq.gz $OUTPUT/"${base}"*_R1.single.fastq.gz $OUTPUT/"${base}"*_R2.paired.fastq.gz $OUTPUT/"${base}"*_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
	
done ;


######################################################################################################################################################
######################################################################################################################################################
###### TUFA ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/01_raw_data/tufA/2_Filtered/Original_reads
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/03_cleaned_data/TUFA

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

ADAPTERFILE=/scratch_vol1/fungi/Mayotte_microorganism_colonisation/99_softwares/adapters_sequences.fasta

# Arguments :
# ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150

eval "$(conda shell.bash hook)"
conda activate trimmomatic

cd $WORKING_DIRECTORY


for FILE in $(ls $WORKING_DIRECTORY/*_R1_001.fastq.gz)
do
	withpath="${FILE}"
	filename=${withpath##*/}
	base="${filename%*_*.fastq.gz}"
	echo "${base}"
	
	trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/"${base}"*_R1.fastq.gz $WORKING_DIRECTORY/"${base}"*_R2.fastq.gz $OUTPUT/"${base}"*_R1.paired.fastq.gz $OUTPUT/"${base}"*_R1.single.fastq.gz $OUTPUT/"${base}"*_R2.paired.fastq.gz $OUTPUT/"${base}"*_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
	
done ;


######################################################################################################################################################
######################################################################################################################################################
###### 18S ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/01_raw_data/18SV4/2_Filtered/Original_reads
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/03_cleaned_data/18S

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

ADAPTERFILE=/scratch_vol1/fungi/Mayotte_microorganism_colonisation/99_softwares/adapters_sequences.fasta

# Arguments :
# ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150

eval "$(conda shell.bash hook)"
conda activate trimmomatic

cd $WORKING_DIRECTORY


for FILE in $(ls $WORKING_DIRECTORY/*_R1_001.fastq.gz)
do
	withpath="${FILE}"
	filename=${withpath##*/}
	base="${filename%*_*.fastq.gz}"
	echo "${base}"
	
	trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/"${base}"*_R1.fastq.gz $WORKING_DIRECTORY/"${base}"*_R2.fastq.gz $OUTPUT/"${base}"*_R1.paired.fastq.gz $OUTPUT/"${base}"*_R1.single.fastq.gz $OUTPUT/"${base}"*_R2.paired.fastq.gz $OUTPUT/"${base}"*_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
	
done ;
