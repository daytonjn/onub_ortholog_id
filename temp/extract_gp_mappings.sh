#!/bin/bash

# Download table with one sequence per gene (representatives) for Ostrinia nubilalis GCF_963855985.1

# Extract gene-to-protein mappings from the .tsv file
awk -F'\t' 'BEGIN {OFS="\t"} {print $7, $11}' "onub_gp_table.tsv" > "onub_gp_mapping.txt"
