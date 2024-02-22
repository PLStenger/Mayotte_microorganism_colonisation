#!/usr/bin/env bash



######################################################################################################################################################
######################################################################################################################################################
###### 16S ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/03_cleaned_data/16S
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/05_QIIME2/16S

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

# You need a "manifest" for explaining and importing your data :
# In the fastq manifest formats, a manifest file maps sample identifiers to fastq.gz or fastq absolute filepaths that contain sequence and quality data for the sample, and indicates the direction of the reads in each fastq.gz / fastq absolute filepath. The manifest file will generally be created by you, and it is designed to be a simple format that doesn’t put restrictions on the naming of the demultiplexed fastq.gz / fastq files, since there is no broadly used naming convention for these files. There are no restrictions on the name of the manifest file.
# See https://docs.qiime2.org/2018.8/tutorials/importing/

MANIFEST=/home/fungi/Mayotte_microorganism_colonisation/98_database_files/manifest_16S
TMPDIR=/home

###############################################################
### For importing your data in a Qiime2 format
###############################################################

cd $WORKING_DIRECTORY

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT/core
mkdir -p $OUTPUT/visual

# I'm doing this step in order to deal the no space left in cluster :
export TMPDIR='/home/fungi'
echo $TMPDIR

qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
			    --input-path  $MANIFEST \
			    --output-path $OUTPUT/core/demux.qza \
			    --input-format PairedEndFastqManifestPhred33V2

cd $OUTPUT

qiime demux summarize --i-data core/demux.qza --o-visualization visual/demux.qzv

# for vizualisation :
# https://view.qiime2.org

qiime tools export --input-path visual/demux.qzv --output-path export/visual/demux
qiime tools export --input-path core/demux.qza --output-path export/core/demux



######################################################################################################################################################
######################################################################################################################################################
###### ITS ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/03_cleaned_data/ITS
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/05_QIIME2/ITS

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

# You need a "manifest" for explaining and importing your data :
# In the fastq manifest formats, a manifest file maps sample identifiers to fastq.gz or fastq absolute filepaths that contain sequence and quality data for the sample, and indicates the direction of the reads in each fastq.gz / fastq absolute filepath. The manifest file will generally be created by you, and it is designed to be a simple format that doesn’t put restrictions on the naming of the demultiplexed fastq.gz / fastq files, since there is no broadly used naming convention for these files. There are no restrictions on the name of the manifest file.
# See https://docs.qiime2.org/2018.8/tutorials/importing/

MANIFEST=/home/fungi/Mayotte_microorganism_colonisation/98_database_files/manifest_ITS
TMPDIR=/home

###############################################################
### For importing your data in a Qiime2 format
###############################################################

cd $WORKING_DIRECTORY

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT/core
mkdir -p $OUTPUT/visual

# I'm doing this step in order to deal the no space left in cluster :
export TMPDIR='/home/fungi'
echo $TMPDIR

qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
			    --input-path  $MANIFEST \
			    --output-path $OUTPUT/core/demux.qza \
			    --input-format PairedEndFastqManifestPhred33V2

cd $OUTPUT

qiime demux summarize --i-data core/demux.qza --o-visualization visual/demux.qzv

# for vizualisation :
# https://view.qiime2.org

qiime tools export --input-path visual/demux.qzv --output-path export/visual/demux
qiime tools export --input-path core/demux.qza --output-path export/core/demux



######################################################################################################################################################
######################################################################################################################################################
###### TUFA ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/03_cleaned_data/TUFA
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/05_QIIME2/TUFA

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

# You need a "manifest" for explaining and importing your data :
# In the fastq manifest formats, a manifest file maps sample identifiers to fastq.gz or fastq absolute filepaths that contain sequence and quality data for the sample, and indicates the direction of the reads in each fastq.gz / fastq absolute filepath. The manifest file will generally be created by you, and it is designed to be a simple format that doesn’t put restrictions on the naming of the demultiplexed fastq.gz / fastq files, since there is no broadly used naming convention for these files. There are no restrictions on the name of the manifest file.
# See https://docs.qiime2.org/2018.8/tutorials/importing/

MANIFEST=/home/fungi/Mayotte_microorganism_colonisation/98_database_files/manifest_TUFA
TMPDIR=/home

###############################################################
### For importing your data in a Qiime2 format
###############################################################

cd $WORKING_DIRECTORY

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT/core
mkdir -p $OUTPUT/visual

# I'm doing this step in order to deal the no space left in cluster :
export TMPDIR='/home/fungi'
echo $TMPDIR

qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
			    --input-path  $MANIFEST \
			    --output-path $OUTPUT/core/demux.qza \
			    --input-format PairedEndFastqManifestPhred33V2

cd $OUTPUT

qiime demux summarize --i-data core/demux.qza --o-visualization visual/demux.qzv

# for vizualisation :
# https://view.qiime2.org

qiime tools export --input-path visual/demux.qzv --output-path export/visual/demux
qiime tools export --input-path core/demux.qza --output-path export/core/demux



######################################################################################################################################################
######################################################################################################################################################
###### 18S ######
######################################################################################################################################################
######################################################################################################################################################

WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/03_cleaned_data/18S
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/05_QIIME2/18S

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

# You need a "manifest" for explaining and importing your data :
# In the fastq manifest formats, a manifest file maps sample identifiers to fastq.gz or fastq absolute filepaths that contain sequence and quality data for the sample, and indicates the direction of the reads in each fastq.gz / fastq absolute filepath. The manifest file will generally be created by you, and it is designed to be a simple format that doesn’t put restrictions on the naming of the demultiplexed fastq.gz / fastq files, since there is no broadly used naming convention for these files. There are no restrictions on the name of the manifest file.
# See https://docs.qiime2.org/2018.8/tutorials/importing/

MANIFEST=/home/fungi/Mayotte_microorganism_colonisation/98_database_files/manifest_18S
TMPDIR=/home

###############################################################
### For importing your data in a Qiime2 format
###############################################################

cd $WORKING_DIRECTORY

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT/core
mkdir -p $OUTPUT/visual

# I'm doing this step in order to deal the no space left in cluster :
export TMPDIR='/home/fungi'
echo $TMPDIR

qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
			    --input-path  $MANIFEST \
			    --output-path $OUTPUT/core/demux.qza \
			    --input-format PairedEndFastqManifestPhred33V2

cd $OUTPUT

qiime demux summarize --i-data core/demux.qza --o-visualization visual/demux.qzv

# for vizualisation :
# https://view.qiime2.org

qiime tools export --input-path visual/demux.qzv --output-path export/visual/demux
qiime tools export --input-path core/demux.qza --output-path export/core/demux




