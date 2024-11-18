#!/bin/bash
#SBATCH -c 1
#SBATCH -p batch
#SBATCH -o out_makeblastdb.txt
#SBATCH -e err_makeblastdb.txt
#SBATCH --mem=24gb
#SBATCH --time=0-1:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=jacob.dayton@tufts.edu

#path to location of RefSeq peptide fasta files from NCBI 
supporting_file_dir="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/supporting_files/"

#load BLAST+ module
module load blast-plus/2.11.0

#make databases for BLAST+ (command historically was formatdb)
makeblastdb -in ${supporting_file_dir}Onub_peptides.fasta -dbtype prot -out ${supporting_file_dir}Onub-db -parse_seqids
makeblastdb -in ${supporting_file_dir}Dmel_peptides.fasta -dbtype prot -out ${supporting_file_dir}Dmel-db -parse_seqids