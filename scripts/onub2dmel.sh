#!/bin/bash
#SBATCH -c 1
#SBATCH -p batch
#SBATCH -o out_makeblastdb.txt
#SBATCH -e err_makeblastdb.txt
#SBATCH --mem=24gb
#SBATCH --time=0-16:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=jacob.dayton@tufts.edu

#path to RefSeq peptide fasta files from NCBI and their BLAST+ db location
supporting_file_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/supporting_files/"
output_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/output/"

#load BLAST+ module
module load blast-plus/2.11.0
#module load blast/2.8.1

#BLAST+ from Onub query to Dmel reference database
#max_target_seqs 1 = one subject/hit, but several HSPs if present
#max_hsps 5 = up to five HSPs per subject
blastp -query {$supporting_file_dir}Onub_peptide.fasta -db {$supporting_file_dir}Dmel_peptide-db \
-out {output_dir}Onub2Dmel_blastp.txt -max_target_seqs 1 -max_hsps 5 -outfmt 6

