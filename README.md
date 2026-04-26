# ChIP-seq Paired-End Analysis (Modular Bash Workflow)

This repository contains a step-wise, modular ChIP-seq analysis workflow implemented using individual Bash scripts.  
The pipeline was developed for *Arabidopsis thaliana* datasets and is designed to provide learning, transparency and flexibility in processing.

---

## 🧠 Design Philosophy

This workflow is intentionally implemented as separate scripts without automation or looping.

The goals are to:
- Provide full transparency into each analysis step  
- Allow step-by-step execution and debugging  
- Enable easy modification or replacement of individual components  

This approach is particularly useful for learning, teaching, and exploratory analysis.

---

## 📂 Pipeline Steps

Each step of the pipeline is executed independently:

1. Trimming  
2. Alignment  
3,4. Post-processing (sorting, indexing)  
5. Peak Calling
6. Counting
7,8. QC

Example execution:

```bash

# Step 1: Trimming
bash scripts/02_trimming.sh sample_R1.fastq.gz sample_R2.fastq.gz output/

✂️ Trimming (Example Step)

Adapter removal and quality trimming is performed using Trimmomatic.

Parameters used:
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2 → Adapter removal
LEADING:3 → Remove low-quality bases from start
TRAILING:3 → Remove low-quality bases from end
SLIDINGWINDOW:4:15 → Trim when average quality drops below 15
MINLEN:35 → Discard reads shorter than 35 bp

Reads shorter than 35 bp are removed to improve alignment quality and reduce ambiguous mapping.

🛠 Tools Used
Trimmomatic
Bowtie2
SAMtools
deepTools
MACS2
bedtools

📁 Directory Structure
scripts/        # Individual scripts for each step
input/          # Input FASTQ files
output/         # Output files

🚀 How to Use
Clone the repository:
git clone https://github.com/Aakankshas90/ChIP-seq_pairedend.git
cd ChIP-seq_pairedend
Run each step manually using the provided scripts (see example above).
Modify paths and parameters in scripts as needed.

⚠️ Limitations
Processes one dataset at a time
Requires manual execution of each step
No built-in parallelization or workflow management
Paths and tool locations may need to be adjusted by the user

🚀 Future Improvements
Add batch processing (looping over multiple samples)
Convert to a Nextflow-based workflow
Add containerization (Docker/Singularity)
Improve parameterization and configuration handling

📌 Notes
Optimized for Arabidopsis thaliana datasets
Can be adapted for other organisms with appropriate reference files

