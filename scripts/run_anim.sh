#!/usr/bin/env bash
#
# run_ANIm.sh
#
# Run ANIm analysis (using pyani v0.3) on downloaded genomes

# Create database
pyani createdb -l logs/pyani_01_createdb.log

# Index genomes
pyani index genomes -l logs/pyani_02_index.log

# Run ANIm analysis
pyani anim -l logs/pyani_03_anim.log \
  genomes \
  anim_output \
  --name "musicola_ANIm" \
  --labels genomes/labels.txt \
  --classes genomes/classes.txt

# Generate graphical anim output
pyani plot -l logs/pyani_04_plot.log \
  --formats png,pdf \
  --method seaborn \
  anim_output 1