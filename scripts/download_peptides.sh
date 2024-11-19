#!/bin/bash

module load anaconda/2024.06-py312
conda activate ortholog_id

#path to RefSeq peptide fasta files from NCBI and their BLAST+ db location
supporting_file_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/supporting_files/"

mkdir ${supporting_file_dir}

# Download RefSeq peptides for Drosophila melanogaster 
datasets download genome accession GCF_000001215.4 \
	--include protein \
	--filename "${supporting_file_dir}Dmel_peptides.zip"
    
# Download RefSeq peptides for Ostrinia nubilalis assembly
datasets download genome accession GCF_963855985.1 \
	--include protein \
	--filename "${supporting_file_dir}Onub_peptides.zip"
	
# Unzip the files to access the FASTA
unzip ${supporting_file_dir}Dmel_peptides.zip -d ${supporting_file_dir}Dmel
unzip ${supporting_file_dir}Onub_peptides.zip -d ${supporting_file_dir}Onub


#Move peptide file to top of directory
cp ${supporting_file_dir}Dmel/ncbi_dataset/data/GCF_000001215.4/protein.faa ${supporting_file_dir}Dmel_peptides.fasta
cp ${supporting_file_dir}Onub/ncbi_dataset/data/GCF_963855985.1/protein.faa ${supporting_file_dir}Onub_peptides.fasta

#Clean up
#rm -f -r ${supporting_file_dir}Dmel
#rm -f -r ${supporting_file_dir}Onub
