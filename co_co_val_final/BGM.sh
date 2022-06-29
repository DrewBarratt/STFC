#!/usr/bin/env bash
cd pwd/co_co_val/Co_evolving_sites_results
for file in ~/co_co_val/virulign_output/*virulign.fasta
do
        name=${file##*/}
        base=${name%.virulign.fasta}
    hyphy bgm --type amino-acid --alignment "$file" --tree ~/co_co_val/tree_files/"_${base}.virulign.fasta.treefile_" 

done
