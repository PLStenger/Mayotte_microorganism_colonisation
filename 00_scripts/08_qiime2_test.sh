#!/usr/bin/env bash

# pathways in cluster:
DATADIRECTORY_ITS=/scratch_vol1/fungi/Araucaria_columnaris_diversity/05_QIIME2/ITS/
DATADIRECTORY_16S=/scratch_vol1/fungi/Araucaria_columnaris_diversity/05_QIIME2/16S/

METADATA_ITS=/scratch_vol1/fungi/Araucaria_columnaris_diversity/98_database_files/ITS/
METADATA_16S=/scratch_vol1/fungi/Araucaria_columnaris_diversity/98_database_files/16S/

TMPDIR=/scratch_vol1

# pathways in local:
#DATADIRECTORY_ITS=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/18_Araucaria/Araucaria_columnaris_diversity/05_QIIME2/ITS/
#DATADIRECTORY_16S=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/18_Araucaria/Araucaria_columnaris_diversity/05_QIIME2/16S/

#METADATA_ITS=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/18_Araucaria/Araucaria_columnaris_diversity/98_database_files/ITS/
#METADATA_16S=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/18_Araucaria/Araucaria_columnaris_diversity/98_database_files/16S/


# Aim: perform diversity metrics and rarefaction

# https://chmi-sops.github.io/mydoc_qiime2.html#step-8-calculate-and-explore-diversity-metrics
# https://docs.qiime2.org/2018.2/tutorials/moving-pictures/#alpha-rarefaction-plotting
# https://forum.qiime2.org/t/how-to-decide-p-sampling-depth-value/3296/6

# Use QIIME2’s diversity core-metrics-phylogenetic function to calculate a whole bunch of diversity metrics all at once. 
# Note that you should input a sample-depth value based on the alpha-rarefaction analysis that you ran before.

# sample-depth value choice : 
# We are ideally looking for a sequencing depth at the point where these rarefaction curves begin to level off (indicating that most of the relevant diversity has been captured).
# This helps inform tough decisions that we need to make when some samples have lower sequence counts and we need to balance the priorities that you want to choose 
# a value high enough that you capture the diversity present in samples with high counts, but low enough that you don’t get rid of a ton of your samples.

###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

 # I'm doing this step in order to deal the no space left in cluster :
export TMPDIR='/scratch_vol1/fungi'
echo $TMPDIR

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p pcoa
mkdir -p export/pcoa
  
# core_metrics_phylogenetic:
############################
    # Aim: Applies a collection of diversity metrics to a feature table
    # Use: qiime diversity core-metrics-phylogenetic [OPTIONS]

qiime diversity core-metrics-phylogenetic \
       --i-phylogeny tree/rooted-tree.qza \
       --i-table core/ConTable.qza \
       --p-sampling-depth 5693 \
       --m-metadata-file $METADATA_ITS/sample-metadata.tsv \
       --o-rarefied-table core/RarTable.qza \
       --o-observed-features-vector core/Vector-observed_asv.qza \
       --o-shannon-vector core/Vector-shannon.qza \
       --o-evenness-vector core/Vector-evenness.qza \
       --o-faith-pd-vector core/Vector-faith_pd.qza \
       --o-jaccard-distance-matrix core/Matrix-jaccard.qza \
       --o-bray-curtis-distance-matrix core/Matrix-braycurtis.qza \
       --o-unweighted-unifrac-distance-matrix core/Matrix-unweighted_unifrac.qza \
       --o-weighted-unifrac-distance-matrix core/Matrix-weighted_unifrac.qza \
       --o-jaccard-pcoa-results pcoa/PCoA-jaccard.qza \
       --o-bray-curtis-pcoa-results pcoa/PCoA-braycurtis.qza \
       --o-unweighted-unifrac-pcoa-results pcoa/PCoA-unweighted_unifrac.qza \
       --o-weighted-unifrac-pcoa-results pcoa/PCoA-weighted_unifrac.qza \
       --o-jaccard-emperor visual/Emperor-jaccard.qzv \
       --o-bray-curtis-emperor visual/Emperor-braycurtis.qzv \
       --o-unweighted-unifrac-emperor visual/Emperor-unweighted_unifrac.qzv \
       --o-weighted-unifrac-emperor visual/Emperor-weighted_unifrac.qzv


# sequence_rarefaction_filter:
##############################

# Aim: Filter features from sequences based on a feature table or metadata.
# Use: qiime feature-table filter-seqs [OPTIONS]

qiime feature-table filter-seqs \
        --i-data core/ConRepSeq.qza \
        --i-table core/RarTable.qza \
        --o-filtered-data core/RarRepSeq.qza



# summarize_sequence:
#####################

qiime feature-table tabulate-seqs \
       --i-data core/RarRepSeq.qza \
       --o-visualization core/RarRepSeq.qzv
           

# summarize_table :
##################

# Aim: Generate visual and tabular summaries of a feature table
# Use: qiime feature-table summarize [OPTIONS]

qiime feature-table summarize \
       --i-table core/RarTable.qza \
       --m-sample-metadata-file $METADATA_ITS/sample-metadata.tsv \
       --o-visualization core/RarTable.qzv




