#!/bin/bash
#SBATCH -c 2
#SBATCH -p batch
#SBATCH -o out_makeblastdb.txt
#SBATCH -e err_makeblastdb.txt
#SBATCH --mem=24gb
#SBATCH --time=0-4:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=jacob.dayton@tufts.edu

#path to location of RefSeq peptide fasta files from NCBI 
supporting_file_directory="/cluster/tufts/dopmanlab/Jacob/onub_ortholog_id/supporting_files/"

#load BLAST+ module
module load blast-plus/2.11.0

#make databases for BLAST+ (command historically was formatdb)
makeblastdb -in {$supporting_file_directory}Onub_peptide.fasta -dbtype nucl -out {$supporting_file_directory}Onub_peptide -parse_seqids
makeblastdb -in {$supporting_file_directory}Dmel_peptide.fasta -dbtype nucl -out {$supporting_file_directory}Dmel_peptide -parse_seqids