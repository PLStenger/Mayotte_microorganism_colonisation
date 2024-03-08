#!/usr/bin/env bash


######################################################################################################################################################
######################################################################################################################################################
###### ITS with NCBI #####
######################################################################################################################################################
######################################################################################################################################################


WORKING_DIRECTORY=/home/fungi/Mayotte_microorganism_colonisation/05_QIIME2/ITS
OUTPUT=/home/fungi/Mayotte_microorganism_colonisation/05_QIIME2/ITS/visual

DATABASE=/home/fungi/Mayotte_microorganism_colonisation/98_database_files
TMPDIR=/home

# Aim: classify reads by taxon using a fitted classifier

# https://docs.qiime2.org/2019.10/tutorials/moving-pictures/
# In this step, you will take the denoised sequences from step 5 (rep-seqs.qza) and assign taxonomy to each sequence (phylum -> class -> …genus -> ). 
# This step requires a trained classifer. You have the choice of either training your own classifier using the q2-feature-classifier or downloading a pretrained classifier.

# https://docs.qiime2.org/2019.10/tutorials/feature-classifier/


# Aim: Import data to create a new QIIME 2 Artifact
# https://gitlab.com/IAC_SolVeg/CNRT_BIOINDIC/-/blob/master/snk/12_qiime2_taxonomy


cd $WORKING_DIRECTORY

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

# I'm doing this step in order to deal the no space left in cluster :
export TMPDIR='/home/fungi'
echo $TMPDIR

threads=FALSE

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p taxonomy
mkdir -p export/taxonomy

# I'm doing this step in order to deal the no space left in cluster :
export TMPDIR='/home/fungi'
echo $TMPDIR


# https://forum.qiime2.org/t/using-rescript-to-compile-sequence-databases-and-taxonomy-classifiers-from-ncbi-genbank/15947
# for query : https://www.ncbi.nlm.nih.gov/books/NBK49540/

# https://forum.qiime2.org/t/building-a-coi-database-from-ncbi-references/16500

################################################################################################
# Ceci fonctionne, mais pour eviter de rereunner, j'enleve ici poru test

qiime rescript get-ncbi-data \
    --p-query '(ITS[ALL] OR its[ALL] OR Its[ALL] OR ITS2[ALL] OR Its2[ALL] OR its2[ALL] NOT bacteria[ORGN]))' \
    --o-sequences taxonomy/RefTaxo.qza \
    --o-taxonomy taxonomy/DataSeq.qza


qiime feature-classifier classify-consensus-vsearch \
    --i-query core/RepSeq.qza  \
    --i-reference-reads taxonomy/RefTaxo.qza \
    --i-reference-taxonomy taxonomy/DataSeq.qza \
    --p-perc-identity 0.77 \
    --p-query-cov 0.3 \
    --p-top-hits-only \
    --p-maxaccepts 1 \
    --p-strand 'both' \
    --p-unassignable-label 'Unassigned' \
    --p-threads 12 \
    --o-classification taxonomy/taxonomy_reads-per-batch_RepSeq_vsearch.qza
    
qiime feature-classifier classify-consensus-vsearch \
    --i-query core/RarRepSeq.qza  \
    --i-reference-reads taxonomy/RefTaxo.qza \
    --i-reference-taxonomy taxonomy/DataSeq.qza \
    --p-perc-identity 0.77 \
    --p-query-cov 0.3 \
    --p-top-hits-only \
    --p-maxaccepts 1 \
    --p-strand 'both' \
    --p-unassignable-label 'Unassigned' \
    --p-threads 12 \
    --o-classification taxonomy/taxonomy_reads-per-batch_RarRepSeq_vsearch.qza
  
  qiime metadata tabulate \
  --m-input-file taxonomy/taxonomy_reads-per-batch_RepSeq_vsearch.qza \
  --o-visualization taxonomy/taxonomy_reads-per-batch_RepSeq_vsearch.qzv  

  qiime metadata tabulate \
  --m-input-file taxonomy/taxonomy_reads-per-batch_RarRepSeq_vsearch.qza \
  --o-visualization taxonomy/taxonomy_reads-per-batch_RarRepSeq_vsearch.qzv  

# Now create a visualization of the classified sequences.


 qiime taxa barplot \
  --i-table core/RarTable.qza \
  --i-taxonomy taxonomy/taxonomy_reads-per-batch_RarRepSeq_vsearch.qza \
  --m-metadata-file $DATABASE/sample-metadata_ITS.tsv \
  --o-visualization taxonomy/taxa-bar-plots_reads-per-batch_RarRepSeq_vsearch.qzv 
  
  
   qiime taxa barplot \
  --i-table core/RarTable.qza \
  --i-taxonomy taxonomy/taxonomy_reads-per-batch_RepSeq_vsearch.qza \
  --m-metadata-file $DATABASE/sample-metadata_ITS.tsv \
  --o-visualization taxonomy/taxa-bar-plots_reads-per-batch_RepSeq_vsearch.qzv 


  
qiime tools export --input-path taxonomy/taxa-bar-plots_reads-per-batch_RarRepSeq_vsearch.qzv --output-path export/taxonomy/taxa-bar-plots_reads-per-batch_RarRepSeq_vsearch
qiime tools export --input-path taxonomy/taxa-bar-plots_reads-per-batch_RepSeq_vsearch.qzv --output-path export/taxonomy/taxa-bar-plots_reads-per-batch_RepSeq_vsearch

qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_RepSeq_vsearch.qzv --output-path export/taxonomy/taxonomy_reads-per-batch_RepSeq_vsearch_visual
qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_RarRepSeq_vsearch.qzv --output-path export/taxonomy/taxonomy_reads-per-batch_RarRepSeq_vsearch_visual

qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_RarRepSeq_vsearch.qza --output-path export/taxonomy/taxonomy_reads-per-batch_RarRepSeq_vsearch
qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_RepSeq_vsearch.qza --output-path export/taxonomy/taxonomy_reads-per-batch_RepSeq_vsearch
qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_RarRepSeq.qza --output-path export/taxonomy/taxonomy_reads-per-batch_RarRepSeq


