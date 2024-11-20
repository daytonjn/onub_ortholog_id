# Ortholog identification by Reciprocal Best Hits (RBH)

**Species A:** *O. nubilalis* (Onub) <br>
**Species B:** *D. melanogaster* (Dmel)

  1) Download RefSeq peptide files in FASTA from NCBI for Onub and Dmel
     - download_peptides.sh
  2) Filter peptide files for one representative protein for each gene (i.e., filter isoforms)
     - extract_gp_mappings.sh
     - filter_peptides.sh
  3) Make BLAST+ compatible database from filtered FASTA files
     - makeblastdb.sh
  4) BLASTp Onub2Dmel and Dmel2Onub and return top alignments
     - onub2dmel.sh (-max_target_seqs 1 -max_hsps 1 -evalue 0.0001) or onub2dmel_v2.sh (-max_target_seqs 5 -max_hsps 1 -evalue 0.001)
     - dmel2onub.sh or dmel2onub_v2.sh
  5) Identify RBH for each gene/peptide (results sorted by E-value, top hit = lowest E-value, highest bit score to break ties)
     - find_rbh_onub2dmel.ipynb or find_rbh_onub2dmel_v2.ipynb 
  6) Output table with Onub2Dmel orthologs and corresponding Dmel gene names

Dependencies:
- ncbi-datasets-cli
- seqkit
- blast==2.12.0
- Python3: pandas
