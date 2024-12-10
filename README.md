# Ortholog identification by Reciprocal Best Hits (RBH)

**Purpose:** Following RNAseq analysis for DEGs between Onub strains (univoltine/bivoltine) and environments (long-day vs. short-day environment), it is essential to understand which functional pathways/gene sets contribute to the strain differences in diapause induction and post-diapause development (key factors determining the voltinism and agroeconomic pest potential of Onub). In order to leverage annotations from model systems and assign meaning to the Onub LOC### IDs, orthologs are identified with Dmel by RBH.  

**Species A:** *O. nubilalis* (Onub) <br>
**Species B1:** *D. melanogaster* (Dmel) <br>
**Species B2:** *B. mori* (Bmor)

**Analysis Workflow:**
  1) Download RefSeq peptide files in FASTA from NCBI for Onub (GCF_963855985.1) and Dmel (GCF_000001215.4)
     - download_peptides.sh
  2) Filter peptide files for one representative protein for each gene (i.e., filter isoforms)
     - Download the species RefSeq genome annotation table with one sequence per gene (representatives) to $supporting_file_dir (i.e., onub_gp_table.tsv)
     - extract_gp_mappings.sh (input: onub_gp_table.tsv; output: onub_gp_mapping.txt)
     - filter_peptides.sh (input: Onub_peptides.fasta & onub_gp_mapping.txt; output: Onub_peptides_filt.fasta)
  4) Make BLAST+ compatible database from filtered FASTA files
     - makeblastdb.sh (input: Onub_peptides_filt.fasta; output: Onub-db)
  5) BLASTp Onub2Dmel and Dmel2Onub and return top alignments
     - onub2dmel.sh (-max_target_seqs 1 -max_hsps 1 -evalue 0.0001)
     - onub2dmel_v2.sh (-max_target_seqs 5 -max_hsps 1 -evalue 0.001)
     - dmel2onub.sh or dmel2onub_v2.sh
  6) Identify RBH for each gene/peptide (results sorted by E-value, top hit = lowest E-value, highest bit score to break ties)
     - find_rbh_onub2dmel.ipynb (output: OnubDmel_rbh.txt) 
     - find_rbh_onub2dmel_v2.ipynb (output: OnubDmel_rbh_v2.txt) 
  7) Output table with Onub2Dmel orthologs (XP_## & NP_##) and corresponding Dmel gene names (NCBI Gene ID, Symbol, Description)
     - Download species gene tables from [NCBI datasets](https://www.ncbi.nlm.nih.gov/datasets/gene/) (i.e., onub_genes_all.tsv)
     - join_gp_tables.ipynb (input: dmel_gp_mapping.txt, dmel_genes_all.tsv, OnubDmel_rbh_v2.txt; output: OnubDmel_rbh_v2_final.txt)

<ins>Dependencies:</ns>
- ncbi-datasets-cli
- seqkit
- blast==2.12.0
- Python3: pandas  
