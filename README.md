##Co-evolutionary pipeline

#Whilst this pipeline is set up for SARS-COV-2 analysis, the virus of interest can be change by including a different initial representative cohort of sequences, reference and reference Orfs (without stop codon encoding nucleotides).


Applications and Dependencies
- HYPHY (Evoutionary hypothesis testing) version used = 2.5.39 https://github.com/veg/hyphy
- cmake >= 3.12
- gcc >= 4.9
- libcurl
- libpthread
- openmp
- Viruglin (Viral genome alignment) = Current release (not maintained) https://github.com/rega-cev/virulign
- MAFFT = version used 7.471 https://github.com/GSLBiotech/mafft/blob/master/readme

Pipeline and scripts
The pipeline is composed composed of numerous short scripts

1.   mafft_global_align.sh
This script takes the downloaded globally representative SARS-COV-2 nucleotide files and performs a global alignment against the MN908947 reference genome.
-The reference fasta must be provided in the co_co_val/reference folder as MN908947.fa
-The globally representative sequences must be available in co_co_val/Latest_global_unaligned as hcov_global.fasta
-The aligned output will be available in the co_co_val/Latest_global_aligned folder as aligned_global_rep.fa
 
2. virulign.sh 
This script aligns the globally representative nucleotide sequences with the reference nucleotide sequences obtained from GISAID for each encoding region (protein) with stop codons removed.
-Reference sequences for each encoding region must be pre-prepared and stored in co_co_val/reference_nucleotide_coding_sequences. These can be extracted from the GISAID website but I have already prepared the relevant .fasta files. 
-The globally representative MSA should be available in co_co_val/Latest_global_aligned folder/aligned_global_rep.fa . 
-The globally aligned sequences for each protein will be available as AA in co_co_val/virulign_output/

3. NJ_TREE.sh
This script creates NJ trees using HYPHY. For this, the individual AA MSA for each protein is convert to a neighbour joining tree in newick format with the following arguments automatically - distance formulae, negative branch lengths allowed and poisson corrected distances. 
-Inpur for this script are the aligned protein MSAs which should be available in co_co_val/virulign_output/
-The output NJ trees will be available in co_co_val/tree_files/

4. remove_quotes.sh
This is short script which removes the quotation marks from the tree_file file names. 

5. BGM.sh
This script runs the co-evolution analysis using a Bayesian Graph Approach from the HYPHY suite. This analysis uses the previously created tree files and AA alinements to determine the probability that two resides are dependent for evolution. 
-The source NJ trees should be found within the co_co_val/tree_files/ folder in newick format
-The source AA alignments should be found in the co_co_val/virulign_output folder 
