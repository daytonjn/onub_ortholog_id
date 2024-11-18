#!/bin/bash
#SBATCH -c 1
#SBATCH -p batch
#SBATCH -o out_OnubtoDmel.txt
#SBATCH -e err_OnubtoDmel.txt
#SBATCH --mem=24gb
#SBATCH --time=0-16:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=jacob.dayton@tufts.edu

#path to RefSeq peptide fasta files from NCBI and their BLAST+ db location
supporting_file_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/supporting_files/"
output_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/output/"

mkdir ${output_dir}

#load BLAST+ module
module load blast-plus/2.11.0

#BLAST+ from Onub query to Dmel reference database

blastp -query ${supporting_file_dir}Onub_peptides.fasta -db ${supporting_file_dir}Dmel-db \
-max_target_seqs 1 -max_hsps 1 -out ${output_dir}Onub2Dmel_blastp.txt -evalue 0.0001 -outfmt 6
