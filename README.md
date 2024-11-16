# Reciprocal Best Hits by BLAST to conservatively identify orthologs

Species A: *O. nubilalis* (Onub)
Species B: *D. melanogaster* (Dmel)

  1) Download RefSeq peptide files in FASTA from NCBI for Onub and Dmel
  2) Make BLAST+ compatible database from FASTA files
  3) BLAST Onub2Dmel and Dmel2Onub
  4) Retain Top Hits for each set of alignments
  5) Identify RBH for each gene/peptide
  6) Output table with Onub2Dmel orthologs and corresponding Dmel gene names
