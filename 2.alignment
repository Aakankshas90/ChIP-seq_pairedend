# Make index of reference genome and align paired end reads to the reference using bowtie2

## Index of reference genome
bowtie2-build --threads 8 -f reference_genome/TAIR10_chr_all.fas reference_genome/TAIR10_chr_all-index

# This will perform the following:
# Build an index of the reference genome (TAIR10) for alignment
# --threads 8: uses 8 CPU threads to speed up indexing
# -f: indicates that the input is in FASTA format

## Alignment
bowtie2 -p 8 -x reference_genome/TAIR10_chr_all-index -1 wt1_R1.fq -2 wt1_R2.fq -S wt1.sam 2> wt1_log.txt

# This will perform the following:
# Align paired-end reads to the indexed reference genome
# -p 8: uses 8 CPU threads for alignment
# -x: specifies the prefix of the Bowtie2 index
# -1: forward reads file (R1)
# -2: reverse reads file (R2)
# -S: output SAM file containing alignment results
# Generate a log file (wt1_log.txt)
  # Contains alignment statistics such as:
  # total reads processed
  # percentage of mapped reads
  # concordant and discordant alignments
