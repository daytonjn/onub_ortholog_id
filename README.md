# Ortholog identification by Reciprocal Best Hits (RBH)

**Species A:** *O. nubilalis* (Onub) <br>
**Species B:** *D. melanogaster* (Dmel)

  1) Download RefSeq peptide files in FASTA from NCBI for Onub and Dmel
  2) Make BLAST+ compatible database from FASTA files
  3) BLASTp Onub2Dmel and Dmel2Onub
  4) Retain top alignments for each set of alignments (-max_target_seqs 5 -max_hsps 1)
  5) Identify RBH for each gene/peptide (BLASTp results sorted by E-value, top hit = lowest E-value, highest bit score to break ties)
  6) Output table with Onub2Dmel orthologs and corresponding Dmel gene names
