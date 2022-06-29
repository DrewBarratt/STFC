#!/usr/bin/env bash
for file in pwd/virulign_output/*virulign.fasta
do
        name=${file##*/}
        base=${name%.virulign.fasta}

hyphy << EOF
12
3
1
1
"$file"
1
1
y
pwd/tree_files/"${base}.virulign.fasta.treefile"
EOF

done