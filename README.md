# hilsa-ovary-igv-pipeline
Developed a command-line pipeline to generate IGV-compatible BAM and index files for visualization of RNA-seq data from Hilsa ovary tissue using samtools on a Linux server

# IGV File Generation Pipeline for Hilsa Ovary RNA-seq Data

This repository contains a reproducible command-line pipeline used to
generate IGV-compatible files (sorted and indexed BAM files) from
RNA-seq alignment data of Hilsa (*Tenualosa ilisha*) ovary tissue.

The pipeline was executed on a remote Linux server using PuTTY (SSH)
and standard bioinformatics tools.

---

## Objective
To prepare alignment files for visualization in Integrative Genomics Viewer (IGV)
by sorting and indexing BAM files using samtools.

---

## Tools and Environment
- samtools
- Linux Bash shell
- Python 3
- PuTTY (SSH client)
- IGV (for downstream visualization)

---

## Workflow Overview
1. Input BAM file validation
2. Sorting of BAM file
3. Indexing of sorted BAM file
4. Loading BAM and BAI files into IGV

---

## Repository Structure
hilsa-ovary-igv-pipeline/
│
├── README.md
├── protocol/
│ └── igv_file_generation_protocol.md
│
├── scripts/
│ ├── igv_pipeline.sh
│ └── igv_pipeline.py
│
├── notebooks/
│ └── igv_pipeline.ipynb
│
└── environment/
└── tools_versions.txt
