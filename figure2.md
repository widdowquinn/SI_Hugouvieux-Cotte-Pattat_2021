# `figure2.md` - Whole-genome ANIm of *Dickeya* and *Brenneria* spp.

This file describes how figure 2 and figure S3, the whole-genome analysis of *Dickeya* and *Brenneria* were generated using `pyani`.

--------------------------------

A single `pyani` v0.3 analysis was run on 2020-11-23 (run 1), including 135 publicly-available genomes of *Dickeya* and *Brenneria* spp. downloaded from NCBI. A re-analysis (on a reduced set of these genomes) to produce figure 2 was run on 2021-01-26. The commands used were:

```bash
# Download Dickeya genomes
pyani download -v -l 00_download.log \
  --email leighton.pritchard@strath.ac.uk \
  -t 204037 dickeya_genomes

# Download Brenneria genomes
pyani download -v -l 01_download.log \
  --email leighton.pritchard@strath.ac.uk \
  -t 71655 brenneria_genomes

# Create database for pyani analysis
pyani createdb -v -l 02_createdb.log -f

# Combine Dickeya and Brenneria genomes
mkdir combined_genomes
ln -s dickeya_genomes/* combined_genomes/
ln -s brenneria_genomes/* combined_genomes/
cat dickeya_genomes/labels.txt brenneria_genomes/labels.txt combined_genomes/labels.txt
cat dickeya_genomes/classes.txt brenneria_genomes/labels.txt combined_genomes/classes.txt

# Perform ANIm on all genomes and plot output for figure S2
pyani anim -v -l 03_anim.log --scheduler SGE combined_genomes/ combined_ANIM --name Combined_Dickeya_Brenneria_run_1 --labels combined_genomes/labels.txt --classes combined_genomes/classes.txt
pyani plot -v -l 04_plot.log --method seaborn --formats png,pdf combined_ANIM/ 1

# Symbolic links to the genomes for figure 2 are created in figure_2_genomes/
# along with corresponding reduced labels.txt and classes.txt files
# Perform ANIm on this reduced set
pyani anim -v -l 06_anim.log --scheduler SGE figure_2_genomes/ figure_2_ANIm/ --name figure2_Dickeya --labels figure_2_genomes/labels.txt --classes figure_2_genomes/classes.txt
pyani plot -v -l 07_plot.log --method seaborn --formats png,pdf figure_2_ANIm/ 3
```
