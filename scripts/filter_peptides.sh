#!/bin/bash

module load anaconda
conda activate ortholog_id

# Path to RefSeq peptide fasta files from NCBI and their BLAST+ db location
supporting_file_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/supporting_files/"

# Index the RefSeq peptide FASTA files to improve speed/access
seqkit faidx "${supporting_file_dir}/Onub_peptides.fasta"
seqkit faidx "${supporting_file_dir}/Dmel_peptides.fasta"

# Use awk to extract protein IDs and output ids to a separate file for input to sewkit faidx
awk 'NR > 1 {print $2}' "${supporting_file_dir}/onub_gp_mapping.txt" > "${supporting_file_dir}/onub_peptide_ids.txt"
awk 'NR > 1 {print $2}' "${supporting_file_dir}/dmel_gp_mapping.txt" > "${supporting_file_dir}/dmel_peptide_ids.txt"

# Use seqkit faidx with the --id-file option
seqkit faidx "${supporting_file_dir}/Onub_peptides.fasta" -l "${supporting_file_dir}/onub_peptide_ids.txt" > "${supporting_file_dir}/Onub_peptides_filt.fasta"
seqkit faidx "${supporting_file_dir}/Dmel_peptides.fasta" -l "${supporting_file_dir}/dmel_peptide_ids.txt" > "${supporting_file_dir}/Dmel_peptides_filt.fasta"