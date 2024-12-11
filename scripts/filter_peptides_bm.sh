#!/bin/bash

module load anaconda
conda activate ortholog_id

# Path to RefSeq peptide fasta files from NCBI and their BLAST+ db location
supporting_file_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/supporting_files/"

# Index the RefSeq peptide FASTA files to improve speed/access
seqkit faidx "${supporting_file_dir}/Bmor_peptides.fasta"


# Use awk to extract protein IDs and output ids to a separate file for input to sewkit faidx
awk 'NR > 1 {print $2}' "${supporting_file_dir}/bmor_gp_mapping.txt" > "${supporting_file_dir}/bmor_peptide_ids.txt"


# Use seqkit faidx with the --id-file option
seqkit faidx "${supporting_file_dir}/Bmor_peptides.fasta" -l "${supporting_file_dir}/bmor_peptide_ids.txt" > "${supporting_file_dir}/Bmor_peptides_filt.fasta"


# Clean up and rm peptide_id files
rm "${supporting_file_dir}/bmor_peptide_ids.txt"