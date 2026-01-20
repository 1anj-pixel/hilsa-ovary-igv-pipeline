#!/bin/bash

# IGV File Preparation Pipeline for Hilsa Ovary RNA-seq (PacBio)
# Author: Anjali Sharma

# Input files
REF_FASTA="LMSE_tenilii_hplt.FINAL.fasta"
INPUT_BAM="ovary.bam"

# Output prefix
PREFIX="ovary"

echo "Starting IGV file preparation pipeline..."

# Step 1: Index reference genome (if not already indexed)
if [ ! -f "${REF_FASTA}.fai" ]; then
    echo "Indexing reference genome..."
    samtools faidx "$REF_FASTA"
else
    echo "Reference genome index already exists."
fi

# Step 2: Sort BAM file
echo "Sorting BAM file..."
samtools sort "${PREFIX}.bam" -o "${PREFIX}.sorted.bam"

# Step 3: Index sorted BAM file
echo "Indexing sorted BAM file..."
samtools index "${PREFIX}.sorted.bam"

# Step 4: Generate BED file (genomic alignments)
echo "Generating BED file from BAM..."
bedtools bamtobed -i "${PREFIX}.sorted.bam" > "${PREFIX}_hilsa.bed"

# Step 5: Generate transcript/read-level BED file
echo "Generating transcript/read-level BED file..."
bedtools bamtobed -split -i "${PREFIX}.sorted.bam" > "${PREFIX}_hilsa_trans_read.bed"

echo "Pipeline completed successfully."
echo "Generated files:"
echo " - ${PREFIX}.sorted.bam"
echo " - ${PREFIX}.sorted.bam.bai"
echo " - ${PREFIX}_hilsa.bed"
echo " - ${PREFIX}_hilsa_trans_read.bed"
