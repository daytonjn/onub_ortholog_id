#!/bin/bash

# Download table with one sequence per gene (representatives) for Ostrinia nubilalis GCF_963855985.1
# onub_gp_table.tsv

# Download table with one sequence per gene (representatives) for Drosophila melanogaster GCF_000001215.4
# bmor_ggp_table.tsv
# dmel_gp_table.tsv

# Download gene tables from NCBI (https://www.ncbi.nlm.nih.gov/datasets/gene/)
# bmor_gene_names.tsv
# dmel_gene_names.tsv

#path to RefSeq peptide fasta files from NCBI and their BLAST+ db location
supporting_file_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/supporting_files/"

# Extract gene-to-protein mappings from the .tsv file
# $8 = NCBI Gene ID (######)
# $10 = Transcript accession (representative)
# $11 = Protein accession (representative)

awk -F'\t' 'BEGIN {OFS="\t"} {print $8, $11}' "${supporting_file_dir}onub_gp_table.tsv" > "${supporting_file_dir}onub_gp_mapping.txt"
awk -F'\t' 'BEGIN {OFS="\t"} {print $8, $11}' "${supporting_file_dir}dmel_gp_table.tsv" > "${supporting_file_dir}dmel_gp_mapping.txt"
awk -F'\t' 'BEGIN {OFS="\t"} {print $8, $11}' "${supporting_file_dir}bmor_gp_table.tsv" > "${supporting_file_dir}bmor_gp_mapping.txt"
