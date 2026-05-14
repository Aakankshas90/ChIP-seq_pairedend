Assess quality of raw sequencing reads using FastQC

## Run FastQC on paired-end reads
fastqc -t 16 \
wt1_R1.fastq.gz wt1_R2.fastq.gz \
-o fastqc_output/

## (Optional) Run FastQC on multiple samples
fastqc -t 16 \
1_1.fastq.gz 2_1.fastq.gz 3_1.fastq.gz 4_1.fastq.gz 5_1.fastq.gz 6_1.fastq.gz \
1_2.fastq.gz 2_2.fastq.gz 3_2.fastq.gz 4_2.fastq.gz 5_2.fastq.gz 6_2.fastq.gz \
-o fastqc_output/

# Combine results from multiple FastQC reports into a single summary using MultiQC

## Run MultiQC on FastQC output directory
multiqc fastqc_output/ -o multiqc_output/
