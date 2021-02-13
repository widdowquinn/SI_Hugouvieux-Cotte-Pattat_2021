# README.md SI_Hugovieux-Cotte-Pattat_2021

This repository contains supporting material relating to `pyani` analyses of the *Dickeya*/*Paradisiaca* genus, as reported in:

> Hugovieux-Cotte-Pattat, N., Jacot-des-Combes, C., Briolay, J. & Pritchard, L. (2021) "Proposal for the creation of a new genus *Paradisiaca* gen. nov., reclassification of *Dickeya paradisiaca* (Samson et al. 2005) as *Paradisiaca victoria* sp. nov. and description of a new species *Paradisiaca keenii* sp. nov." *Int. J. Syst. Evol. Microbiol.*

A single `pyani` v0.3 analysis was run on 2020-11-23 (run 1), including 135 publicly-available genomes of *Dickeya* and *Brenneria* spp. downloaded from NCBI. A re-analysis of the genomes for figure 3 was run on 2021-01-26. The commands used were:

```bash
pyani download -v -l 00_download.log --email leighton.pritchard@strath.ac.uk -t 204037 dickeya_genomes
pyani download -v -l 01_download.log --email leighton.pritchard@strath.ac.uk \
    -t 71655 brenneria_genomes
pyani createdb -v -l 02_createdb.log -f
mkdir combined_genomes
ln -s dickeya_genomes/* combined_genomes/
ln -s brenneria_genomes/* combined_genomes/
cat dickeya_genomes/labels.txt brenneria_genomes/labels.txt combined_genomes/labels.txt
cat dickeya_genomes/classes.txt brenneria_genomes/labels.txt combined_genomes/classes.txt
pyani anim -v -l 03_anim.log --scheduler SGE combined_genomes/ combined_ANIM --name Combined_Dickeya_Brenneria_run_1 --labels combined_genomes/labels.txt --classes combined_genomes/classes.txt
pyani plot -v -l 04_plot.log --method seaborn --formats png,pdf combined_ANIM/ 1
# Symbolic links to the genomes for figure 3 were created in figure_3_genomes/
# along with corresponding reduced labels.txt and classes.txt files
pyani anim -v -l 06_anim.log --scheduler SGE figure_3_genomes/ figure_3_ANIm/ --name figure3_Dickeya --labels figure_3_genomes/labels.txt --classes figure_3_genomes/classes.txt
pyani plot -v -l 07_plot.log --method seaborn --formats png,pdf figure_3_ANIm/ 3
```

## Directory Structure

```bash
$ tree -d
.
├── figure_3     # pyani output generated for figure 3
├── figure_S2    # pyani output generated for figure S2
├── figures      # PDF files of annotated figures 3 and S2
└── pyanidb      # pyani database generated for these comparisons
```

If you would like to recreate plots from this analysis, you can do so with a command like:

```bash
pyani plot -v -l my_plot.log --dbpath pyanidb/pyanidb \
    --method seaborn --formats png,pdf \
    figure_3_ANIm/ 3
```

## Licence

This repository is licensed under the [MIT License](./LICENSE)