#!/bin/bash

module load anaconda
conda activate ortholog_id

# Path to RefSeq peptide fasta files from NCBI and their BLAST+ db location
supporting_file_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/supporting_files/"

# Initialize the final FASTA file for list of representative proteins (one protein per gene)
touch "${supporting_file_dir}/Onub_peptides_filt.fasta"
touch "${supporting_file_dir}/Dmel_peptides_filt.fasta"

# Loop through the gene-to-protein mapping and extract the representative peptides
awk '{print $2}' "${supporting_file_dir}/onub_gp_mapping.txt" | \
while read protein_id; do
    # Use seqkit to extract the protein sequence for the given protein_id from the FASTA file
    # Match by protein accession (assuming the format of headers is like >XP_063820879.1 \t description)
    seqkit grep -p "${protein_id}" "${supporting_file_dir}/Onub_peptides.fasta" >> "${supporting_file_dir}/Onub_peptides_filt.fasta"
done

