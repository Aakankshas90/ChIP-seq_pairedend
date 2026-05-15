# Convert SAM to BAM, sort, mark duplicates, filter reads, and prepare files for downstream analysis using :contentReference[oaicite:0]{index=0} and :contentReference[oaicite:1]{index=1}

## Convert SAM to BAM
samtools view -S -b wt.sam -@ 16 > wt.bam

#sort bam file
samtools sort wt.bam -@ 16 -o wt_sort.bam

# sambamba mark the duplicated reads
sambamba markdup wt_sort.bam wt_sort_markdup.bam

## Remove chloroplast (ChrC) and mitochondrial (ChrM) chromosomes
samtools view -b wt_sort_markdup.bam Chr1 Chr2 Chr3 Chr4 Chr5 > wt.noCM.bam

#index
samtools index -@ 16 wt.noCM.bam

# filter
samtools view -b -F 1804 -q 30 wt_sort_markdup.bam -@ 16 -o wt_filt.bam
### samflag = 1804
    - read unmapped (0x4)
    - mate unmapped (0x8)*
    - not primary alignment (0x100)
    - read fails platform/vendor quality checks (0x200)
    - read is PCR or optical duplicate (0x400)
      - *Warning: Flag(s) and 0x8 cannot be set when read is not paired

# index
samtools index -@ 16 wt_filt.bam

#merge bam files
samtools merge merged.bam 1.nochrCM_fltsort.bam 2.nochrCM_fltsort.bam 4.nochrCM_fltsort.bam
