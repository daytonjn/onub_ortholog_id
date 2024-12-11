#!/bin/bash

module load anaconda/2024.06-py312
conda activate ortholog_id

#path to RefSeq peptide fasta files from NCBI and their BLAST+ db location
supporting_file_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/supporting_files/"

mkdir ${supporting_file_dir}

# Download RefSeq peptides for Bombyx mori assembly
datasets download genome accession GCF_030269925.1 \
	--include protein \
	--filename "${supporting_file_dir}Bmor_peptides.zip"
	
# Unzip the files to access the FASTA
unzip ${supporting_file_dir}Bmor_peptides.zip -d ${supporting_file_dir}Bmor


#Move peptide file to top of directory
cp ${supporting_file_dir}Bmor/ncbi_dataset/data/GCF_030269925.1/protein.faa ${supporting_file_dir}Bmor_peptides.fasta

#Clean up
#rm -f -r ${supporting_file_dir}Bmor
