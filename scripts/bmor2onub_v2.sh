#!/bin/bash
#SBATCH -c 1
#SBATCH -p batch
#SBATCH -o out_Bmor2Onub_v2.txt
#SBATCH -e err_Bmor2Onub_v2.txt
#SBATCH --mem=24gb
#SBATCH --time=0-6:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=jacob.dayton@tufts.edu

#path to RefSeq peptide fasta files from NCBI and their BLAST+ db location
supporting_file_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/supporting_files/"
output_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/output/"

mkdir ${output_dir}

#load BLAST+ module
module load blast-plus/2.11.0

#BLAST+ from Bmor query to Onub reference database

blastp -query ${supporting_file_dir}Bmor_peptides_filt.fasta -db ${supporting_file_dir}Onub-db \
-max_target_seqs 5 -max_hsps 1 -out ${output_dir}Bmor2Onub_blastp_v2.txt -evalue 0.001 -outfmt 6
