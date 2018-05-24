#!/bin/bash

metagenomes="PAzules PAzules2 PAzules3"

#This loop will generate a file for each metagenome containing only the relative abundance of Archaea predicted.

for s in ${metagenomes};
do
	grep 'Archaea' ../predict_otus/$s.txt > ../predict_otus/$s.Archaea.txt;
done

# Now we are making a table merging relative abundances of Archaea in three metagenomes.
# This table will compare each species abundance and can be used as unnormalized data to later obtain alpha and beta diversity.

python ../metaphlan2/utils/merge_metaphlan_tables.py ../predict_otus/*.Archaea.txt > ../output/merged_Archaea_abundance_table.txt;

# The final command is included as a bonus heatmap for visualization of top 50 most abundance species of Archea on each metagenome.

python ../metaphlan2/utils/metaphlan_hclust_heatmap.py -c bbcry --top 50 --minv 0.1 -s log --in ../output/merged_Archaea_abundance_table.txt --out ../output/images/merged_Archaea_abundance_heatmap.png
