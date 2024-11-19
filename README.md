# Ortholog identification by Reciprocal Best Hits (RBH)

**Species A:** *O. nubilalis* (Onub) <br>
**Species B:** *D. melanogaster* (Dmel)

  1) Download RefSeq peptide files in FASTA from NCBI for Onub and Dmel
  2) Filter peptide files for non-redundant representative peptides for each gene
  3) Make BLAST+ compatible database from filtered FASTA files
  4) BLASTp Onub2Dmel and Dmel2Onub
  5) Retain top alignments for each set of alignments (-max_target_seqs 5 -max_hsps 1)
  6) Identify RBH for each gene/peptide (BLASTp results sorted by E-value, top hit = lowest E-value, highest bit score to break ties)
  7) Output table with Onub2Dmel orthologs and corresponding Dmel gene names
