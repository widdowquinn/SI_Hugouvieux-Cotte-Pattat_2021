# SI_Hugovieux-Cotte-Pattat_2021

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4546299.svg)](https://doi.org/10.5281/zenodo.4546299)

This repository contains supporting material relating to phylogenetic and `pyani` analyses of the *Dickeya*/*Paradisiaca* genus, as reported in:

> Hugovieux-Cotte-Pattat, N., Jacot-des-Combes, C., Briolay, J. & Pritchard, L. (2021) "Proposal for the creation of a new genus *Paradisiaca* gen. nov., reclassification of *Dickeya paradisiaca* (Samson et al. 2005) as *Paradisiaca victoria* sp. nov. and description of a new species *Paradisiaca keenii* sp. nov." *Int. J. Syst. Evol. Microbiol.*

------------------------------------------
## How to use this repository

You can use this repository like a website, to browse and see how we performed the analysis, or you can download it to inspect, verify, reproduce, or build on our analysis.

### Downloading this repository

You can use `git` to *clone* this repository to your local hard drive:

```bash
git clone git@github.com:widdowquinn/SI_Hugouvieux-Cotte-Pattat_2021.git
```

Or you can download it as a compressed `.zip` archive from [this link](https://github.com/widdowquinn/SI_Hugouvieux-Cotte-Pattat_2021/archive/refs/heads/main.zip).

---------------------------------------------

## Directory Structure

```bash
$ tree -d
.
├── figure_2     # pyani output generated for figure 2
├── figure_S3    # pyani output generated for figure S3
├── figures      # PDF files of annotated figures 2 and S3
├── pyanidb      # pyani database generated for figures S2/S3
└── sequences    # FASTA sequences used to produce 16S and gapA trees
```

## Reproducing Analyses

### Whole-genome ANIm of *Dickeya* and *Brenneria*, Figures 2 and S3

The complete procedure for producing figures 2 and S3, the whole-genome ANIm of *Dickeya* and *Brenneria* spp., is described in [`figure2.md`](./figure2.md).

The graphical outputs relevant to figure 2 and figure 3 are presented in the directories `figure_2` and `figure_S3`, respectively, and `pyani` database (readable by `pyani` v0.3) generated in the analysis is located in `pyanidb/pyanidb_fig2_figS3`.

The complete ANIm analysis, including input data, is provided in the compressed `.zip` archive `figure_2_figure_S3.zip`.

### Licensing

This repository is licensed under the [MIT License](./LICENSE), and copyright (C) 2020-2021 University of Strathclyde

If you use elements of this repository in your own work, we would be grateful if you please cite the following publication, and the URL/DOI of this repository, as "appropriate credit".

> Hugovieux-Cotte-Pattat, N., Jacot-des-Combes, C., Briolay, J. & Pritchard, L. (2021) "Proposal for the creation of a new genus *Paradisiaca* gen. nov., reclassification of *Dickeya paradisiaca* (Samson et al. 2005) as *Paradisiaca victoria* sp. nov. and description of a new species *Paradisiaca keenii* sp. nov." *Int. J. Syst. Evol. Microbiol.*

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4546299.svg)](https://doi.org/10.5281/zenodo.4546299)
