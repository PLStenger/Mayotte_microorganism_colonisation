# Take the ASV.tsv file from the subtable folder, then, in local

cd /07_funguild/

sed 's/Taxon/taxonomy/ ; s/\Feature ID/ID/' taxonomy.tsv > SortTaxo.tsv

awk '{{print $2}}' SortTaxo.tsv > FiltTaxo.tsv
paste ASV.tsv FiltTaxo.tsv > TaxoASV.tsv

python Guilds_v1.1.py -otu TaxoASV.tsv -m -u