qiime tools export --input-path core/RarTable.qza --output-path export/table/RarTable
qiime tools export --input-path core/RarRepSeq.qza --output-path export/table/RarRepSeq  
  
qiime tools export --input-path visual/BetaSignification-braycurtis-Acronyme.qzv --output-path export/visual/BetaSignification-braycurtis-Acronyme
qiime tools export --input-path visual/BetaSignification-jaccard-Acronyme.qzv --output-path export/visual/BetaSignification-jaccard-Acronyme
qiime tools export --input-path visual/AlphaCorrelation-fisher_alpha.qzv --output-path export/visual/AlphaCorrelation-fisher_alpha
qiime tools export --input-path visual/AlphaCorrelation-pielou_e.qzv --output-path export/visual/AlphaCorrelation-pielou_e
qiime tools export --input-path visual/AlphaCorrelation-chao1.qzv --output-path export/visual/AlphaCorrelation-chao1
qiime tools export --input-path visual/AlphaCorrelation-simpson_e.qzv --output-path export/visual/AlphaCorrelation-simpson_e
qiime tools export --input-path visual/AlphaCorrelation-simpson.qzv --output-path export/visual/AlphaCorrelation-simpson
qiime tools export --input-path visual/AlphaSignification-fisher_alpha.qzv --output-path export/visual/AlphaSignification-fisher_alpha
qiime tools export --input-path visual/AlphaSignification-pielou_e.qzv --output-path export/visual/AlphaSignification-pielou_e
qiime tools export --input-path visual/AlphaSignification-chao1.qzv --output-path export/visual/AlphaSignification-chao1
qiime tools export --input-path visual/AlphaSignification-simpson_e.qzv --output-path export/visual/AlphaSignification-simpson_e
qiime tools export --input-path visual/AlphaSignification-simpson.qzv --output-path export/visual/AlphaSignification-simpson
qiime tools export --input-path visual/Emperor-braycurtis.qzv --output-path export/visual/Emperor-braycurtis
qiime tools export --input-path visual/Emperor-jaccard.qzv --output-path export/visual/Emperor-jaccard
qiime tools export --input-path visual/Emperor-weighted_unifrac.qzv --output-path export/visual/Emperor-weighted_unifrac
qiime tools export --input-path visual/Emperor-unweighted_unifrac.qzv --output-path export/visual/Emperor-unweighted_unifrac 

qiime tools export --input-path core/bray_curtis_distance_matrix.qza --output-path export/core/bray_curtis_distance_matrix
qiime tools export --input-path core/Vector-evenness.qza --output-path export/core/Vector-evenness
qiime tools export --input-path core/Vector-faith_pd.qza --output-path export/core/Vector-faith_pd_BEFORE
qiime tools export --input-path core/jaccard_distance_matrix.qza --output-path export/core/jaccard_distance_matrix
qiime tools export --input-path core/jaccard_pcoa_results.qza --output-path export/core/jaccard_pcoa_results
qiime tools export --input-path core/observed_otus_vector.qza --output-path export/core/observed_otus_vector
qiime tools export --input-path core/rarefied_table.qza --output-path export/core/rarefied_table
qiime tools export --input-path core/Vector-shannon.qza --output-path export/core/Vector-shannon
qiime tools export --input-path core/Matrix-unweighted_unifrac.qza --output-path export/core/Matrix-unweighted_unifrac
qiime tools export --input-path core/weighted_unifrac_distance_matrix.qza --output-path export/core/weighted_unifrac_distance_matrix
qiime tools export --input-path core/weighted_unifrac_pcoa_results.qza --output-path export/core/weighted_unifrac_pcoa_results

qiime tools export --input-path core/Matrix-braycurtis.qza --output-path export/core/Matrix-braycurtis
qiime tools export --input-path core/Matrix-jaccard.qza --output-path export/core/Matrix-jaccard
qiime tools export --input-path core/Matrix-unweighted_unifrac.qza --output-path export/core/Matrix-unweighted_unifrac
qiime tools export --input-path core/Matrix-weighted_unifrac.qza --output-path export/core/Matrix-weighted_unifrac
qiime tools export --input-path core/Vector-evenness.qza --output-path export/core/Vector-evenness
qiime tools export --input-path core/Vector-faith_pd.qza --output-path export/core/Vector-faith_pd
qiime tools export --input-path core/Vector-observed_asv.qza --output-path export/core/Vector-observed_asv
qiime tools export --input-path core/Vector-shannon.qza --output-path export/core/Vector-shannon

qiime tools export --input-path pcoa/PCoA-braycurtis.qza --output-path export/pcoa/PCoA-braycurtis
qiime tools export --input-path pcoa/PCoA-jaccard.qza --output-path export/pcoa/PCoA-jaccard
qiime tools export --input-path pcoa/PCoA-unweighted_unifrac.qza --output-path export/pcoa/PCoA-unweighted_unifrac
qiime tools export --input-path pcoa/PCoA-weighted_unifrac.qza --output-path export/pcoa/PCoA-weighted_unifrac

