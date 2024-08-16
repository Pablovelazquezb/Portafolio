# Coronavirus Sequence Analysis Report

This R Markdown document is titled "Coronavirus Sequence Analysis Report" and was authored by Pablo Velazquez on May 1, 2023. The document is designed to process and analyze various coronavirus sequences using a combination of R packages and data visualization techniques.

## Content Overview

The document performs the following tasks:

1. **Library Imports**:
   - The following R libraries are loaded to facilitate sequence analysis and data visualization:
     - `ggplot2`: For creating visualizations.
     - `seqinr`: For biological sequence retrieval and analysis.
     - `ggthemes`: For additional themes in ggplot2.
     - `tidyr`: For data tidying.
     - `ape`: For analyses of phylogenetics and evolution.

2. **Reading Coronavirus Sequences**:
   - The document reads multiple coronavirus sequences from FASTA files, including:
     - **Alpha** variant
     - **Beta** variant
     - **Delta** variant
     - **Gamma** variant
     - **Omicron** variant
     - **WuhanHu** strain
     - **MERS** (Middle East Respiratory Syndrome)
     - Various bat and animal-related coronaviruses like MHV, Bovine, Dromedary, Yak, etc.

   These sequences are stored in variables corresponding to their respective names.

## How to Use

To use this R Markdown document, follow these steps:

1. Ensure you have R and RStudio installed on your system.
2. Install the necessary libraries if you haven't already:
   ```r
   install.packages(c("ggplot2", "seqinr", "ggthemes", "tidyr", "ape"))
