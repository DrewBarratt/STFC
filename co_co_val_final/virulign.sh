#!/usr/bin/env bash
for file in pwd/reference_nucleotide_coding_sequences/*1.fasta
do
        name=${file##*/}
        base=${name%1.fasta}
    ./virulign "$file" pwd/Latest_global_aligned/aligned_global_rep.fa --exportKind GlobalAlignment --exportAlphabet AminoAcids > "${base}.virulign.fasta"
mv *.virulign.fasta pwd/virulign_output/
done