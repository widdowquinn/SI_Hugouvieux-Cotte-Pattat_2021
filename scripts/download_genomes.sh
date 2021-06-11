#!/usr/bin/env bash
#
# download_genomes.sh
#
# Download FASTA format genomes for phylogenomic reconstruction

# Download files
ncbi-genome-download \
    --assembly-accessions data/accessions.txt \
    --formats fasta \
    --output-folder genomes \
    --flat-output \
    -v \
    bacteria


# Extract sequences
gunzip genomes/*.gz