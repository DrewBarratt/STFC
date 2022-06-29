#!/usr/bin/env bash

mafft --6merpair --thread -12 --keeplength --addfragments pwd/Latest_global_unaligned/hcov_global.fasta pwd/reference/MN908947.fa > pwd/Latest_global_aligned/aligned_global_rep.fa


