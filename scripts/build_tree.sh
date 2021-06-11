#!/usr/bin/env bash
#
# build_tree.sh
#
# Build maximum parsimony tree using raxml-ng, with
# bootstrap support

raxml-ng --check \
  --msa concatenated_cds/concatenated.fasta \
  --model concatenated_cds/concatenated.part \
  --prefix tree/01_check

raxml-ng --parse \
  --msa concatenated_cds/concatenated.fasta \
  --model concatenated_cds/concatenated.part \
  --prefix tree/02_parse

raxml-ng \
  --msa concatenated_cds/concatenated.fasta \
  --model concatenated_cds/concatenated.part \
  --threads 8 \
  --seed 38745 \
  --prefix tree/03_infer

raxml-ng --bootstrap \
  --msa concatenated_cds/concatenated.fasta \
  --model concatenated_cds/concatenated.part \
  --threads 8 \
  --seed 38745 \
  --bs-trees 100 \
  --prefix tree/04_bootstrap

raxml-ng --bsconverge \
  --bs-trees tree/04_bootstrap.raxml.bootstraps \
  --prefix tree/05_convergence \
  --seed 1084351 \
  --threads 8 \
  --bs-cutoff 0.01

raxml-ng --rfdist \
  --tree tree/03_infer.raxml.mlTrees \
  --prefix tree/06_rfdist

raxml-ng --support \
  --tree tree/03_infer.raxml.bestTree \
  --bs-trees tree/04_bootstrap.raxml.bootstraps \
  --prefix tree/07_support \
  --threads 8
